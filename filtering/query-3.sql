--- Using 'is null'

select rental_id, inventory_id, customer_id
from rental
where return_date is null;

--- Using 'is null' for no returned date

select rental_id, inventory_id, customer_id, return_date 
from rental
where return_date is null
or return_date not between '2004-04-01' and '2005-07-01'
order by return_date desc;