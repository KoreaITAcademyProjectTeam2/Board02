CREATE TABLE users (
	user_email VARCHAR(255) PRIMARY KEY,
	user_password VARCHAR(255) NOT NULL,
	user_name VARCHAR(255) NOT NULL UNIQUE,
    user_signin_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	);

CREATE TABLE posts(
	post_id INT AUTO_INCREMENT PRIMARY KEY,
    post_title VARCHAR(255) NOT NULL,
    post_content TEXT NOT NULL,
    post_user_name VARCHAR(255),
    FOREIGN KEY (post_user_name) REFERENCES users(user_name),
    post_add_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
    
CREATE TABLE comments(
	comment_id INT AUTO_INCREMENT PRIMARY KEY,
	comment_content TEXT NOT NULL,
    comment_post_id INT,
    FOREIGN KEY (comment_post_id) REFERENCES posts(post_id),
    commment_add_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );