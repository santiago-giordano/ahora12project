#USING "RANK()"
# Se crean dos tablas nuevas que contienen 
1. las tres facturaciones más altas por provincia
2. las tres facturaciones más altas por rubro

# TABLA 1
# Primero se crea una vista agregando la columna donde se rankean los valores de mayor a menor
CREATE VIEW rank_fact
AS SELECT provincia,  
	   facturacion,
	   RANK() OVER (PARTITION BY a.provincia
							ORDER BY a.facturacion DESC) AS rank_id
FROM 
	(SELECT provincia, facturacion
	FROM facturacion
	GROUP BY provincia, facturacion) a;

# Luego se crean la tabla a partir de la vista seleccionando los tres primeros puestos de cada provincia
SELECT * 
INTO RankFactProv
FROM rank_fact
WHERE rank_id < 4;

# Finalmente se borra la vista
DROP VIEW IF EXISTS rank_fact;


# TABLA 2
# Primero se crea una vista agregando la columna donde se rankean los valores de mayor a menor
CREATE VIEW rank_fact_rubro
AS SELECT rubro,  
	   facturacion,
	   RANK() OVER (PARTITION BY a.rubro
							ORDER BY a.facturacion DESC) AS rank_id
FROM 
	(SELECT rubro, facturacion
	FROM facturacion
	GROUP BY rubro, facturacion) a

# Luego se crean la tabla a partir de la vista seleccionando los tres primeros puestos de cada rubro
SELECT * 
INTO RankFactRubro 
FROM rank_fact_rubro
WHERE rank_id < 4 ;

# Finalmente se borra la vista
DROP VIEW IF EXISTS rank_fact_rubro;
