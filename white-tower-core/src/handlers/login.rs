use axum::{
    http::StatusCode,
    response::{IntoResponse, Response},
};
use chrono::{Duration, Utc};
use thiserror::Error;

use crate::auth::{Claims, issue_token};

#[derive(Debug, Error)]
pub enum LoginError {
    #[error("issue JWT failed")]
    IssueToken,
}

impl IntoResponse for LoginError {
    fn into_response(self) -> Response {
        (
            StatusCode::INTERNAL_SERVER_ERROR,
            "Authentication service failed",
        )
            .into_response()
    }
}

pub async fn login() -> Result<String, LoginError> {
    let now = Utc::now();

    // 2. 定义一周的时间长度 (7 天)
    // 注意：Duration::weeks(1) 也可以，但 Duration::days(7) 更常用。
    let one_week = Duration::days(7);

    // 3. 计算一周后的时间点
    let one_week_later = now
        .checked_add_signed(one_week)
        // checked_add_signed 返回 Option，处理溢出情况（虽然在这里不太可能）
        .expect("时间计算溢出，无法获取一周后的时间");

    // 4. 将新的时间点转换为 Unix 时间戳（秒数）
    // timestamp() 方法返回自 1970 年以来的秒数，类型为 i64
    let exp = one_week_later.timestamp();

    let claims = Claims {
        user_id: 0,
        username: "USERNAME".to_owned(),
        exp,
    };

    issue_token(claims).map_err(|e| {
        tracing::error!("issue_token failed: {e}");
        LoginError::IssueToken.into()
    })
}
