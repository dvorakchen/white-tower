use crate::db::LevelTypeEnum;

pub struct TableOfBook {
    pub id: i32,
    pub parent_id: Option<i32>,
    pub level_type: LevelTypeEnum,
    pub title: String,
    pub order_in_parent: i32,
    pub create_at: chrono::DateTime<chrono::Utc>,
}
