use crate::repo::table_of_book::TableOfBookService;

pub struct AppState {
    // pub pool: sqlx::Pool<sqlx::Postgres>,
    pub table_of_book: Box<dyn TableOfBookService>,
}
