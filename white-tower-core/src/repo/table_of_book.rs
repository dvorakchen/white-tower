use super::entries::TableOfBook as TableOfBookEntry;
use crate::{db::LevelTypeEnum, repo::RepoError};
use anyhow::{Context, Ok};
use tracing::instrument;

#[derive(Debug)]
pub struct InsertionLevel<'a> {
    pub title: &'a str,
    pub parent_id: Option<i32>,
    pub level: LevelTypeEnum,
    pub order: i32,
}

#[async_trait::async_trait]
pub trait TableOfBookService: Send + Sync {
    async fn insert_level<'a>(&self, model: &InsertionLevel<'a>) -> anyhow::Result<i32>;

    async fn query_by_title(&self, title: &str) -> anyhow::Result<Option<TableOfBookEntry>>;
}

#[derive(Debug)]
pub struct TableOfBook {
    pool: sqlx::Pool<sqlx::Postgres>,
}

impl TableOfBook {
    pub fn new(pool: sqlx::Pool<sqlx::Postgres>) -> Self {
        Self { pool }
    }
}

#[async_trait::async_trait]
impl TableOfBookService for TableOfBook {
    async fn query_by_title(&self, title: &str) -> anyhow::Result<Option<TableOfBookEntry>> {
        let trimmed_title = title.trim();

        // 1. 使用 sqlx::query_as! 宏并指定返回类型 TableOfBookEntry
        sqlx::query_as!(
            TableOfBookEntry,
            r#"
            SELECT
                id,
                parent_id,
                level_type AS "level_type: LevelTypeEnum", -- 显式映射枚举类型
                title,
                order_in_parent,
                create_at
            FROM
                table_of_book
            WHERE
                title = $1
            "#,
            trimmed_title // 参数绑定 $1
        )
        // 2. 使用 fetch_optional()
        // fetch_optional() 返回 Result<Option<T>, sqlx::Error>
        .fetch_optional(&self.pool)
        .await
        .map_err(|e| {
            // 将 sqlx::Error 转换为 anyhow::Error
            tracing::error!("Database query failed: {:?}", e);
            e
        })
        .context("查询数据库失败")
    }

    #[instrument]
    async fn insert_level<'a>(&self, model: &InsertionLevel<'a>) -> anyhow::Result<i32> {
        let title = model.title.trim();

        let mut tx = self.pool.begin().await?;

        let count: i64 = sqlx::query!(
            r#"
            SELECT 
                COUNT(*) AS total_count -- 别名为 total_count
            FROM 
                table_of_book 
            WHERE 
                title = $1
            "#,
            title
        )
        .fetch_one(&mut *tx)
        .await?
        .total_count
        .unwrap_or(0);

        if count > 0 {
            return Err(RepoError::DataExist(format!("table_of_book: title = {title}")).into());
        }

        // 使用 sqlx::query! 宏构建 SQL 语句
        let result = sqlx::query!(
            r#"
        INSERT INTO table_of_book (parent_id, level_type, title, order_in_parent)
        VALUES ($1, $2::level_type_enum, $3, $4)
        RETURNING id
        "#,
            // $1: parent_id (NULL)
            model.parent_id,
            // $2: level_type ('本')
            model.level as LevelTypeEnum,
            // $3: title
            title,
            // $4: order_in_parent
            model.order
        )
        // 必须指定 map() 或 fetch_one() 来执行查询并获取结果
        .fetch_one(&mut *tx)
        .await?;

        tx.commit().await?;
        // 返回新插入记录的 ID
        tracing::info!("Inserted level: id={}, title={}", result.id, model.title);
        Ok(result.id)
    }
}
