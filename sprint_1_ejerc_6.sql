SELECT company.id,company_name, ROUND(avg(amount),2)
FROM company
INNER JOIN transaction
ON transaction.company_id =company.id
group by company_id
order by avg(amount) desc
limit 1
