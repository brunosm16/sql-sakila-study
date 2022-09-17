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
select c.first_name, c.last_name, a.address_id
from customer c
inner join address a
    using (address_id)
