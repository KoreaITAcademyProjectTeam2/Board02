CREATE TABLE users (
	user_email VARCHAR(255) PRIMARY KEY,
	user_password VARCHAR(255) NOT NULL,
	user_name VARCHAR(255) NOT NULL,
    user_add_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	);

CREATE TABLE posts(
	post_id INT AUTO_INCREMENT PRIMARY KEY,
    post_content TEXT NOT NULL,
    post_user_email VARCHAR(255),
    post_add_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    post_modify_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_user_email) REFERENCES users(user_email)
    );
    
CREATE TABLE comments(
	comment_id INT AUTO_INCREMENT PRIMARY KEY,
	comment_content TEXT NOT NULL,
    comment_user_email VARCHAR(255),
    comment_post_id INT,
    comment_add_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comment_modify_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (comment_post_id) REFERENCES posts(post_id),
    FOREIGN KEY (comment_user_email) REFERENCES users(user_email)
    );