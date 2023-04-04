select * from moviesdb.movies;

# let's say you want to print all the years where more than 2 movies were released
select release_year, count(*) as movie_count from movies group by release_year order by movie_count desc;

# Let's say you want to see the results where movies count is greater than 2 because here it's showing all the results. 
# You might try to do this but this won't work
 select release_year, count(*) as movie_count from movies where movie_count>2 group by release_year order by movie_count desc;
# This is not gonna work and it's gonna give you ""Error Code: 1054. Unknown column 'movie_count' in 'where clause'""

# The reason this is happening is the way SQL will execute all these opreations is
FROM --> WHERE --> GROUP BY --> HAVING --> ORDER BY
# Movies count is not available until grouactor_idp by

# Luckily there is something similar to where which gets executed after groupby and it's called "HAVING"
select release_year, count(*) as movie_count from movies group by release_year having movie_count>2 order by movie_count desc;

select * from moviesdb.actors;

# This gives you current date
select curdate();

# This gives you current year
select year(curdate());

# Get the current age of actors
select *, year(curdate()) - birth_year as current_age from actors;

select * from moviesdb.financials;

# Let's say I want to calculate the profit columns
select *, revenue-budget as profit from financials;

# Print revenue in single currency
# convert everything to PKR# In real-life you'll use live-conversion rate but let's keep things simple now
# Make a new columns pkr_revenue and we will use if condition:
select *, if (currency="USD" or currency="INR", revenue*283.75, revenue) as pkr_revenue from financials;
# The way if condition in SQL works:
# if(condition,true #(What do you want to do if the condition is true),false (What do you want to do if the condition is false))

#--------Check which movie made the most revenue-----------
select distinct unit from financials;
# convert everything into million 
# Billion --> Million --> revenue*1000
# Thousands --> Million --> revenue/1000
# Million --> revenue
# You can do something using "case statement"
#-------------------------case statement------------------------------------
SELECT *,
CASE
    WHEN unit = "thousands" THEN revenue/1000
    WHEN unit = "Billions" THEN revenue*1000
   ELSE revenue
end as revenue_million
FROM financials;
