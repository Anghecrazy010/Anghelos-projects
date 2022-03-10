/*Ejercicio No.4*/
/*Utilizando la base de datos Sakila, obtener la relación del volumen de rentas por empleado (staff) en el 1er. semestre del año 2005 */
use sakila;
select year(Rental_date) as Año,
Month(Rental_date) as Mes,
S.Staff_id as empleado,
First_name as Nombre,
Last_name as Apellido,
count(*) as Cantidad
from rental as R
inner Join staff as S on S.staff_id = R.staff_id
where R.rental_date between '2005-01-01' and '2005-06-30'
group by S.staff_id 
order by Cantidad desc;
