--- All action movies with non-correlated subqueries
select f.film_id, f.title, f.description
from film f
where f.film_id in (
	select fc.film_id from film_category fc
	inner join category c 
	on c.category_id = fc.category_id
	where c.name = 'ACTION'
);

-- All action movies with correlated subqueries
select f.film_id, f.title, f.description
from film f
where exists (
	select 1 from film_category fc
		inner join category c 
		on c.category_id = fc.category_id
	where fc.film_id = f.film_id
	and c.name = 'ACTION'
);

-- Type of actors
select acr.id, acr.roles, acr_types.level 
from (select actor_id id, count(*) roles from film_actor group by actor_id) acr
	inner join (
	select 'Hollywood Star' level, 30 min_roles, 99999 max_roles
	union all
    select 'Prolific Actor' level, 20 min_roles, 29 max_roles
    union all
    select 'Newcomer' level, 1 min_roles, 19 max_roles
 	) acr_types
 	on acr.roles between acr_types.min_roles and acr_types.max_roles
order by acr.roles desc;