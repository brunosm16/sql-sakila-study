--- Counting number of rows in payment
select count(*) from payment;

--- Counting payments by customer
select p.customer_id, count(*) total_payments, concat(c.first_name, ' ', c.last_name) full_name
from payment p 
	inner join customer c
	on c.customer_id = p.customer_id
group by p.customer_id, p.customer_id
having total_payments >= 40
order by total_payments;