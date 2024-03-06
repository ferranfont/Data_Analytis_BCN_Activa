# Transaccciones de Empresas Alemanas
# Usamos as c y as t para identificar las tablas, luego exist para especificar "dónde éxiste" o "se cumple"

 select id,company_name,country
 from company as c
 where exists  
	(select * from transaction as t
	where c.id = t.company_id
	and c.country = 'Germany')
order by id asc
