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

-- Table information using information_schema.colums
select TABLE_SCHEMA table_schema, COLUMN_NAME column_name, COLUMN_TYPE column_type, 
CHARACTER_MAXIMUM_LENGTH char_max_length, NUMERIC_PRECISION num_precision,
NUMERIC_SCALE num_scale
from information_schema.columns
where table_schema = 'sakila' and table_name = 'customer';