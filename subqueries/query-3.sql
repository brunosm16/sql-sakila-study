--- Inner Join on temp table
select c.customer_id, concat(c.first_name, ' ', c.last_name),
payment_temp.total_amount, payment_temp.total_payments
from customer c
	inner join (
		select p.customer_id, sum(p.amount) total_amount, count(*) total_payments
		from payment p
		group by p.customer_id
	) payment_temp
	on c.customer_id = payment_temp.customer_id
order by payment_temp.total_payments desc;