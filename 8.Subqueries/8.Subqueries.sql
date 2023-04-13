# In this lecture, we will cover subqueries.
Use moviesdb;

# print movies with highest imdb_rating
select * from movies order by imdb_rating desc limit 5;

# More efficent way to do it
select max(imdb_rating) from movies;

# You can also do this with subqueries
select * from movies where imdb_rating = (select max(imdb_rating) from movies);
select * from movies where imdb_rating = (select min(imdb_rating) from movies);

# subqueries are nothing but a query inside a query, you can have n numbers of queries

# Returned a "single values"
select * from movies where imdb_rating = (select max(imdb_rating) from movies);

#  Returned a "list of values"
select * from movies 
where imdb_rating in (
(select max(imdb_rating) from movies),
(select min(imdb_rating) from movies));

#  Returned a "table or number of rows"
# it produces an error here because "where" clause gets executed first
select name, year(curdate())-birth_year as current_age from actors
where current_age in (
(select current_age > 70),
(select current_age < 85));

# Make this as a table instead of a column
select name, year(curdate())-birth_year as current_age from actors as age_actors; 

# Use subqueries
select * from 
(select name, year(curdate())-birth_year as current_age from actors) as age_actors
where current_age > 70 and current_age < 85;


