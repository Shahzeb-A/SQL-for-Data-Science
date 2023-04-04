# Let's say you want to join tables to solve a business related problem or etc
select * from moviesdb.movies;
select * from moviesdb.financials;
USE moviesdb;
# Now using the movies id we can join these tables so we know what movies we are talking about
# There are different types of joins

# "INNER JOIN" combine records from two tables whenever there are "COMMON VALUES" in a field common to both tables.
#-----------------------------INNER JOIN----------------------------
# First specify with select column what columns do you need (NOTE: I typed movies.movie_id with only movie_id column because it's in both tables)
select movies.movie_id, title, budget , revenue, currency, unit from movies inner join financials on movies.movie_id = financials.movie_id;

#------------------To make join query short use (any words or letters like I did as m and f to make query shorter)---------------
select m.movie_id, title, budget , revenue, currency, unit from movies m inner join financials f on m.movie_id = f.movie_id;
#-------------------By default it is "inner join" in MySQL-------------------------------------------------------


# The "LEFT JOIN" keyword returns all records from the left table (table1), and the matching records from the right table (table2). 
# The result is 0 records from the right side, if there is no match.
#----------------------------------------------LEFT JOIN------------------------------------------------------------------
select movies.movie_id, title, budget , revenue, currency, unit from movies left join financials on movies.movie_id = financials.movie_id;


# The RIGHT JOIN keyword returns all records from the right table (table2), and the matching records from the left table (table1). 
# The result is 0 records from the left side, if there is no match.
#-----------------------------------------RIGHT JOIN-----------------------------------------------------------------------
# it should be financials.movies_id instead of movies.movie id because you want to get the index from financials table since that index is missing from movies but available in financials table
select financials.movie_id, title, budget , revenue, currency, unit from movies right join financials on movies.movie_id = financials.movie_id;

# FULL JOIN in the union (joining) of RIGHT JOIN and LEFT JOIN , OR basically joining the whole tables
#---------------------------------------FULL JOIN----------------------------------------------------------- 
select financials.movie_id, title, budget , revenue, currency, unit from movies full join financials on movies.movie_id = financials.movie_id;

# The USING clause specifies which columns to test for equality when two tables are joined. 
# It can be used instead of an ON clause in the JOIN operations that have an explicit join clause.
# Sometimes you can join two tables based on one or more columns
select m.movie_id, title, budget, revenue, currency, unit from movies m left join financials on m.movie_id and m.title;

# You don't need to specify where to take movie_id from it'll figure out by itself whenever you perform a specific join
select movie_id, title, budget, revenue, currency, unit from movies m left join financials f using (movie_id);

# CROSS JOINs aka Cartesian join are used to combine each row of one table with each row of another table, 
# and return the Cartesian product of the sets of rows from the tables that are joined.

# Items table (1) cross join variants table (2)
select * from food_db.items cross join food_db.variants;
# So every row in the first table, it joined with every row with the next table
# First table = 3 Rows 
# Second table = 3 rows 
# Cartisian product = 9 Rows  

# How to join two strings in MySql because I want to add another column which combines variant_name + name so easy to identify names
select *, concat(variant_name,' ', name) as Full_Name, concat(price + variant_price) as Full_Price from food_db.items cross join food_db.variants;

# CROSS JOIN is useful when you don't have any common column between two tables
