# Buscar todas las transacciones de las companias del mismo país que la empresa Non Institute
# En primer lugar buscamos el país de la empresa mencionada y la usamos como filtro para el campo
# company_id de la tabla transaction, una vez tenemos este vector, listamos todas las transacciones
# del mismo.
select * from transaction as t
WHERE company_id IN(
		select id from company as c
		where (
			c.country = (
				select country from company as t
				where company_name = 'Non Institute'
			)
		)
);