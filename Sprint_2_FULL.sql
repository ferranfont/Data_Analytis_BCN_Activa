# SPRINT 2, NIVEL 1, EJERCICIO 1 - todas las transacciones de las empresas alemananas
select *
from transaction as t2
where company_id in(
	select id
    from company as t1
    where t2.company_id = t1.id
    and t1.country = 'Germany'
);
select t1.country, t2.* 
from transaction as t2
join company as t1
on t2.company_id = t1.id
where t1.country = 'Germany';

# SPRINT 2, NIVEL 1, EJERCICIO 2 - empresas con transacciones por cantidad superior a la media de todas las transaciones
select company_name
from company as t1
where t1.id in (
		select company_id
		from transaction as t2
		where t2.amount > (
				select avg(amount)
				from transaction as t2
				)
);

# SPRINT 2, NIVEL 1, EJERCICIO 3 - transacciones de las empresas cuyo nombre empieza por la letra C
select t1.id, company_name
from company as t1
inner join transaction as t2
on t1.id = t2.company_id 
where company_name like 'C%';

select company_name, t2.*
from transaction as t2
inner join company as t1
on t2.company_id = t1.id
where t2.company_id in (
			select t1.id
			from company as t1
			where company_name like 'C%'
);

# SPRINT 2, NIVEL 1, EJERCICIO 4 - Lista de empresas que están en la tabla de  companias pero que no tienen ninguna transacción
select company_name from
company as t1
where not exists (
			select company_id 
			from transaction as t2
            where t1.id = t2.company_id
);

select * 
from company as t1
inner join transaction as t2
on t1.id = t2.company_id
where t2.id is null  #no tiene transacciones en la tabla de transacciones
;

select count(id) as empresas_huerfanas
from company as t1
where id not in(
		select company_id
        from transaction as t2
);

##############################################################################################################

# SPRINT 2, NIVEL 2, EJERCICIO 1 - Lista de transacciones del mismo pais de la empresa llamada Non Institute
select * 
from transaction as t
where company_id in(
		select id
		from company as c
		Where country in(
				select country
				from company as c
				where company_name = 'Non Institute'
		)
);

select c.country, t.*
from transaction as t
join company as c
on c.id = t.company_id
where country = (
				select country
                from company as c
                where company_name = 'Non Institute'  
                );
                
# SPRINT 2, NIVEL 2, EJERCICIO 2 - Nombre de la empresa con la transacción de mayor cantidad
select c.company_name, sum(amount) as parcial_empresa
from transaction as t
join company as c
on c.id = t.company_id
group by t.company_id
order by parcial_empresa desc
limit 1;

select company_name, subtotales.parcial_empresa
from company as c
join(
	select sum(amount) as parcial_empresa, company_id # es importante incluir este campo, ya que  lo usaremos luego en el comando on
    from transaction as t
    group by t.company_id
) as subtotales
on subtotales.company_id = c.id
order by parcial_empresa desc
limit 1;

# SPRINT 2, NIVEL 3, EJERCICIO 1- POR VENTAS - Listado de paises con ventas agregadas superior a la media de ventas

select c.country, count(t.id) as contador
from transaction as t
inner join company as c
on c.id = t.company_id
group by c.country
having contador > (
select avg(contador)
			from(
					select count(t.id) as contador
					from transaction as t
					inner join company as c
					on c.id = t.company_id
					group by c.country
			) as media_global
)
order by contador desc;

# SPRINT 2, NIVEL 3, EJERCICIO 1- POR VENTAS - Listado de paises con ventas agregadas superior a la media de ventas
select country, sum(amount) as total_pais
from transaction as t
join company as c
on c.id = t.company_id
where t.declined = 0
group by country
having total_pais  > (
			select avg(total_pais)
			from (
				select sum(amount) as total_pais
				from transaction as t
				join company as c
				on c.id = t.company_id
				where t.declined = 0
				group by country
			) as media_paises
)
order by total_pais desc;  
        
# SPRINT 2, NIVEL 3, EJERCICIO 3- POR VENTAS - Listado de empresas con más o menos de 4 transacciones

select company_id, company_name, count(t.id )as contador,
case
	when count(t.id ) > 4 then 'Grande + 4'
    else 'Pequeña -4'
end as casos
from transaction as t
join company as c
on c.id = t.company_id
group by company_id
order by contador desc;
		

        