--- Using 'is null'

select rental_id, inventory_id, customer_id
from rental
where return_date is null;