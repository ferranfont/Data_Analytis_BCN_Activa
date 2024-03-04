# Mostrar company_name, phone, country, amount
#company_name, phone, country,

SELECT  company_name, phone, country, SUM(amount) AS total_compras
FROM company
INNER JOIN transaction
ON transaction.company_id = company.id
GROUP BY company_name, phone, country
HAVING total_compras BETWEEN 100 AND 200
ORDER BY total_compras DESC;



