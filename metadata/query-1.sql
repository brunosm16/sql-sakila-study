-- Query information about sakila table
select table_name, table_type 
from information_schema.tables
where TABLE_SCHEMA = 'sakila'
order by table_name;

-- Information about views
select TABLE_NAME, IS_UPDATABLE 
from information_schema.views
where TABLE_SCHEMA = 'sakila'
order by table_name;