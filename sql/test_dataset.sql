INSERT INTO users (user_email, user_password, user_name)
VALUES 
('user1@example.com', 'password1', 'User1'),
('user2@example.com', 'password2', 'User2'),
('user3@example.com', 'password3', 'User3');

INSERT INTO posts (post_title, post_content, post_user_name)
VALUES 
('Post 1', 'Content for Post 1-1', 'User1'),
('Post 2', 'Content for Post 2-1', 'User2'),
('Post 2', 'Content for Post 2-2', 'User2'),
('Post 3', 'Content for Post 3-1', 'User3'),
('Post 3', 'Content for Post 3-2', 'User3'),
('Post 2', 'Content for Post 2-3', 'User2'),
('Post 3', 'Content for Post 3-4', 'User3'),
('Post 3', 'Content for Post 3-5', 'User3'),
('Post 1', 'Content for Post 1-2', 'User1'),
('Post 3', 'Content for Post 3-6', 'User3');

INSERT INTO comments (comment_content, comment_post_id, comment_user_name)
VALUES 
('Comment 1 for Post 1', 1, 'User1'),
('Comment 2 for Post 1', 1, 'User1'),
('Comment 1 for Post 2', 2, 'User2'),
('Comment 2 for Post 2', 2, 'User3'),
('Comment 3 for Post 1', 1, 'User2'),
('Comment 1 for Post 4', 4, 'User3'),
('Comment 7 for Post 2', 2, 'User3'),
('Comment 1 for Post 10', 10, 'User2'),
('Comment 4 for Post 1', 1, 'User1'),
('Comment 1 for Post 3', 3, 'User3');