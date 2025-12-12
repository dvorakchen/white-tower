-- Add down migration script here
-- Down migration script
-- 1. 删除索引 (可选，但推荐先删除依赖对象)
DROP INDEX IF EXISTS idx_toc_parent_id;

-- 2. 删除表
-- 必须在删除枚举类型之前删除表，因为表依赖于枚举类型。
-- 使用 CASCADE 选项可以级联删除依赖于该表的任何对象（如果存在，例如视图），
-- 但更安全的是先明确删除依赖项。这里我们直接删除表。
DROP TABLE IF EXISTS table_of_book;

-- 3. 删除枚举类型
-- 确保在删除表之后再删除枚举类型，避免依赖错误。
DROP TYPE IF EXISTS level_type_enum;