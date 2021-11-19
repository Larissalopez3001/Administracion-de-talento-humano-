/*Mostrar histórico de empleados por departamento anual. 
En una columna aparecerá el año, en otra columna el nombre del departamento,
en otra columna el total de empleados que había ese año.*/

SELECT
EXTRACT (YEAR FROM FECHA_INGRESO) AS AÑO, NOMBRE_DEPARTAMENTO,TOTAL_EMPLEADO
FROM DEPARTAMENTO
ORDER BY FECHA_INGRESO DESC
