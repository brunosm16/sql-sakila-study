--- Select Highest customer_id
select c.customer_id , concat(c.first_name, ' ', c.last_name), email 
from customer c
where c.customer_id = (SELECT max(customer_id) from customer);

--- Highest payments by customers
select p.amount, p.customer_id
from payment p
where p.amount = (SELECT max(p2.amount) from payment p2)
group by p.amount, p.customer_id;

--- Selecting only cities from Algeria
select c.city_id, c.city from city c
where c.city_id = (select ct.country_id from country ct where ct.country = 'Algeria');

--- Cities in Brazil and Colombia
select c.city_id, c.city, c.country_id
from city c
where c.country_id 
in (
	select ct.country_id from country ct
	where ct.country in ('Brazil', 'Colombia')
);

--- Only customer that has payments
select c.customer_id, c.first_name, c.last_name, p.amount
from customer c
	inner join payment p
	on p.customer_id = c.customer_id
where c.customer_id <>
all (
	select p2.customer_id
	from payment p2
	where p2.amount = 0
)
group by c.customer_id, p.amount
order by p.amount asc;

--- Instead of using ALL <>, uses Not In because is more readable
select c.customer_id, c.first_name, c.last_name, p.amount
from customer c
	inner join payment p
	on p.customer_id = c.customer_id
where c.customer_id not in (
	select p2.customer_id
	from payment p2
	where p2.amount = 0
)
group by c.customer_id, p.amount
order by p.amount asc;