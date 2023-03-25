# * here mean's all the columns
select * from moviesdb.movies;

# Let's say you're just interested in "industry" and "title" columns
select title,industry from moviesdb.movies;
# We're saying .movies here because we're acessing the movies table here only
# moviesdb is the dataset we are working with

# If you want to remove the moviesdb and just write movies, you can do the following:
use moviesdb;
# this use clause will tell SQL that that moviesdb is my default database
select title, industry from movies;

# Now let's go back to our original database and you'll see that there are two types of columns here, 
# one's are text columns and one's are numerical columns
select * from movies;
# In this tutorial we're going to query our database using text query 

# Let's say I want to get all the movies from bollywood industry so you an use something called "where" clause
select * from movies where industry="Bollywood";
#It'll only show you the bollywood movies and in the output panel it'll show you the last query results statistics
#That is the purpose of the bottom panel

#If you want to return the count of bollywood movies, you can use the "count" clause
select count(*) from movies where industry="bollywood";
select count(*) from movies where industry="hollywood";
# Here this is case in-sensitive search, In database "H" is capital but in my query I'm typing small "h"
#----------------------------------------------------------------------------------------------------------
# Let's say you wanna work out how many unique industries are there in my database, for that you can use this clause called "distinct"
# It can also work with multiple columns
select distinct industry from movies;
# It'll show you that bowlywood and holywood are unique or distinct industries
# after distinct you need to type the column where you want to see distinct values
#-------------------------------------------------------------------------------------------
# I want to know all the movies which have Thor in their title
# Percentage is similar to double quotes or single quotes we use in Python to type strings similar is the case in SQL 
select * from movies where title like "%Thor%";
# So you can see I get these 3 movies
# This is called a WILD CARD SEARCH
# Let's you wanna see movies now for Captain America 
select * from movies where title like "%america%";
# You can see al the Captain America movies now!

# Now you'll notice that some values in our studio column is blank
# Now this could happen due to data collection error, etc 
select * from moviesdb.movies;
# Now I want to print all the movies which have a blank column
select * from moviesdb.movies where studio='';
# So you can see I have three movies which have null value in studio cloumn

# So that was a quick tutorial on how you can use SQL for text queries

# Let's say you want to see all the movies which have greater rating than 9 or equal to 9
select * from moviesdb.movies where imdb_rating>=9;
# Let's say that I want to get all the movies between the rating of 5 and 8
select * from moviesdb.movies where imdb_rating>=5 and imdb_rating<=9;
# A better way to do this task is to use "BETWEEN" opreator rather than "AND" opreator
select * from moviesdb.movies where imdb_rating between 5 and 9;
# It'll give you the same result but much easier to type

# Let's say that you want to retreive movies which are from the year 2022 or 2019 or so on..l
select * from moviesdb.movies where release_year=2022 or release_year=2019 or release_year=1901;
# If you do the same thing with "AND" opreator that means all the conditions need to be fulfilled so if there is no movies from 1901 it'll show no movies from 2019 and 2022

# You can do it better using the "IN" opreator
select * from moviesdb.movies where release_year in(2022,2018,2019);
# These are basically "OR" conditions so it means 2022 or 2018 or 2019

# Let's say you want to see al the movies form Marvel Studios or Hombale Studios
select * from moviesdb.movies where studio in('Marvel Studios', 'Hombale Films');

select * from movies;

# You can see that there is a "NULL" in IMDB rating and it is a valid data type
# SO if you want to access the rows where imdb_rating is equal to null, do this:
select * from movies where imdb_rating is NULL;
# Simple as that........:)

# You might want to do the opposite sometimes and retreive all the rows which have valid imdb_rating values
# For that you can use the "NOT" opreator
select * from movies where imdb_rating is not NULL;
# So you are saying here, give me everything which has a valid value

# So let's say that you want to see movies which are from Bolywood Industry and order them from highest IMDB rating to lowest IMDB rating
# So for that you will use "ORDER BY" clause
select * from movies where Industry="bollywood" order by imdb_rating;
# By default the order is ascendinng but you can change it to descending order by simply just saying "desc"
select * from movies where industry="bollywood" order by imdb_rating desc;

# You can also use multiple commands like this
select * from movies where industry="bollywood" and studio="Dharma Productions" order by imdb_rating desc;

# Let's say I only want to see the first 5 movies only!
select * from movies where industry="bollywood" order by imdb_rating desc limit 5;
# whenever you use "LIMIT" it'll only retreive those many records 

# Let's say that you want to start the order of the above query with 2nd order meaning that you want to start with the second index and skip the first index and movies 
# For that you'll use the "OFFSET" clause

# So let's say that you want to see al the movies starting with the index 1 (0 is the first index in Computer Science)
select * from movies where industry='hollywood' order by imdb_rating desc limit 5 offset 1;
