--- Return the number of all customers that has more rentals than Mexico customers
 select r.customer_id, count(*) rentals 
from rental r
group by r.customer_id
having rentals > all (
	select count(*) total_rentals
	from customer c
		inner join rental r
		on c.customer_id = r.customer_id
		inner join address a
		on c.address_id = a.address_id
		inner join city ct
		on ct.city_id = a.city_id
		inner join country coun
		on coun.country_id = ct.country_id
	where coun.country in ('Canada', 'Mexico', 'United States')
	group by c.customer_id
)
order by count(*) desc;

select r.customer_id, count(*) rentals 
from rental r
group by r.customer_id
having rentals > any (
	select count(*) total_rentals
	from customer c
		inner join rental r
		on c.customer_id = r.customer_id
		inner join address a
		on c.address_id = a.address_id
		inner join city ct
		on ct.city_id = a.city_id
		inner join country coun
		on coun.country_id = ct.country_id
	where coun.country in ('Canada', 'Mexico', 'United States')
	group by c.customer_id
)
order by count(*) desc;

-- Multicolumn subquery
-- Actor in movies that has rating 'G' and 'PG'
select fa.actor_id, fa.film_id
from film_actor fa
where fa.actor_id in (
	select a.actor_id from actor a
	where a.first_name = 'PENELOPE'
	and fa.film_id in (
		select f.film_id from film f
		where f.rating in ('G', 'PG')
	)
);

--- Customer that rented 20 films
select c.customer_id, c.first_name, c.last_name
from customer c
where 20 = (
	select count(*) from rental r
	where r.customer_id = c.customer_id 
)
group by customer_id;


--- Rental between 180 and 240
select concat(c.first_name, ' ', c.last_name)
from customer c
where (
	select sum(p.amount) from payment p
	where p.customer_id = c.customer_id 
)
between 180 and 240;

-- Using Exists
select c.first_name, c.last_name 
from customer c
where exists (
	select 1 from rental r 
	where year(r.rental_date) > '2005' 
	and r.customer_id = c.customer_id) ;

/*
 * Actors that doesn't have movies with rating 'R'
 */
select a.first_name, a.last_name 
from actor a
where not exists (
	select 1 from film_actor fa 
		inner join film f
		on f.film_id = fa.film_id 
	where fa.actor_id = a.actor_id
	and f.rating = 'R'
);