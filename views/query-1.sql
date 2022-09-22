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