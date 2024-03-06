# Nombre de las companias con ventas superior a la venta media
# Usamos distinct para obtener valores únicos en company_name
# Usamos Inner Join para hacer la tabla más amigable visualmente
select distinct company_id, company_name
from transaction
inner join company
on company.id = transaction.company_id
# Lanzamos un Subquery para obtener la venta_media de todas las transacciones
where amount > (
	select avg(amount) as venta_media
	from transaction
)
order by company_id;

