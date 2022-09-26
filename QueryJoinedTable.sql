
# Se crea una vista a partir de la "inner join" de las tablas "facturacion" y "operaciones"
CREATE VIEW opyfact
AS SELECT operaciones.mes_anio, operaciones.provincia, operaciones.rubro, operaciones.operaciones, facturacion.facturacion
FROM operaciones
INNER JOIN facturacion
ON operaciones.id= facturacion.id
WHERE operaciones.mes_anio LIKE '%2021';

# Se crea una tabla a partir de la vista creada anteriormente
SELECT *
INTO opyfacttable
FROM dbo.opyfact
