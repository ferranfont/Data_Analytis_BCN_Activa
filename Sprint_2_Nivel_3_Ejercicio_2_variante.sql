# empresas que tiene mas de 4 transacciones
# contamos COUNT el número de transacciones de las companias agrupadas por id
# le exigimos que su having sea >4 y obtenemos un vector con los id
# usamos IN para pasar este vector a la tabla company para obtener su nombre.

select id, company_name from company as c
where c.id in(
	select company_id
    from(
		select company_id, count(company_id) as num_trans from transaction as t
		group by company_id
		having num_trans > 4
		order by num_trans desc
	) as comapania_mas_4
);

