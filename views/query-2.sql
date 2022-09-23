-- Create a view for actors and their categorie movies
create view actors_category_movies as 
select f.title, a.first_name, a.last_name, c.name from film f
	inner join film_actor fa 
	on fa.film_id = f.film_id
	inner join actor a
	on a.actor_id = fa.actor_id
	inner join film_category fc 
	on fc.film_id = f.film_id
	inner join category c 
	on c.category_id = fc.category_id
where a.last_name = 'FAWCETT';

-- Creates a view for country payments without scalar subquery
create view country_payments_not_scalar as select c.country_id, c.country, sum(p.amount) payments
from country c
	inner join city ct
	on ct.country_id  = c.country_id
	inner join address a
	on a.city_id = ct.city_id
	left outer join customer cstmer
	on cstmer.address_id = a.address_id
	left outer join payment p
	on p.customer_id = cstmer.customer_id
group by c.country_id;