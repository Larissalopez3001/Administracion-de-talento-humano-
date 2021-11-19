/*Un trigger que impida que en un mes determinado se ponga como jefe a 
alguien que haya pedido un permiso de más de 15 días en el mismo mes.*/
create or replace function tg_jefe() returns trigger
as
$tg_jefe$
declare
permisos int;
maximo int=15;
begin
select max(duracion_permiso)into permisos from permiso where duracion_permiso=new.duracion_permiso;
if (permisos>= maximo) then
raise EXCEPTION 'EL EMPLEADO HA EXEDIDO LOS PERMISOS MAXIMOS, POR LO TANTO, NO PUEDE SER JEFE';
else
raise notice 'EL EMPLEADO SI PUEDE SER JEFE';
return new;
end if;
end;
$tg_jefe$
language 'plpgsql';


create trigger tg_jefe after insert
on permiso for each row
execute procedure tg_jefe();

INSERT INTO PERMISO VALUES (68, 204, '22/10/2021', 'ACADEMICO', 1, 19 )