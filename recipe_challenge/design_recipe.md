# Recipes Model and Repository Classes Design Recipe

## 1. Design and create the Table

As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep a list of all my recipes with their names.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep the average cooking time (in minutes) for each recipe.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to give a rating to each of the recipes (from 1 to 5).

Nouns:
recipe
cooking time
rating

Verbs:
List

```
# EXAMPLE

Table: recipes

Columns:
id | recipe | average_cooking_time | rating
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (recipe, average_cooking_time, rating) VALUES ('Pasta', 10, 7);
INSERT INTO recipes (recipe, average_cooking_time, rating) VALUES ('Stiry Fry', 3, 4);
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 recipes_directory_test < seeds_recipes.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
class RecipesRepository
end

class Recipes
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
class Recipes

  attr_accessor :id, :recipes, :average_cooking_time, :rating
end

```

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
class RecipesRepository
  def all
    # Returns all recipes
  end

  def find(name)
    # Returns record of specific recipe based on search criteria
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all recipes

repo = RecipesRepository.new

recipes = repo.all

recipes.length # =>  2

recipes[0].id # =>  1
recipes[0].recipe # =>  'Pasta'
recipes[0].average_cooking_time # =>  10
recipes[0].rating # =>  7

recipes[1].id # =>  2
recipes[1].recipe # =>  'Stir Fry'
recipes[1].average_cooking_time # =>  3
recipes[1].rating # =>  4

# 2
# Find a specific entry

repo = RecipesRepository.new

result = repo.find('Pasta')

recipes[0].id # =>  1
recipes[0].recipe # =>  'Pasta'
recipes[0].average_cooking_time # =>  10
recipes[0].rating # =>  7
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_recipes_table
  seed_sql = File.read('spec/recipes_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

describe RecipesRepository do
  before(:each) do 
    reset_recipes_table
  end

  # (your tests will go here).
end
```

# Create table for main db
-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  title text,
  release_year int
);

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._


1. Create seed sql
2. Create Table sql file
3. psql those
4. setup database connection class
5. spec_helper link to test db