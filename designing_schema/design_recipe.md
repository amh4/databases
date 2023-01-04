# Single Table Design Recipe Template

## 1. Extract nouns from the user stories or specification

```
As a coach
So I can get to know all students
I want to see a list of students' names.

As a coach
So I can get to know all students
I want to see a list of students' cohorts.

```
Nouns:

students
students names
student cohorts

Verbs:
List names
List cohorts
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| student_directory_1   | 
| --------------------- |
| Names, Cohorts        | 

Name of the table (always plural): `albums` 

Column names: `Names`, `cohort`

## 3. Decide the column types.

Name => string
Cohort => int

## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: student_table.sql

-- Replace the table name, columm names and types.

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  names text,
  cohort int
);
```

## 5. Create the table.

```bash
psql -h 127.0.0.1 students < albums_table.sql
```