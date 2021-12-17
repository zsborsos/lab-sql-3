-- Lab | SQL Queries 3 --
-- Zsanett Borsos --

-- How many distinct (different) actors' last names are there? --
SELECT COUNT(DISTINCT(last_name)) FROM sakila.actor;

-- In how many different languages where the films originally produced? --
SELECT COUNT(DISTINCT(language_id)) FROM sakila.film;

-- How many movies were released with "PG-13" rating? --
SELECT COUNT(rating) FROM sakila.film
WHERE rating IN('PG-13');

-- Get 10 the longest movies from 2006.--
SELECT title,release_year,length FROM sakila.film
WHERE release_year IN(2006)
ORDER BY(length) DESC
LIMIT 10;

-- How many days has been the company operating (check DATEDIFF() function)? --
SELECT datediff(max(rental_date),min(rental_date)) FROM sakila.rental;

-- Show rental info with additional columns month and weekday. Get 20. --
SELECT *, DATE_FORMAT(rental_date, '%M') AS month, DAYNAME(rental_date) AS weekday FROM sakila.rental
WHERE DAYNAME(rental_date) IN ('Monday','Tuesday','Wednesday','Thursday','Friday')
LIMIT 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.--
SELECT *, 
CASE
WHEN DAYNAME(rental_date) IN ('Monday','Tuesday','Wednesday','Thursday','Friday') THEN 'Workday'
ELSE 'Weekend'
END AS rental_date
FROM sakila.rental;

-- How many rentals were in the last month of activity? --
SELECT COUNT(*) FROM sakila.rental
WHERE rental_date = (SELECT MAX(rental_date) FROM sakila.rental);
