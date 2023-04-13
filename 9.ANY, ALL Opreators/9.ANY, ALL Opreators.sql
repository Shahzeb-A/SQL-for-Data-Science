# In this lecture, we will look at ANY, ALL clauses.

# Let's say you want to get all the actors who acted in any of these movies
# (101, 110, 121)

# Either you can do this with join
USE moviesdb;

select * from 
( select m.movie_id,a.name, group_concat(m.title Separator " | ")
from movies m join movie_actor ma on m.movie_id = ma.movie_id
join actors a on a.actor_id = ma.actor_id group by a.actor_id ) as table_1 where movie_id in (101, 110,121);

# You can use subqueries and mix combination of in opreator
# This will print list of all actors_id  which are in that particualr movie and then you can use a subquery
select * from actors where actor_id in
(select actor_id from movie_actor where movie_id in (101,110,121));

# Using "Any" or "All" Opreator 
# so instead of "in", I can use "any"

# where actor_id = any of these actor_id
select * from actors where actor_id = any
(select actor_id from movie_actor where movie_id in (101,110,121));

# Whenever you're working with MySQL as Data Analyst, Data Scientist or any in any field, you'll notice there often there are multiple
#  ways of writing the same query, so you can use whatever option is convenient
# In many cases one option might be faster than the other one

# Just to summarize "any" is used in a similar fashion as "in"

# Select all movies whose rating is greater than *any* of the marvel movies rating ( this basically means greater than the least rating of Marvel Studios movies)alter
# min function and any opreator solution
select title from movies where imdb_rating > any
(select min(imdb_rating) from movies where studio = 'Marvel Studios');

# Some and any are same 
select title from movies where imdb_rating > some
(select min(imdb_rating) from movies where studio = 'Marvel Studios');

# Select all movies whose rating is greater than *all* of the marvel movies rating ( this basically means greater than the least rating of Marvel Studios movies)alter
select * from movies where imdb_rating > all
# All the ratings would be greater than the all the marvel studio movies ratings
(select max(imdb_rating) from movies where studio = 'Marvel Studios');
