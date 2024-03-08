# SPRINT 1

# SPRINT 1, NIVEL1, EJERCICIO 2 -companies ordenadas por nombre ascendente
select company_name,email,country from company as t
order by company_name asc;

# SPRINT 1, NIVEL1, EJERCICIO 3 - relación de paises que están haciendo compras
select distinct country, declined from company as c
inner join transaction as t
on c.id = t.company_id
where t.declined = 0
order by country asc;

# SPRINT 1, NIVEL1, EJERCICIO 4 -  contar los paises que hacen compras
SELECT COUNT( distinct country) as num_paises 
FROM company AS c
join transaction as t on c.id =  t.company_id
where t.declined = 0;

# SPRINT 1, NIVEL1, EJERCICIO 5 - codi, pais y nombre de la compania b-2354
Select distinct c.id, company_name ,country from company as c
where c.id = 'b-2354';

# SPRINT 1, NIVEL1, EJERCICIO 6  - compania con mayor venta media 
select id, company_name, venta_media
from (
	select company_id, round(AVG(amount),2) as venta_media from transaction as t
	where t.declined = 0
	group by company_id
	order by venta_media desc
    limit 1
) as max_venta_media
inner join company as c
on max_venta_media.company_id = c.id
order by venta_media desc;


# SPRINT 1, NIVEL1, EJERCICIO 6  - compania con mayor venta media 
select id, company_name, venta_media from company as c
inner join (
	select company_id, round(AVG(amount),2) as venta_media from transaction as t
	where t.declined = 0
	group by company_id
	order by venta_media desc
    limit 1
) as max_venta_media
on max_venta_media.company_id = c.id
order by venta_media desc;

##############################################################################################

# SPRINT 1, NIVEL 2, EJERCICIO 1 - duplicados en tabla company en el campo id
# WHERE SE USA ANTES DEL GROUP BY, MIENTRAS QUE HAVING ES UN FILTRO POSTERIOR AL RETORNO
select id, count(id) as contador 
from company as c
group by id
having contador > 1;

# SPRINT 1, NIVEL 2, EJERCICIO 2 - los cinco dias de mayores ventas con dia y total de ventas del dia
SELECT date(timestamp) as dia, sum(amount) as dia_top from transaction as t
group by dia
order by dia_top desc
limit 5;

# SPRINT 1, NIVEL 2, EJERCICIO 3 - los cinco dias de menor ventas con dia y total de ventas del dia
select date(timestamp) as dia, sum(amount) as dia_down from transaction as t
group by dia
order by dia_down asc
limit 5;


# SPRINT 1, NIVEL 2, EJERCICIO 4 - average de ventas por país de menor a mayor
select country, round(avg(amount),2) as media_pais from company  as c
inner join transaction t
on c.id = t.company_id
where t.declined =  0
group by country
order by media_pais desc;

##############################################################################################

# SPRINT 1, NIVEL 3, EJERCICIO 1
select c.company_name, c.email, c.country, sum(t.amount) as total_empresa from transaction as t
inner join company as c 
on t.company_id = c.id
where t.declined = 0 
group by company_id
HAVING total_empresa BETWEEN 100 AND 200
order by total_empresa desc;

# SPRINT 1, NIVEL 3, EJERCICIO 2 nombre de companias que hicieron compras el 16 marzo, 13 frebrero y 28 febrero
select distinct company_name from transaction as t
inner join company as c
on c.id = t.company_id
where t.declined = 0 and (date(timestamp) = '2022-03-16' or date(timestamp) = '2022-02-13' or date(timestamp) = '2022-02-28')






