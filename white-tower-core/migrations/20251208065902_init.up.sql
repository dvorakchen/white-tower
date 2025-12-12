-- Add up migration script here
-- 1. 创建枚举类型，包含所有层级值
CREATE TYPE level_type_enum AS ENUM (
    '本', -- 新增的顶层类型，代表教材本身
    '篇',
    '章',
    '节',
    '附'
);

CREATE TABLE
    table_of_book (
        id SERIAL PRIMARY KEY,
        parent_id INT REFERENCES table_of_book (id), -- 自引用外键
        level_type level_type_enum NOT NULL, -- 使用新的枚举类型
        title VARCHAR(255) NOT NULL,
        order_in_parent INT NOT NULL,
        create_at TIMESTAMP
        WITH
            TIME ZONE NOT NULL DEFAULT now ()
    );

-- 创建索引以加速查询
CREATE INDEX idx_toc_parent_id ON table_of_book (parent_id);