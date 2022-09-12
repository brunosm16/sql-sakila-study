select payment_id, customer_id, amount, payment_date 
from payment p
where p.customer_id = 1 and (p.amount > 4.99 and year(p.payment_date) = 2005)