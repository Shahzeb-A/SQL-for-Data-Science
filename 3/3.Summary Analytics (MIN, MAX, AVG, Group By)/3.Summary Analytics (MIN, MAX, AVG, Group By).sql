# In this tutorial we are going to look for more in-built SQL functions which allows you to do basic analytics
# You'll be using these functions a lot as a Data Scientist career when you're doing summary analytics
 select * from moviesdb.movies;
 
 # This will give you the maximum rating from imdb_rating column using the MAX function
 select max(imdb_rating) from moviesdb.movies where industry ='hollywood';
 
 # Similarly there is a MIN function which will give you the minnimum rating from imdb_column
 select min(imdb_rating) from moviesdb.movies where industry ="hollywood";
 
 # Let's say you wanna know the average rating for the marvel movies so you will use the AVG function
 select avg(imdb_rating) from moviesdb.movies where industry = "hollywood" and studio = 'Marvel Studios';
 
 # The average rating has too many decimal points and whenever you wanna retrict the decimal points you can use the ROUND function
 select round(avg(imdb_rating),2) from moviesdb.movies where industry = "hollywood" and studio = 'Marvel Studios'; 
 # 2 represents number of decimal places
 
 # This columns header looks ugly and bigger but in SQL you can define a custom column name
 select round(avg(imdb_rating),2) as avg_rating from moviesdb.movies where industry = "hollywood" and studio = 'Marvel Studios'; 
 # so the query "as avg_rating" is used to define a columns name
 
 # This is useful in scenarios when you want to doo all of the opreations above
 select min(imdb_rating) as Minimum_Rating, max(imdb_rating) as Maximum_Rating, round(avg(imdb_rating)) as Average_Rating from moviesdb.movies where industry = "hollywood" and studio = 'Marvel Studios'; 
 
# Print number of movies from hollywood imdustry
 select count(*) from moviesdb.movies where industry ='hollywood';

# Let's say I have multiple industries in my database and what I want to do is have an industry column and count column with it
# For that we will us the groupby function 
select industry, count(*) from moviesdb.movies group by industry; 
# SO first you select the industry column from moviesdb and apply the count funtion on it and then group all the industry by each different unique industries

# We can also do group by on different things , like:
select release_year, count(*) from moviesdb.movies group by release_year; 

# Let's say you want the count in descending order so you can do something like
select release_year, count(*) as count from moviesdb.movies group by release_year order by count desc; 
# You can also order by release_year

# Let's say you want print the industry, movie count, and the average rating in an insutry
select industry, count(*) as count, round(avg(imdb_rating),2) as Movies_rating from moviesdb.movies group by industry; 

# You can also do it by studio
select studio, count(*) as count, round(avg(imdb_rating),2) as Movies_rating from moviesdb.movies group by studio;
# You might see "Universal pictures" two times, this is because "Universal pictues" is different from "Universal pitures "
#                                                                                                    This one has an extra space


# So we also have a blank studio and this could be because of multiple reasons and in real-life you need to deal with messy data
# So you can say
select studio, count(*) as count, round(avg(imdb_rating),2) as Movies_rating from moviesdb.movies where studio!="" group by studio;


 