# In this lecture, we will see how you can join more than two tables and perform analytics.

# Let's say a buisness manager comes you and ask to generate a report with movie_id,title,and actors
# Whenever you get this complex requirement you need to think of structure of table and data

# Here there are three tables involved  movies | movie_actor | actors
# See picture for more visualization


# What you can do is draw Entity-Relationship Diagrams (diagram.io)

# Select default database
USE moviesdb;

select 
  m.title , a.name
from movies m 
join movie_actor ma on ma.movie_id = m.movie_id
join actors a on a.actor_id = ma.actor_id;

# The problem here is the requirement tells that I need to have all the actors not duplicate movies columns and actors seprately
# Enable this else You need to specify all of the columns that you're not using for an aggregation function in your GROUP BY clause
SET sql_mode = '';

select 
  m.title , group_concat(a.name Separator " |  ")
from movies m;

# Now I have another requirement, that I want to print actor name and movies
select a.name ,group_concat(i.title Separator " | ") as movies,
count(i.title) as movie_count
from actors a join movie_actor ma on a.actor_id = ma.actor_id join movies i on i.movie_id = ma.movie_id group by a.actor_id
order by movie_count desc;