/** 
  -- Inner Join 
*/


-- select distinct c.customer_id , c.first_name, c.last_name, r.rental_date 
-- from customer c
-- 	inner join rental r 
-- 	on r.customer_id = c.customer_id
-- where date(r.rental_date) > '2005-05-25';

select distinct c.customer_id , c.first_name, c.last_name, r.rental_date 
from customer c
	inner join rental r 
	on r.customer_id = c.customer_id
where date(r.rental_date) <> '2005-06-15';
