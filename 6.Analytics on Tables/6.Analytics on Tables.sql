#  In this tutorial, we will perform some data analytics across two tables in our movies database.

# Let's say a movies manager comes to you and tells you to generate a report which contains movie_id,title budget,revenue and so on...
select m.movie_id,title, budget,revenue,currency,unit from moviesdb.movies m left join moviesdb.financials f on m.movie_id = f.movie_id;

# We want to add new column called profit
select m.movie_id,title, budget,revenue,currency,unit, (revenue-budget) as profit from moviesdb.movies m left join moviesdb.financials f on m.movie_id = f.movie_id;

# Specify by studio
select m.movie_id,title, budget,revenue,currency,unit, (revenue-budget) as profit from moviesdb.movies m left join moviesdb.financials f on m.movie_id = f.movie_id where studio = "Marvel Studios";

# Simply quickly know which movie from Marvel Studios made the highest profit
select m.movie_id,title, budget,revenue,currency,unit, (revenue-budget) as profit from moviesdb.movies m left join moviesdb.financials f on m.movie_id = f.movie_id where studio = "Marvel Studios" order by profit desc;

# Let's check for movies from Bollywood
select m.movie_id,title, budget,revenue,currency,unit, (revenue-budget) as profit from moviesdb.movies m left join moviesdb.financials f on m.movie_id = f.movie_id where industry = "Bollywood" order by profit desc;
# If you see closesly the unit needs to be uniform meaning "same"
select m.movie_id,title, budget,revenue,currency,unit, (revenue-budget), 
case 
when unit='thousands' then round((revenue-budget)/1000,1) 
when unit = 'billions' then round((revenue-budget)*1000,1)
Else (revenue-budget)
end as profit_mln from moviesdb.movies m left join moviesdb.financials f on m.movie_id = f.movie_id where industry = "Bollywood" order by profit_mln desc;

