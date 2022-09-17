--- Same city different address
select a1.address, a2.address, ct.city from address a1
	inner join address a2
	inner join city ct
	on ct.city_id = a1.city_id
where a1.city_id = a2.city_id and a1.address <> a2.address 