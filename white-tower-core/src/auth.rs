use std::collections::BTreeMap;

use axum::{
    extract::FromRequestParts,
    http::{self, StatusCode, request::Parts},
    response::{IntoResponse, Response},
};
use chrono::Utc;
use hmac::{Hmac, Mac};
use jwt::{SignWithKey, VerifyWithKey};
use serde::{Deserialize, Serialize};
use sha2::Sha256;

// JWT Payload 结构体
#[derive(Debug, Deserialize, Serialize, Clone)]
pub struct Claims {
    pub user_id: i32,
    pub username: String,
    /// 过期时间戳，秒
    pub exp: i64,
}

// 自定义错误结构体，实现 IntoResponse
pub struct AuthError;

impl IntoResponse for AuthError {
    fn into_response(self) -> Response {
        (StatusCode::UNAUTHORIZED, "Invalid Token").into_response()
    }
}

impl<S> FromRequestParts<S> for Claims
where
    S: Send + Sync,
{
    type Rejection = AuthError;

    async fn from_request_parts(parts: &mut Parts, _state: &S) -> Result<Self, Self::Rejection> {
        // 1. 从 Authorization 头部获取 Token
        let auth_header = parts
            .headers
            .get(http::header::AUTHORIZATION)
            .and_then(|value| value.to_str().ok());

        let token = if let Some(header) = auth_header {
            if header.starts_with("Bearer ") {
                header.trim_start_matches("Bearer ").to_owned()
            } else {
                return Err(AuthError); // 格式错误
            }
        } else {
            return Err(AuthError); // 头部缺失
        };

        // 这一步需要实际的 JWT 解码和签名验证逻辑
        let claims = match decode_jwt(&token) {
            // 假设 decode_jwt 是您实现的验证函数
            Ok(c) => c,
            Err(_) => return Err(AuthError), // 验证失败
        };

        if claims.exp > Utc::now().timestamp() {
            return Err(AuthError);
        }

        // 3. 返回解析后的身份信息
        Ok(claims)
    }
}

pub fn issue_token(claims: Claims) -> anyhow::Result<String> {
    let key = std::env::var("JWT_KEY")?;
    let key: Hmac<Sha256> = Hmac::new_from_slice(key.as_bytes())?;

    let mut map = BTreeMap::new();
    map.insert("user_id", claims.user_id.to_string());
    map.insert("username", claims.username);
    map.insert("exp", claims.exp.to_string());

    let token = map.sign_with_key(&key)?;
    println!("{token}");
    Ok(token)
}

fn decode_jwt(token: &str) -> anyhow::Result<Claims> {
    let key = std::env::var("JWT_KEY")?;
    let key: Hmac<Sha256> = Hmac::new_from_slice(key.as_bytes())?;

    let claims: BTreeMap<String, String> = token.verify_with_key(&key).unwrap();

    Ok(Claims {
        user_id: claims["user_id"].parse()?,
        username: claims["username"].to_string(),
        exp: claims["exp"].parse()?,
    })
}

#[cfg(test)]
mod tests {
    use chrono::{Duration, Utc};

    use super::*;

    // 一个在测试运行前加载配置的辅助函数
    fn setup() {
        dotenv::from_filename(".env.test").ok();
    }

    #[test]
    fn issue() {
        setup();

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

        let token = issue_token(claims).unwrap();

        assert!(!token.is_empty())
    }

    #[test]
    fn decode_token() {
        setup();

        let claims = Claims {
            user_id: 0,
            username: "USERNAME".to_owned(),
            exp: 1,
        };

        let token = issue_token(claims.clone()).unwrap();

        let decode_claims = decode_jwt(&token).unwrap();

        assert_eq!(claims.user_id, decode_claims.user_id);
        assert_eq!(claims.username, decode_claims.username);
        assert_eq!(claims.exp, decode_claims.exp);
    }
}
