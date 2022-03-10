/*Ejercicio No.3 */
/*Utilizando Joins,Mostrar el ranking del monto de rentas  por cliente en el periodo comprendido del 1 al 30 de junio */
use sakila;
select year(payment_date) as Año,
Month(payment_date) as Mes,
C.customer_id as Cliente ,
First_name as Nombre ,
Last_name as Apellido,
sum(Amount + Amount * 0.16) as Total
from 
payment as P
inner Join customer as C on C.customer_id = P.customer_id
where payment_date between '2005-06-01' and '2005-06-30'
group by C.customer_id 
order by Total desc;