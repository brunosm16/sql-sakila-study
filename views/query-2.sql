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
