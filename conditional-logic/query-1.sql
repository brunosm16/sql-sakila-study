-- Case / End
select c.customer_id, c.first_name, c.last_name,
	case 
		when c.active = 1 then 'isActive'
		else 'notActive'
	end customer_activity
from customer c;

-- Rental by active customers
select c.first_name, c.last_name,
	case 
		when c.active = 0 then 0
		else
		(
			select count(*) from rental r
			where r.customer_id = c.customer_id
		) 
	end total_rentals
from customer c
order by total_rentals;