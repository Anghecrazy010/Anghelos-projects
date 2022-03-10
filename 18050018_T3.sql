/* Tarea Nº 3 */
/* Utilizando la base de datos Sakila e implementando la sentencia JOIN, formula un problema y resuélvelo en un script utilizando lenguaje SQL. */
/* Encontrar el volumen de rentas del mes de junio del año 2004 hasta el mismo mes pero del siguiente año organizadas por el nombre de la pelicula y su categoria  */
use sakila;
select  year(Rental_date) as Año,
Month(Rental_date) as Mes,
First_name as Nombre,
Last_name as Apellido,
F.title as pelicula,
F.rating as categoria,
count(*) as Cantidad
from rental as R, film as F
inner Join customer as C on C.customer_id = F.film_id
where R.rental_date between '2004-06-01' and '2005-06-01'
group by C.customer_id 
order by Cantidad desc;