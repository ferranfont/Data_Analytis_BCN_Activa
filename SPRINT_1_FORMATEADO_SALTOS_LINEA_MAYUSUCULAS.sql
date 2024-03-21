# SPRINT 1

# SPRINT 1, NIVEL1, EJERCICIO 2 -companies ordenadas por nombre ascendente
SELECT company_name,email,country 
FROM company AS t
ORDER BY company_name ASC;

# SPRINT 1, NIVEL1, EJERCICIO 3 - relación de paises que están haciendo compras
SELECT DISTINCT country, declined 
FROM company AS c
INNER JOIN transaction AS t
ON c.id = t.company_id
WHERE t.declined = 0
ORDER BY country ASC;

# SPRINT 1, NIVEL1, EJERCICIO 4 -  contar los paises que hacen compras
SELECT COUNT( DISTINCT country) AS num_paises 
FROM company AS c
JOIN transaction AS t ON c.id =  t.company_id
WHERE t.declined = 0;

# SPRINT 1, NIVEL1, EJERCICIO 5 - codi, pais y nombre de la compania b-2354
SELECT DISTINCT c.id, company_name ,country 
FROM company AS c
WHERE c.id = 'b-2354';

# SPRINT 1, NIVEL1, EJERCICIO 6  - compania con mayor venta media 
SELECT id, company_name, venta_media
FROM (
    SELECT company_id, ROUND(AVG(amount),2) AS venta_media 
    FROM transaction AS t
    WHERE t.declined = 0
    GROUP BY company_id
    ORDER BY venta_media DESC
    LIMIT 1
) AS max_venta_media
INNER JOIN company AS c
ON max_venta_media.company_id = c.id
ORDER BY venta_media DESC;


# SPRINT 1, NIVEL1, EJERCICIO 6  - compania con mayor venta media 
SELECT id, company_name, venta_media 
FROM company AS c
INNER JOIN (
    SELECT company_id, ROUND(AVG(amount),2) AS venta_media 
    FROM transaction AS t
    WHERE t.declined = 0
    GROUP BY company_id
    ORDER BY venta_media DESC
    LIMIT 1
) AS max_venta_media
ON max_venta_media.company_id = c.id
ORDER BY venta_media DESC;

##############################################################################################

# SPRINT 1, NIVEL 2, EJERCICIO 1 - duplicados en tabla company en el campo id
# WHERE SE USA ANTES DEL GROUP BY, MIENTRAS QUE HAVING ES UN FILTRO POSTERIOR AL RETORNO
SELECT id, COUNT(id) AS contador 
FROM company AS c
GROUP BY id
HAVING contador > 1;

# SPRINT 1, NIVEL 2, EJERCICIO 2 - los cinco dias de mayores ventas con dia y total de ventas del dia
SELECT DATE(timestamp) AS dia, SUM(amount) AS dia_top 
FROM transaction AS t
GROUP BY dia
ORDER BY dia_top DESC
LIMIT 5;

# SPRINT 1, NIVEL 2, EJERCICIO 3 - los cinco dias de menor ventas con dia y total de ventas del dia
SELECT DATE(timestamp) AS dia, SUM(amount) AS dia_down 
FROM transaction AS t
GROUP BY dia
ORDER BY dia_down ASC
LIMIT 5;


# SPRINT 1, NIVEL 2, EJERCICIO 4 - average de ventas por país de menor a mayor
SELECT country, ROUND(AVG(amount),2) AS media_pais 
FROM company  AS c
INNER JOIN transaction t
ON c.id = t.company_id
WHERE t.declined =  0
GROUP BY country
ORDER BY media_pais DESC;

##############################################################################################

# SPRINT 1, NIVEL 3, EJERCICIO 1
SELECT c.company_name, c.email, c.country, SUM(t.amount) AS total_empresa 
FROM transaction AS t
INNER JOIN company AS c 
ON t.company_id = c.id
WHERE t.declined = 0 
GROUP BY company_id
HAVING total_empresa BETWEEN 100 AND 200
ORDER BY total_empresa DESC;

# SPRINT 1, NIVEL 3, EJERCICIO 2 nombre de companias que hicieron compras el 16 marzo, 13 frebrero y 28 febrero
SELECT DISTINCT company_name 
FROM transaction AS t
INNER JOIN company AS c
ON c.id = t.company_id
WHERE t.declined = 0 AND (DATE(timestamp) = '2022-03-16' OR DATE(timestamp) = '2022-02-13' OR DATE(timestamp) = '2022-02-28');
