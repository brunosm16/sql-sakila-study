-- Language by character_set
select name, 
	case 
		when name in ('English', 'Italian', 'French', 'German') then 'latin1'
		when name in ('Japanese', 'Mandarin') then 'utf8'
		else 'Unknown'
	end character_set
from language
order by character_set;

-- Movies By Rating
select 
	sum(case when f.rating = 'G' then 1 else 0 end) G,
	sum(case when f.rating = 'PG' then 1 else 0 end) PG,
	sum(case when f.rating = 'NC-17' then 1 else 0 end) 'NC-17',
	sum(case when f.rating = 'PG-13' then 1 else 0 end) 'PG-13',
	sum(case when f.rating = 'R' then 1 else 0 end) R
from film f;
