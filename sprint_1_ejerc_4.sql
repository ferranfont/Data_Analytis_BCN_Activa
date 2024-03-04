# Queremos saber CUANTOS países han comprado, no cuales, ni tampoco cuantas transacciones,
# sino contar los países que han comprado.
SELECT count(DISTINCT country)
FROM transaction
INNER JOIN company ON company.id = transaction.company_id
WHERE transaction.declined =0
ORDER BY country ASC