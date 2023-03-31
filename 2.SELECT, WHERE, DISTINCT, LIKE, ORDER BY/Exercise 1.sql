# 1. Print all movie titles and release year for all Marvel Studios movies.
# 2. Print all movies that have Avenger in their name.
# 3. Print the year when the movie "The Godfather" was released.
# 4. Print all distinct movie studios in the Bollywood industry.

select * from moviesdb.movies;

# 1. Print all movie titles and release year for all Marvel Studios movies.
select title, release_year from moviesdb.movies where studio="Marvel Studios";
# 2. Print all movies that have Avenger in their name.
select * from moviesdb.movies where title like '%Avenger%';

# 3. Print the year when the movie "The Godfather" was released.
select * from moviesdb.movies where  title = "The Godfather";

# 4. Print all distinct movie studios in the Bollywood industry.
select distinct studio from moviesdb.movies where industry='Bollywood';