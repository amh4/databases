# Single Table Design Recipe Template

## 1. Extract nouns from the user stories or specification

```
As a person who loves movies,
So I can list all my favourite movies
I want to see a list of movies' titles.

As a person who loves movies,
So I can list all my favourite movies
I want to see a list of movies' genres.

As a person who loves movies,
So I can list all my favourite movies
I want to see a list of movies' release year.

```
Nouns:

movies titles
favourite movie
genre
release_year

Verbs:
List
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| movies                | 
| --------------------- |
| Titles, favourite, genre, release_year        | 


## 3. Decide the column types.

Titles => string
favourite = > string
genre => string
release_year => int

## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: movies_table.sql

-- Replace the table name, columm names and types.

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  titles text,
  favourite int,
  genre text,
  release_year text,
);
```

## 5. Create the table.

```bash
psql -h 127.0.0.1 students < albums_table.sql
```