# Recuperación de Transacciones de una empresa cuyo nombre empezaba por C

select * from transaction as t
where exists(
	select * from company as c
	where c.id = t.company_id
    and company_name like 'c%'
);