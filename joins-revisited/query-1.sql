-- Count the number of copies for each movies, independent if exists a copy or not 
select f.film_id, f.title, count(i.inventory_id) movie_copies 
from film f
	left outer join inventory i 
	on f.film_id = i.film_id
group by f.film_id;

-- Right Outer Join 
select i.inventory_id, f.title 
from inventory i
	right outer join film f
	on f.film_id = i.film_id
group by i.inventory_id, f.title;