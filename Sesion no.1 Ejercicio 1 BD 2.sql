/*Ejercicio no.1 */
/*Mostrar el ranking del monto de rentas por cliente en el mes de junio del 2005. */
select year(payment_date) as Año,
Month(payment_date) as Mes,
customer_id,
sum(Amount + Amount * 0.16) as Total
from 
payment 
where payment_date between '2005-06-01' and '2005-06-30'
group by customer_id 
order by Total desc;