CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  user_name text,
  email_address text
);

-- Then the table with the foreign key.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  content text,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);