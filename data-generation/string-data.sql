--- Table to play around with strings 
create table playing_str(char_field char(30), vchar_field varchar(30), text_field text);

--- Query to insert values in playing_str
insert playing_str values ('Hey, this is a Char', 'Hey, this is a VChar', 'Hey this is a Text');

--- String length
select length(char_field), length(vchar_field), length(vtext_field) from string_tbl;

-- Find position
select position('is' in vchar_field) from string_tbl;

-- Insert string 
select insert ('hello world', 7, 0, 'new ') string;

-- Insert string removing next character
select insert ('hello world', 7, 1, 'new ') string;