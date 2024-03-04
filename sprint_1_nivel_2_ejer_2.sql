# Mostramos las 5 transacciones más costosas y sumamos el total de las mismas.
# Primero ordenamos las transacciones en orden descenciente y las limitamos a 5
# Segundo sumamos la

(SELECT timestamp, amount 
FROM transaction
ORDER BY amount DESC
LIMIT 5)

UNION ALL

(SELECT 'Total:' AS timestamp, 
        SUM(amount) AS amount
FROM(
	SELECT amount
    FROM transaction
    ORDER BY amount DESC
    LIMIT 5
) AS top_transactions);
