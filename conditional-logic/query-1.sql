-- Case / End
select c.customer_id, c.first_name, c.last_name,
	case 
		when c.active = 1 then 'isActive'
		else 'notActive'
	end customer_activity
from customer c;

-- Rental by active customers
select c.first_name, c.last_name,
	case 
		when c.active = 0 then 0
		else
		(
			select count(*) from rental r
			where r.customer_id = c.customer_id
		) 
	end total_rentals
from customer c
order by total_rentals;

-- Selecting all May Rentals
select 
sum(
	 case when monthname(r.rental_date) = 'May'
 		then 1
	 	else 0
	 end 
) may_rentals
from rental r;

-- All PG movies by actors
select a.actor_id, a.first_name, a.last_name,
	case 
		when exists(
			select 1 from film_actor fa 
			inner join film f
			on f.film_id = fa.film_id
			where f.rating = 'G' and a.actor_id = fa.actor_id 
		) then 'Yes'
		else 'NO'
	end pg_movies
from actor a
order by pg_movies asc;

-- Average Payments with no zero denominator
select concat(c.first_name, ' ', c.last_name) full_name, c.customer_id,
sum(p.amount) payment_amount, count(p.amount) total_payments, 
sum(p.amount) / 
	case when count(p.amount) = 0 then 1 
	else count(p.amount) end avg_payments
from customer c
	inner join payment p
	on p.customer_id = c.customer_id
group by c.customer_id
order by avg_payments;