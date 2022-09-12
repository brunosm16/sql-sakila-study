select payment_id, customer_id, amount, payment_date 
from payment p
where p.customer_id = 1 and (p.amount > 4.99 and year(p.payment_date) = 2005)

select * from payment p where p.amount in(4.99, 6.99, 8.99)