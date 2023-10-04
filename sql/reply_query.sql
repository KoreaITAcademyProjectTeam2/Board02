SELECT
comment_user_email, user_name
FROM
comments
JOIN users 
ON comment_user_email = user_email
WHERE
comment_post_id = 1
;
-- 게시글 아이디가 1인 게시글의 댓글 작성자의 이름을 조회하는 쿼리
