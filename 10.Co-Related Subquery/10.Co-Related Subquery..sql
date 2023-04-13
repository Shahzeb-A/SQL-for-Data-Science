# In this lecture, we will cover a special type of subquery called co-related subquery.

# Select the actor_id , actor name and the total number of movies they acted in 

# Using join and group by
Use moviesdb;
explain analyze
select ma.actor_id,a.name, count(*) from actors a join movie_actor ma on a.actor_id = ma.actor_id
group by actor_id;  

# Using co-related subquery.
explain analyze
select a.actor_id,
 a.name, 
 (select count(*) from movie_actor ma where ma.actor_id = a.actor_id ) as movie_count
 from actors a 
 order by movie_count desc;
# This gave us the same result as join and groupby
# But this particular subquery is called co-related subquery because the execution of tht depends on your outer query
# outer query is actors and co-related subquery is "as movie_count"

