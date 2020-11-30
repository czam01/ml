/*
Consultas SQL para determinar la información requerida
*/

/*
Determinar la cantidad de personas que tienen salario bajo, medio y alto
*/
SELECT SUM(CASE WHEN edad BETWEEN 800 AND 2000 THEN 1 ELSE 0 END) AS "Salario Bajo",
       SUM(CASE WHEN edad BETWEEN 2000 AND 6000 THEN 1 ELSE 0 END) AS "Salario Medio",
       SUM(CASE WHEN edad BETWEEN 6000 AND 10000 THEN 1 ELSE 0 END) AS "Salario Alto"
FROM "mlpreparation"."ml_data_preparation";

/*
Determinar la cantidad de personas de acuerdo a un rango de edades
*/
SELECT SUM(CASE WHEN edad BETWEEN 16 AND 30 THEN 1 ELSE 0 END) AS "16-30",
       SUM(CASE WHEN edad BETWEEN 31 AND 50 THEN 1 ELSE 0 END) AS "31-50",
       SUM(CASE WHEN edad BETWEEN 51 AND 70 THEN 1 ELSE 0 END) AS "51-70",
       SUM(CASE WHEN edad BETWEEN 70 AND 95 THEN 1 ELSE 0 END) AS "70-95"
FROM "mlpreparation"."ml_data_preparation";

/*
Determinar las edades más comúnes en las personas
*/
SELECT edad, COUNT(edad) AS occurances 
FROM "mlpreparation"."ml_data_preparation"
GROUP BY edad
ORDER BY occurances DESC
LIMIT 10;

/*
Determinar los salarios más comúnes en las personas.
*/
SELECT salario, COUNT(salario) AS occurances 
FROM "mlpreparation"."ml_data_preparation"
GROUP BY salario
ORDER BY occurances DESC
LIMIT 3;

/*
Determinar el porcentaje de cantidad de Mujeres y Hombres.
*/
SELECT genero, (COUNT(genero) * 100.0 / (SELECT COUNT(*) FROM "mlpreparation"."ml_data_preparation")) AS percent
FROM "mlpreparation"."ml_data_preparation"
GROUP BY genero;