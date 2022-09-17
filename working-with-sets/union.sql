--- Actors and Customer first and last names
select 'Actor' type, a.first_name, a.last_name
from actor a
union all
select 'Customer' type, c.first_name, c.last_name
from customer c;

-- Not duplicated Actors and Customer first and last names
select a.first_name, a.last_name
from actor a
where a.first_name LIKE 'J%' and a.last_name like 'D%'
union 
select c.first_name, c.last_name
from customer c
where c.first_name LIKE 'J%' and c.last_name like 'D%';

-- Ordering union
select a.first_name first_name, a.last_name last_name
from actor a
where a.first_name LIKE 'J%' and a.last_name like 'D%'
union
select c.first_name, c.last_name
from customer c
where c.first_name LIKE 'J%' and c.last_name like 'D%'
order by first_name, last_name;

