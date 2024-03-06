# Transaccciones de Empresas Alemanas
# Hacemos un inner  join para que incorporar datos descriptivos (nombre empresa, país)a la tabla
select company.id, amount, company_name, country
from transaction
inner join company
on company.id = transaction.company_id
# tabla subquery para obtener un vector con los company_id de las empmresas son Alemanas
where company_id IN(
			select id from company
			where country ='Germany'
)
order by company_id ASC;
