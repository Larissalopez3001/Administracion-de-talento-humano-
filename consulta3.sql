/*Mostrar histórico de atrasos por año en cada departamento. 
En una columna deberá aparecer el año, en otra columna el nombre del departamento,
 en otra columna el número de atrasos en ese año.*/

SELECT 
EXTRACT (YEAR FROM FECHA_ATRASO) AS año, nombre_departamento, CANTIDAD_ATRASO
FROM EMPLEADO 
INNER JOIN ATRASO ON EMPLEADO.ID_EMPLEADO=ATRASO.ID_EMPLEADO
INNER JOIN DEPARTAMENTO ON DEPARTAMENTO.ID_DEPARTAMENTO=EMPLEADO.ID_DEPARTAMENTO 
ORDER BY FECHA_ATRASO DESC