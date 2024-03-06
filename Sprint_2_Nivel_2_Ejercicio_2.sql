# empresa con la mayor transacción de todas las transacciones
# ordenamos por orden descendiente las transacciones por amount para tomar luego la primera fila
# Finalmente vemos a que compania corresponde el id de esta transacción

select id, company_name from company as c
where c.id = (
	select company_id from transaction as t
    order by amount
    limit 1
);

