# Ver que companias hicieron compras que llegaron a buen fin en tres fechas determinadas

SELECT company_name, DATE(timestamp) as fecha 
FROM transaction
INNER JOIN company
ON transaction.company_id = company.id
WHERE declined = 1
HAVING  fecha ='2022-02-13' OR fecha ='2022-02-28' OR fecha ='2022-03-16' 