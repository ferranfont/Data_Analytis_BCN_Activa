# Empresas que están registradas pero que no tienen transaciones
# Es decir, emmpresas que están en el listado de companias pero que no están en el listado de Transacciones.

select * from company as c
where not exists (
	select * from transaction as t
    where t.company_id = c.id
);

