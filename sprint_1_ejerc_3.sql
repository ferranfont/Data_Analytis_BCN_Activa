# Paises que han comprado
# Usamos distinct para obtener valores únicos eliminando filas duplicadas
# En transaction añadimos el país del comprador desde la tabla company
SELECT DISTINCT country
FROM transaction
INNER JOIN company ON company.id = transaction.company_id
WHERE transaction.declined =0
ORDER BY country ASC
