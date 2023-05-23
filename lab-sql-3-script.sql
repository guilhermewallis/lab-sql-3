-- 1. How many distinct actors' last names are there?
select count(distinct last_name) from actor;

-- 2. In how many different languages were the films originally produced?
select count(distinct language_id) from film;

-- 3. How many movies were released with "PG-13" rating?
select rating from film
where rating = 'PG-13';

-- 4. Get the 10 longest movies from 2006
select * from film
where release_year = 2006
order by length desc
limit 10;

-- 5. How many days has been the company operating?
select datediff('2023-05-23', '2006-01-01');

-- 6. Show rental info with additional columns month and weekday. Get 20
select *, date_format(rental_date, '%M') as month, date_format(rental_date, '%W') as weekday from rental
limit 20;

-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week
select *,
case
	when date_format(rental_date, '%W') = 'Saturday' or date_format(rental_date, '%W') = 'Sunday'
		then 'weekend'
	else 'workday'
end
as day_type
from rental;

-- 8. How many rentals were in the last month of activity?
select count(*) from rental
where left(rental_date,7) = (select max(left(rental_date,7)) from rental);

