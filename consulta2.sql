/*Consultar histórico de jefes por departamento. 
En una columna aparecerá el nombre del departamento, 
en otra columna el número de jefes que ha tenido hasta el momento ese departamento.*/

SELECT 
NOMBRE_DEPARTAMENTO, NUM_JEFE
FROM JEFE 
INNER JOIN DEPARTAMENTO ON JEFE.ID_JEFE=DEPARTAMENTO.ID_JEFE


