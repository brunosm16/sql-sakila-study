--- All Movies that JOHN SUVARI has acted
select f.title, a.first_name, a.last_name  from film f
	inner join film_actor fa 
	on fa.film_id = f.film_id 
	inner join actor a
	on fa.actor_id = a.actor_id
where a.first_name = 'JOHN' and a.last_name = 'SUVARI';

