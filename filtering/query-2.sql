--- Inner Query

select film_id, title, replacement_cost from film
where replacement_cost
in (select replacement_cost from film where rental_rate > 2);


--- Not In
select film_id, title, description, rental_rate from film where rental_rate not in(0.99,1);

--- Using built-in function
select film_id, title, description, rating from film where right(rating, 1) = 'G';