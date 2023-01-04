TRUNCATE TABLE albums RESTART IDENTITY;
TRUNCATE TABLE artists RESTART IDENTITY;

INSERT INTO artists (name, genre) VALUES ('Pixies', 'Rock');

INSERT INTO albums (title, release_year, artist_id) VALUES ('Doolittle', '1998', '1');
INSERT INTO albums (title, release_year, artist_id) VALUES ('Best hits', '2000', '1');