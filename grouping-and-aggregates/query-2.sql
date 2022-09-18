select p.customer_id, concat(c.first_name, ' ', c.last_name) as full_name,
MIN(amount) min_amount, MAX(amount) max_amount,
AVG(amount) avg_amount, COUNT(*) n_payments
from payment p
	inner join customer c
	on c.customer_id = p.customer_id 
where amount >= 1
group by customer_id
order by max_amount desc;

--- Distinct Count
select 
count(distinct customer_id) distinct_customers,
count(customer_id) 
from payment p;

-- Using having with group by
select f.rating, fa.actor_id, 
concat(a.first_name, ' ', a.last_name) full_name, 
count(*) total_movies from film f
	inner join film_actor fa 
	on fa.film_id = f.film_id
	inner join actor a
	on a.actor_id = fa.actor_id
where f.rating in('PG', 'G')
group by f.rating, fa.actor_id, full_name
having total_movies > 9;