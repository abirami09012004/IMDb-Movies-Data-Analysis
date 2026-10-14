# Can you get all data about movies?
SELECT * FROM movies;
# How do you get all data about directors?
SELECT * FROM directors;
# Check how many movies are present in IMDB.
SELECT COUNT(*) AS total_movies FROM movies;
# Find these 3 directors: James Cameron ; Luc Besson ; John Woo
SELECT * FROM  directors 
WHERE name IN ('James Cameron', 'Luc Besson', 'John Woo');
# Find all directors with name starting with S.
SELECT * FROM directors 
WHERE name LIKE 'S%';
# Count female directors
SELECT COUNT(*) AS female_directors_count FROM directors 
WHERE gender = 1 ;
# Find the name of the 10th first women directors
SELECT name FROM directors 
WHERE gender = 1 
ORDER BY id 
LIMIT 1 OFFSET 9;
# What are the 3 most popular movies
SELECT title, popularity FROM movies 
ORDER BY popularity DESC 
LIMIT 3;
# What are the 3 most bankable movies
SELECT title, revenue FROM movies 
ORDER BY revenue DESC 
LIMIT 3;
# What is the most awarded average vote since the January 1st, 2000
SELECT MAX(vote_average) AS max_vote_average FROM movies 
WHERE release_date >= '2000-01-01';
# Which movies were directed by Brenda Chapman
SELECT m.title FROM movies m
JOIN directors d ON m.director_id = d.id
WHERE d.name = 'Brenda Chapman';
# Which director made the most movies
SELECT d.name, COUNT(m.id) AS movie_count 
FROM directors d
JOIN movies m ON d.id = m.director_id 
GROUP BY d.id, d.name 
ORDER BY movie_count DESC 
LIMIT 1;
# Which director is the most bankable
SELECT d.name, SUM(m.revenue) AS total_revenue 
FROM directors d
JOIN movies m ON d.id = m.director_id 
GROUP BY d.id, d.name 
ORDER BY total_revenue DESC 
LIMIT 1;