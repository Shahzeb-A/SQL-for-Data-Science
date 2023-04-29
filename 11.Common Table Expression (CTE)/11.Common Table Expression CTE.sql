# Common Table Expression (or CTE) is a way to store the results of an SQL query temporarily so that you can use that in further complex queries 
# as if it is a table. In SQL interviews, questions are usually asked on CTE so make sure you pay close attention to this video. 

# get all actors whose age is between 70 and 85
Use moviesdb;
with actors_age as (select name as actor_name, year(curdate()) - birth_year as age from actors)
select actor_name,age from actors_age where age > 70 and age < 85;
# So basically you are storing your queries in CTE and it's much easier to use, just like functions in Python

# Movies that produced 500 % profit and their rating was less than the avg rating for all movies
# let's divide and conquer and solve this problem

# Part_1 : Movies that produced 500 % profit
SELECT *,(revenue - budget) * 100 / budget AS percentage_profit FROM financials having percentage_profit>500;
# Part_2 : Movie rating was less than the avg rating for all movies
select * from movies where imdb_rating < (select avg(imdb_rating) as average_rating from movies);

# Combine these two queries to get the final answer
# They both have movie_id in common so you can join them
select x.movie_id, x.percentage_profit, y.title, y.imdb_rating from (SELECT *,(revenue - budget) * 100 / budget AS percentage_profit FROM financials having percentage_profit>500) x
join (select * from movies where imdb_rating < (select avg(imdb_rating) as average_rating from movies)) y on x.movie_id = y.movie_id;

# this query is really complex because you're joining on subqueries and it can get complicated so let's use CTE to make it easier
with 
x as (SELECT *,(revenue - budget) * 100 / budget AS percentage_profit FROM financials having percentage_profit>500),
y as (select * from movies where imdb_rating < (select avg(imdb_rating) from movies))
select x.movie_id, x.percentage_profit, y.title, y.imdb_rating from x join y on x.movie_id = y.movie_id

