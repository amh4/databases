TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (recipe, average_cooking_time, rating) VALUES ('Pasta', 10, 7);
INSERT INTO recipes (recipe, average_cooking_time, rating) VALUES ('Stir Fry', 3, 4);