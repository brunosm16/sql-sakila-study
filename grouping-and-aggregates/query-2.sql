select p.customer_id, concat(c.first_name, ' ', c.last_name) as full_name,
MIN(amount) min_amount, MAX(amount) max_amount,
AVG(amount) avg_amount, COUNT(*) n_payments
from payment p
	inner join customer c
	on c.customer_id = p.customer_id 
where amount >= 1
group by customer_id
order by max_amount desc;