-- Modifying film name using a transaction
start transaction;

update film
set title = 'ACADEMY DINOSAUR | Modified in a transaction'
where film_id = 1

commit;