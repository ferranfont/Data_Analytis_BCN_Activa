# Etiqueta las empresas con más de 4 transacciones.
# Hacemos un count de las transacciones agrupado por company_id
# Del resultado hacemos un case para etiquetar +4 o -4
# Hacemos finalmente un inner join para llamar el company_name de la tabla company

select company_id, company_name, count(company_id) as num_trans,
	case
		when count(company_id) > 4 then 'Mas de 4 - GRANDE'
		else 'Menos de 4 - PEQUENA'
		end as criba
	from transaction as t
inner join company
ON t.company_id = company.id
group by company_id
order by num_trans desc
