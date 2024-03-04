# Método para buscar si hay empresas (id) repetidas
# Contamos el número de id que el codigo devuelve tras agrupalas
# Exigimos que ese número tenga un valor mayor que 1

SELECT id, company_name, count(id) FROM company 
GROUP BY id 
HAVING count(id)>1
