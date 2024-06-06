----1. How many distinct (different) actors last names are there??
use sakila;
SELECT COUNT(DISTINCT last_name) AS distinct_last_names_count
FROM actor;

-----2.In how many different languages where the films originally produced?
------film (Use the column language_id from the film table)

select * from film;
SELECT COUNT(DISTINCT language_id) AS distinct_languages_count
FROM film;

-------3.How many movies were released with "PG-13" rating?
SELECT COUNT(rating)
FROM film
WHERE rating = 'PG-13';

-----4.Get 10 the longest movies from 2006.
SELECT title, length
FROM film
WHERE release_year = 2006
order by length desc
LIMIT 10;

---5.How many days has been the company operating (check DATEDIFF() function)?
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operating_days
FROM rental;


--------6.Show rental info with additional columns month and weekday. Get 20
select * from rental;
select 
rental_id,
rental_date,
inventory_id,
customer_id,
return_date,
staff_id,
last_update,
Month(rental_date) as rental_month,
dayname(rental_date) as rental_weekday
from rental
limit 20;

------7.Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select 
rental_id,
rental_date,
inventory_id,
customer_id,
return_date,
staff_id,
last_update,
Month(rental_date) as rental_month,
dayname(rental_date) as rental_weekday,
CASE 
        WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend'
        ELSE 'workday'
    END AS day_type
FROM rental
LIMIT 20;

------8.How many rentals were in the last month of activity?

select * from rental; 
select max(rental_date)
from rental;

select count(*) 
FROM rental
WHERE rental_date  > '2006-02-01';








