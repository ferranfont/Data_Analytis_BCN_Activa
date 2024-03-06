# Listado de Empresas que han hecho un total (suma) de transacciones por encima de la media
# Se excluyen  para el cálculo las transacciones denegadas.

select id, company_name from company as c
	where (
		select sum(amount) as total_por_empresa from transaction as t 
		where t.company_id = c.id and t.declined = 0
		group  by company_id
	)  > 
	( select avg(amount) from transaction
    where declined = 0
    )
order by id;

