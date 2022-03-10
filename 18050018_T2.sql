/*Tarea No.2: Utilizando la base de datos Sakila e implementando las sentencias
 y operadores revisados en la sesión Nª 1, formula un problema y resuélvelo en un script utilizando lenguaje SQL.*/

/*Mostrar el ranking de monto de rentas del año 2005 con la 
condicion de solo mostrar las customer_id que terminen en 6 */
use sakila;
select year(payment_date) as Año,
Month(payment_date) as Mes,
customer_id,
sum(Amount + Amount * 0.16) as Total
from payment
where payment_date between '2005-01-01' and '2005-12-31' and customer_id like '_6' 
group by customer_id
order by  Total desc; 


