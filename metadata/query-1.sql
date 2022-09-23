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
select COLUMN_NAME column_name, COLUMN_TYPE column_type, 
select COLUMN_NAME column_name, COLUMN_TYPE column_type, 
CHARACTER_MAXIMUM_LENGTH char_max_length, NUMERIC_PRECISION num_precision,
NUMERIC_SCALE num_scale
from information_schema.columns
where TABLE_SCHEMA = 'sakila' and table_name = 'customer'
order by ORDINAL_POSITION;

-- Information about table indexes
select s.INDEX_NAME, s.COLUMN_NAME, s.NON_UNIQUE, s.SEQ_IN_INDEX 
from information_schema.STATISTICS s
where TABLE_SCHEMA = 'sakila' and table_name = 'customer';

-- Information about constrains
select tc.CONSTRAINT_NAME, tc.CONSTRAINT_TYPE, tc.TABLE_NAME
from information_schema.TABLE_CONSTRAINTS tc
where TABLE_SCHEMA = 'sakila' and table_name = 'customer';