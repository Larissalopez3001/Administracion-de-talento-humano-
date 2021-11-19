/*Procedimiento almacenado que devuelva los nombres del empleado que han 
estado en un departamento y la fecha de ingreso, al ingresar el nombre del departamento*/
create or replace function dato_departamento (varchar)
returns table (nombre_empleado varchar ,fecha_ingreso date)
as
$$
select 
nombre_empleado, fecha_ingreso
from empleado
inner join departamento ad  on empleado.id_departamento=ad.id_departamento
where ad.nombre_departamento = $1
$$
language SQL;

select dato_departamento('SEGURIDAD')
select * from departamento