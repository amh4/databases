TRUNCATE TABLE posts, users RESTART IDENTITY;

INSERT INTO posts (title, content) VALUES ('Title1', 'Content1');
INSERT INTO posts (title, content) VALUES ('Title2', 'Content2');

INSERT INTO users (user_name, email_address) VALUES ('username1', 'email1');
INSERT INTO users (user_name, email_address) VALUES ('username2', 'email2');