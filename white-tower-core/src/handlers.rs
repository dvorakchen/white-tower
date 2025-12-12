
pub mod login;

use crate::auth::Claims;

pub async fn need_login(claims: Claims) {
    let user_id = claims.user_id;
}
