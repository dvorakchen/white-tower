pub mod entries;
pub mod table_of_book;

#[derive(thiserror::Error, Debug)]
pub enum RepoError {
    // #[error("Has no any data: {0}")]
    // NoData(String),
    #[error("{0}")]
    DataExist(String),
}
