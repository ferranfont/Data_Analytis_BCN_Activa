#La base de datos transactions se compone de dos tablas: company y transaction
DESCRIBE company;
# clave primaria de company es el campo id, que no puede ser en blanco (not null)
# la tabla tiene un total de 6 campos, todos ellos de tipo varchar;
SELECT COUNT(*) FROM company;
#la tabla  tiene un total de 100 filas

DESCRIBE transaction;
# clave primaria de company es el campo id, que no puede ser en blanco (not null)
# la tabla tiene un total de 9 campos, la tipologia es varchart, int, float, timestamp, decimal, y tinyint
SELECT COUNT(*) FROM transaction;
#la tabla  tiene un total de 587 filas