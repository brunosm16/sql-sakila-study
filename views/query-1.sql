-- Creating a customer-view
create view customer_vw (customer_id, first_name, last_name, email) 
as select
customer_id, first_name, last_name, concat(substr(email, 1, 2), '*****', substr(email, -4)) email 
from customer;

-- Check what columns are available in customer_vw
describe customer_vw;