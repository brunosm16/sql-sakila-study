--- Inner Join on temp table
select c.customer_id, concat(c.first_name, ' ', c.last_name),
payment_temp.total_amount, payment_temp.total_payments
from customer c
	inner join (
		select p.customer_id, sum(p.amount) total_amount, count(*) total_payments
		from payment p
		group by p.customer_id
	) payment_temp
	on c.customer_id = payment_temp.customer_id
order by payment_temp.total_payments desc;

--- Subquery for types of users
select types.type_user, count(*) payments
from (
	select p.customer_id, sum(p.amount) amount, count(*) payments
	from payment p
	group by p.customer_id) payment_temp
	inner join (
		select 'not_regular' type_user, 0 lower_limit, 49.99 upper_limit
		union all
		select 'regular' type_user, 50.00 lower_limit, 150.99 upper_limit
		union all
		select 'loyal' type_user, 151.00 lower_limit, 100000 upper_limit
	) types
	on payment_temp.amount between types.lower_limit and types.upper_limit
group by types.type_user;
