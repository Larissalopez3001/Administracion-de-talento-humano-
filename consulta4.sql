/*Mostrar histórico de tipos de permiso (maternidad, enfermedad, viáticos, etc) por año.
 En una columna aparecerá el año, en otra columna la dirección, en otra columna el número
 de permisos de ese tipo en ese año.*/

SELECT 
EXTRACT (YEAR FROM FECHA_PERMISO) AS AÑO, DIRECCION_EMPLEADO, TIPO_PERMISO, CANTIDAD_PERMISO
FROM PERMISO 
INNER JOIN EMPLEADO ON PERMISO.ID_EMPLEADO=EMPLEADO.ID_EMPLEADO
 ORDER BY FECHA_PERMISO DESC