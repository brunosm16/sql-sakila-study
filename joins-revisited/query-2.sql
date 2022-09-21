-- All customers with they payment amount
select c.customer_id, c.first_name, c.last_name, sum(p.amount) payment_amount
from customer c
	left outer join payment p
	on p.customer_id = c.customer_id
group by c.first_name = p.payment_id
order by payment_amount;