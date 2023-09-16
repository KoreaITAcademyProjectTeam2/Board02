CREATE TABLE post_likes(
	like_post_id INT,
    like_user_name VARCHAR(255),
    FOREIGN KEY (like_post_id) REFERENCES posts(post_id),
    FOREIGN KEY (like_user_name) REFERENCES users(user_id)
);
CREATE TABLE comment_likes(
    like_comment_id INT,
    like_user_name VARCHAR(255),
    FOREIGN KEY (like_comment_id) REFERENCES comments(comment_id),
    FOREIGN KEY (like_user_name) REFERENCES users(user_id)
);

CREATE TABLE tags(
	tag_post_id INT,
    tag_name VARCHAR(255),
    FOREIGN KEY (tag_post_id) REFERENCES posts(post_id)
);

CREATE TABLE attachment(
	file_post_id INT,
    file_name VARCHAR(255),
    FOREIGN KEY (file_post_id) REFERENCES posts(post_id)
);

CREATE TABLE admin(
    admin_user_name VARCHAR(255),
    authority VARCHAR(255)
    FOREIGN KEY (admin_user_name) REFERENCES users(user_id)
);

-- CREATE TABLE report(
-- 	report_post_id INT,
--     report_comment_id INT,
--     report_user_name VARCHAR(255),
--     FOREIGN KEY (report_post_id) REFERENCES posts(post_id),
--     FOREIGN KEY (report_comment_id) REFERENCES comments(comment_id),
--     FOREIGN KEY (report_user_name) REFERENCES users(user_name)
-- );

CREATE TABLE post_report(
    report_post_id INT,
    report_user_name VARCHAR(255),
    FOREIGN KEY (report_post_id) REFERENCES posts(post_id),
    FOREIGN KEY (report_user_name) REFERENCES users(user_name)
);

-- CREATE TABLE comment_report(
--     report_comment_id INT,
--     report_user_name VARCHAR(255),
--     FOREIGN KEY (report_comment_id) REFERENCES comments(comment_id),
--     FOREIGN KEY (report_user_name) REFERENCES users(user_name)
-- );