use anyhow::{Context, Ok};
use axum::routing::post;
use axum::{Router, extract::State, routing::get};
use sqlx::postgres::PgPoolOptions;
use std::sync::Arc;
use tracing::instrument;
use tracing_subscriber::EnvFilter;

use crate::app_state::AppState;
// use crate::handlers::{self, need_login};
use crate::repo::table_of_book::{InsertionLevel, TableOfBook};

mod app_state;
mod auth;
mod db;
mod handlers;
mod repo;

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    #[cfg(debug_assertions)]
    {
        println!("⚠️ Debug Mode, Load .env 文件...");
        dotenv::dotenv().ok();
    }
    set_logs();

    let pool: sqlx::Pool<sqlx::Postgres> = PgPoolOptions::new()
        .max_connections(5)
        .connect(&std::env::var("DATABASE_URL")?)
        .await?;
    migrate(&pool).await?;

    let app_state = Arc::new(AppState {
        // pool: pool.clone(),
        table_of_book: Box::new(TableOfBook::new(pool)),
    });

    // build our application with a single route
    let app = Router::new()
        .route("/", get(get_foo))
        .route("/need_login", get(crate::handlers::need_login))
        .route("/login", post(crate::handlers::login::login))
        .with_state(app_state);

    let addr = "0.0.0.0:3000";
    tracing::info!("Listening {addr}");
    // run our app with hyper, listening globally on port 3000
    let listener = tokio::net::TcpListener::bind(addr).await?;
    axum::serve(listener, app).await?;

    Ok(())
}

async fn get_foo(State(state): State<Arc<AppState>>) {
    let model = InsertionLevel {
        title: "内科学",
        parent_id: None,
        level: db::LevelTypeEnum::Book,
        order: 1,
    };

    let res = state.table_of_book.insert_level(&model).await.unwrap();

    println!("get_foo: {res}");
}

#[instrument]
async fn migrate(pool: &sqlx::Pool<sqlx::Postgres>) -> anyhow::Result<()> {
    tracing::debug!("start migration");
    sqlx::migrate!("./migrations")
        .run(pool)
        .await
        .context("Migration failed")?;
    tracing::debug!("start finish");

    Ok(())
}

fn set_logs() {
    let subscriber = tracing_subscriber::fmt()
        // 使用 EnvFilter
        // 它会查找名为 RUST_LOG 的环境变量来设置过滤规则。
        // 例如：RUST_LOG=info,my_crate::module=debug
        .with_env_filter(EnvFilter::from_default_env())
        .finish();

    tracing::subscriber::set_global_default(subscriber).expect("无法设置全局追踪订阅者");

    tracing::trace!("trace enabled");
    tracing::debug!("debug enabled");
    tracing::info!("info enabled");
    tracing::warn!("warn enabled");
    tracing::error!("error enabled");
}
