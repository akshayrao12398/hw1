-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS studios;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS performances;

-- Create tables
CREATE TABLE studios (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT
);

CREATE TABLE movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  year INTEGER,
  rating TEXT,
  studio_id INTEGER,
  FOREIGN KEY (studio_id) REFERENCES studios(id)
);

CREATE TABLE actors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT
);

CREATE TABLE performances (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  movie_id INTEGER,
  actor_id INTEGER,
  character_name TEXT,
  FOREIGN KEY (movie_id) REFERENCES movies(id),
  FOREIGN KEY (actor_id) REFERENCES actors(id)
);

-- Insert studios
INSERT INTO studios (name) VALUES ('Warner Bros.');

-- Insert movies
INSERT INTO movies (title, year, rating, studio_id) VALUES
('Batman Begins', 2005, 'PG-13', 1),
('The Dark Knight', 2008, 'PG-13', 1),
('The Dark Knight Rises', 2012, 'PG-13', 1);

-- Insert actors
INSERT INTO actors (name) VALUES
('Christian Bale'),
('Michael Caine'),
('Liam Neeson'),
('Katie Holmes'),
('Gary Oldman'),
('Heath Ledger'),
('Aaron Eckhart'),
('Maggie Gyllenhaal'),
('Tom Hardy'),
('Joseph Gordon-Levitt'),
('Anne Hathaway');

-- Insert performances
INSERT INTO performances (movie_id, actor_id, character_name) VALUES
(1, 1, 'Bruce Wayne'),
(1, 2, 'Alfred'),
(1, 3, 'Ra''s Al Ghul'),
(1, 4, 'Rachel Dawes'),
(1, 5, 'Commissioner Gordon'),
(2, 1, 'Bruce Wayne'),
(2, 6, 'Joker'),
(2, 7, 'Harvey Dent'),
(2, 2, 'Alfred'),
(2, 8, 'Rachel Dawes'),
(3, 1, 'Bruce Wayne'),
(3, 5, 'Commissioner Gordon'),
(3, 9, 'Bane'),
(3, 10, 'John Blake'),
(3, 11, 'Selina Kyle');

-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
SELECT m.title, m.year, m.rating, s.name
FROM movies m
JOIN studios s ON m.studio_id = s.id
ORDER BY m.year;

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""

-- The SQL statement for the cast output
SELECT m.title, a.name, p.character_name
FROM movies m
JOIN performances p ON m.id = p.movie_id
JOIN actors a ON p.actor_id = a.id
ORDER BY m.title, p.character_name;
