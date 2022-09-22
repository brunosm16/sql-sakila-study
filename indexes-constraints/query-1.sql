-- Delete customer_id is allowed 
delete from customer where customer_id = 393

-- Rental has customer_id as foreign_key so if customer_id exists in rental
-- it cannot be deleted
alter table rental
add constraint fk_rental_customer_id foreign key (customer_id)
references customer(customer_id) on delete restrict;

