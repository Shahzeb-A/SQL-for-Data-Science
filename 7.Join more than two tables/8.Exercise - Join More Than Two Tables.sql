# 1. Generate a report of all Hindi movies sorted by their revenue amount in millions.
# Print movie name, revenue, currency, and unit

use moviesdb;

select * from movies;

# report of all Hindi movies sorted by their revenue amount in millions
# print movie name, revenue, currency, and unit

select * from financials;

select m.title,f.revenue,f.currency,f.unit,
case 
when f.unit='Thousands' then round(revenue/1000,1) 
when f.unit = 'Billions' then round(revenue*1000,1)
Else f.revenue end as new_rev_mln from movies m join financials f on m.movie_id = f.movie_id 
join languages l on m.language_id = l.language_id 
where l.name = 'Hindi' order by new_rev_mln desc;