-- Query information about sakila table
select table_name, table_type 
from information_schema.tables
where TABLE_SCHEMA = 'sakila'
order by table_name;