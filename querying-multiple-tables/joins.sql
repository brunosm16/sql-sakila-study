--- Too many rows fetched : 361.197 | Cross Join

select c.first_name, c.last_name, a.address
from customer c
join address a where a.address;

--- Specify the relationship between the tables

select c.first_name, c.last_name, a.address
from customer c 
inner join address a
    on c.address_id = a.address_id

--- Subclause 'USING'
select c.first_name, c.last_name, a.address
from customer c
inner join address a
    using (address_id)

--- Old Join Syntax before SQL92
select c.first_name, c._last_name, a.address
from customer c, address a
where c.address_id = a.address_id

--- Join 3 tables
select c.first_name, c.last_name, a.address, ct.city
from customer c
inner join address a
	on c.address_id  = a.address_id 
	inner join city ct
	on a.city_id = ct.city_id 

--- Join 3 tables with 'USING' subclause
select c.first_name, c.last_name, a.address, ct.city
from customer c
inner join address a
	using (address_id) 
	inner join city ct
	using (city_id) 

--- Using STRAIGHT_JOIN to define table orden in join
select STRAIGHT_JOIN c.first_name, c.last_name, a.address, ct.city
from city ct
inner join address a
	using (city_id)
	inner join customer c
	using (address_id)