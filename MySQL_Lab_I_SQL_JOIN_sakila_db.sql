use sakila 
-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.

select category_id, count(film_id) as 'Number of films'
from sakila.film f
join
sakila.film_category fc 
using(film_id)
group by category_id
order by category_id;  

-- Display the total amount rung up by each staff member in August of 2005.

select staff_id, 
concat(first_name, ' ', last_name) as 'Staff Member', 
sum(amount) as 'Total Amount' 
from sakila.staff s 
join sakila.payment p 
using (staff_id)
group by staff_id 
order by 'Total Amount';

-- Which actor has appeared in the most films?
select actor_id, concat(first_name, ' ' ,last_name) as 'Name', count(distinct film_id)
as 'Number of Films' 
from sakila.actor a
join sakila.film_actor fa
using (actor_id)
group by actor_id
order by count(distinct film_id) desc
limit 1;



-- Most active customer (the customer that has rented the most number of films)
select customer_id, 
concat(first_name, ' ' ,last_name) as 'Customer',
count(distinct inventory_id) as 'Total Films Rented'
from sakila.customer c
join sakila.rental r2
using(customer_id)
group by customer_id 
order by count(distinct inventory_id) desc 
limit 1;


-- Display the first and last names, as well as the address, of each staff member.

select staff_id,
first_name,
last_name,
address_id,
concat(address,', ',district,', ', postal_code, ', ',city_id) as 'Address'
from sakila.staff s
join sakila.address ad 
using(address_id);

-- List each film and the number of actors who are listed for that film.

select film_id,
title,
count(actor_id) as 'Number of Actors'
from sakila.film f 
join film_actor fa 
using(film_id)
group by film_id
order by film_id asc;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

select customer_id, 
first_name, 
last_name,
count(payment_id) as 'Number of transactions',
sum(amount) as 'Total Paid'
from sakila.payment p 
join customer c 
using(customer_id)
group by customer_id
order by c.last_name;

-- List number of films per category.

select category_id, count(film_id) as 'Number of films'
from sakila.film f
join
sakila.film_category fc 
using(film_id)
group by category_id
order by category_id;
