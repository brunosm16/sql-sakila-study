-- Creating a customer-view
create view customer_vw (customer_id, first_name, last_name, email) 
as select
customer_id, first_name, last_name, concat(substr(email, 1, 2), '*****', substr(email, -4)) email 
from customer;

-- Check what columns are available in customer_vw
describe customer_vw;

-- Using view to count users payment amount
select c.first_name, c.last_name, sum(p.amount) total_amount, count(*) total_payments
from customer_vw c
	inner join payment p
	on p.customer_id = c.customer_id
group by c.customer_id;

-- View for active_customers
create view active_customers_vw(
	customer_id,
	first_name, 
	last_name,
	email
) as select c.customer_id, c.first_name, c.last_name, 
  concat(substr(email, 1, 2), '*****', substr(email, -4)) email
  from customer c
  where c.active = 1;

-- Create view for sales_by_category
create view total_sales_by_category
as select c.name as category, count(p.amount) total_sales 
from payment p
	inner join rental r
	on r.rental_id = p.rental_id
	inner join inventory i
	on i.inventory_id = r.inventory_id
	inner join film f
	on f.film_id = i.film_id
	inner join film_category fc 
	on fc.film_id = f.film_id
	inner join category c
	on c.category_id = fc.category_id
group by c.name
order by total_sales asc;

-- View for movie stats
create view movie_stats as
select f.film_id, f.title,
(select c.name from film_category fc 
	inner join category c 
	on c.category_id = fc.category_id 
	where fc.film_id = f.film_id
)category,
(select count(*) from film_actor fa
	inner join actor a
	on fa.actor_id = a.actor_id
	where fa.film_id = f.film_id
)actors,
(select count(*) from inventory i 
	where i.film_id = f.film_id
)films,
(select count(*) from rental r
	inner join inventory i2
	on i2.inventory_id = r.inventory_id
	where i2.film_id = f.film_id
)total_rentals
from film f;

-- Update a view
update customer_vw set first_name = 'MARIA' where customer_id = 1;

-- Attempts to update a email but since email is from a derived expression
-- email can't be updated
update customer_vw set email = 'maria@hotmail.com' where customer_id = 1;

-- Invalid insertion
insert into customer_vw(customer_id, first_name, last_name) values('600', 'bruno', 'moraes');

-- Create view for customer_details
create view customer_details as 
select c.customer_id, c.first_name, c.last_name, c.store_id, 
a.address, a.postal_code, ct.city, cntry.country
from customer c
	inner join address a
	on a.address_id = c.address_id
	inner join city ct
	on ct.city_id = a.city_id
	inner join country cntry
	on cntry.country_id = ct.country_id;

-- Update customer_details view
update customer_details set last_name = 'McCain'
where customer_id = 218;

-- Don't allow update because tries to change another table
update customer_details set last_name = 'McCain', address = 'Monte Castelo'
where customer_id = 218;