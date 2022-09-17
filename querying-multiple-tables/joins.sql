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

--- Using subquery on inner join
select c.first_name, c.last_name, cali_addr.address, cali_addr.city
from customer c
	inner join
	(select a.address_id, a.address, ct.city
	 from address a
	 	inner join city ct
	 	on ct.city_id = a.city_id
	 	where a.district = 'CALIFORNIA'
	) cali_addr
	on cali_addr.address_id = c.address_id;

--- Alternative of subquery join
select c.first_name, c.last_name, a.address, ct.city
from customer c
	inner join address a
	on a.address_id = c.address_id 
	inner join city ct
	on ct.city_id = a.city_id
	where a.district = 'CALIFORNIA';

--- Using the same table in a join
select f.title, a1.actor_id, a1.first_name, a1.last_name, a2.actor_id, a2.first_name, a2.last_name
from film f
	inner join film_actor fa1 
	on fa1.film_id = f.film_id 
	inner join actor a1
	on fa1.actor_id = a1.actor_id 
	inner join film_actor fa2
	on fa2.film_id  = f.film_id 
	inner join actor a2
	on fa2.actor_id = a2.actor_id 
where 
(a1.first_name = 'CUBA' and a1.last_name = 'BIRCH')
and
(a2.first_name = 'CATE' and a2.last_name = 'MCQUEEN')