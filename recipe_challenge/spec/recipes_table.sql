CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  recipe text,
  average_cooking_time int,
  rating int
);

INSERT INTO recipes (recipe, average_cooking_time, rating) VALUES ('Pasta', 10, 7);
INSERT INTO recipes (recipe, average_cooking_time, rating) VALUES ('Stiry Fry', 3, 4);
INSERT INTO recipes (recipe, average_cooking_time, rating) VALUES ('Toastie', 5, 10);