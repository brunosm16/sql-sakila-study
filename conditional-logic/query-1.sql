-- Case / End
select c.customer_id, c.first_name, c.last_name,
	case 
		when c.active = 1 then 'isActive'
		else 'notActive'
	end customer_activity
from customer c;