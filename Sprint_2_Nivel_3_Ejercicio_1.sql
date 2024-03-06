# Paises cuya venta sea superior a la venta media de todos los paises
# Primero usamos el comando SUM para agrupar la cantidad amount por país para vectorizarlos en total_pais
# Luego usamos este vector para obtener la media
# usamos el comando cross join para comparar las dos tablas
# finamente añadimos un Where para comprar total_pais con media_total_paises
select country 
from (
	select country, sum(t.amount) as total_pais from transaction as t
	inner join company as c
	on  t.company_id = c.id
	group by c.country
) as tabla_sumatorio_paises
cross join (
	select avg(total_pais) as media_total_paises 
	from (
		select country, sum(t.amount) as total_pais from transaction as t
		inner join company as c
		on  t.company_id = c.id
		group by c.country
     ) as tabla_media
) as tabla_cross_join
where total_pais > media_total_paises;



