CREATE TABLE blog_posts
(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  description TEXT,
  content TEXT,
  author VARCHAR(255),
  created_at TIMESTAMP

);


CREATE TABLE comments
(
  id SERIAL8 PRIMARY KEY,
  comment TEXT,
  author VARCHAR(255),
  created_at TIMESTAMP
);

ALTER TABLE comments ADD COLUMN blog_posts_id INTEGER REFERENCES blog_posts(id);

SELECT * 
FROM comments
INNER JOIN blog_posts ON comments.blog_posts_id = blog_posts.id;