select payment_id, customer_id, amount, payment_date 
from payment p
where p.customer_id = 1 and (p.amount > 4.99 and year(p.payment_date) = 2005)

select * from payment p where p.amount in(4.99, 6.99, 8.99)

select first_name, last_name 
from customer c
where c.first_name like '_A%W%';