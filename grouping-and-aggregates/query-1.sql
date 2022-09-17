select r.customer_id, c.first_name, count(*) amount
from rental r
	inner join customer c
	on c.customer_id = r.customer_id 
where first_name LIKE 'W%'
group by customer_id
having amount > 20
order by amount desc;