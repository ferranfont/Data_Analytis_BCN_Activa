# Mostramos las 5 transacciones MENOS costosas y sumamos el total de las mismas.
# Primero ordenamos las transacciones en orden ASCENDIENTE y las limitamos a 5
# Segundo sumamos la cantidad de esta agregación

(SELECT timestamp, amount 
FROM transaction
ORDER BY amount ASC
LIMIT 5)

UNION ALL

(SELECT 'Total:' AS timestamp, 
        SUM(amount) AS amount
FROM(
	SELECT amount
    FROM transaction
    ORDER BY amount ASC
    LIMIT 5
) AS top_transactions);
