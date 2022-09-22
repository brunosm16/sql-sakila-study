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