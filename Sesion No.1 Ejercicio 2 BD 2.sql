/*Ejercicio no.2 */
/*Utilizando la tabla Rental, obtener la relación de la cantidad de rentas por mes del año 2005. */
use sakila;
select rental_date,
 year(rental_date) as Año,
Month(rental_date) as Mes,
count(*) as cantidad from rental
where rental_date between '2005-01-01' and '2005-12-31'
group by Date_format(rental_date, '%M-Y')
order by Mes desc;