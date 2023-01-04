# Album Model and Repository Classes Design Recipe

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

```
# EXAMPLE

Table: albums

Columns:
id | title | release_year | artist_id
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

TRUNCATE TABLE albums RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO students (name, cohort_name) VALUES ('David', 'April 2022');
INSERT INTO students (name, cohort_name) VALUES ('Anna', 'May 2022');
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
class Album
end

class AlbumRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
class Album
  attr_accessor :id, :title, :release_year, :artist_id
```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
class AlbumRepository

  def all
    # Executes SQL query:
    # SELECT * FROM albums;
  end

  def find(name)
  # Executes SQL query:
  # SELECT id, title, release_year FROM albums WHERE artist_name = name;
  end

  def add(title, release_year)
    # Executes SQL query:
    # INSERT INTO albums (title, release_year) VALUES(title, release_year)
  end

  def delete(title)
  # Executes SQL query:
  # DELETE FROM albums WHERE title=title
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# Get all albums

repo = AlbumRepository.new

albums = repo.all

albums[0].id # => 1
albums[0].title # => Doolittle
albums[0].release_year # => 1998 
albums[0].artist_id # => 1

# Find intance
repo = AlbumRepository.new

albums = repo.find('Surfer Rosa')

albums[0].id # => 2
albums[0].title # => Surfer Rosa
albums[0].release_year # => 1988 
albums[0].artist_id # => 1

# Add album
repo = AlbumRepository.new

albums = repo.add('Best hits', '1999')

albums[0].id # => 13
albums[0].title # => Best hits
albums[0].release_year # => 1999 
albums[0].artist_id # => 

# Delete album
repo = AlbumRepository.new

albums = repo.delete('Best hits')

albums[0].id # => 
albums[0].title # => 
albums[0].release_year # => 
albums[0].artist_id # => 
```

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_students_table
  seed_sql = File.read('spec/seeds_students.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'students' })
  connection.exec(seed_sql)
end

describe StudentRepository do
  before(:each) do 
    reset_students_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour