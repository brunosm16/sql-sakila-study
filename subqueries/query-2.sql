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
)
;