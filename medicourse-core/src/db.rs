use sqlx::Type;

// 必须与数据库中的 CREATE TYPE level_type_enum AS ENUM (...) 保持一致
#[derive(Debug, Clone, Copy, PartialEq, Eq, Type)]
// 派生 Type 特性，sqlx 将使用它进行类型映射
// sqlx 默认会查找与 Rust enum 同名的 PostgreSQL 类型
#[sqlx(type_name = "level_type_enum", rename_all = "lowercase")]
pub enum LevelTypeEnum {
    #[sqlx(rename = "本")] // 如果枚举值不是 ASCII 字母数字，使用 rename 属性
    Book, // '本'
    #[sqlx(rename = "篇")]
    Part, // '篇'
    #[sqlx(rename = "章")]
    Chapter, // '章'
    #[sqlx(rename = "节")]
    Section, // '节'
    #[sqlx(rename = "附")]
    Appendix, // '附'
}
