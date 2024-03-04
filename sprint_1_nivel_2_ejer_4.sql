# Buscamos la compra media por país 
# La ordenamos de mayor a menor

SELECT country, ROUND(avg(amount),2) AS compra_media
FROM company
INNER JOIN transaction
ON transaction.company_id =company.id
GROUP BY country
ORDER BY  compra_media DESC

