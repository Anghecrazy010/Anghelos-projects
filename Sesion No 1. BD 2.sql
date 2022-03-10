/*Sesion No 1 de clases en linea */
use sakila;






/*Sentencia as utilizar un alias */
select customer_id, Store_id,
First_name as Nombre,
Last_name as Apellido
from customer 
where active = 0
Order by 2 desc;

/*Operador like  */
select customer_id, Store_id,
First_name as Nombre,
Last_name as Apellido
from customer 
where active = 1 and last_name like 'c%'
Order by 2 desc;

/*Operador like  ejemplo 2 */
select customer_id, Store_id,
First_name as Nombre,
Last_name as Apellido
from customer 
where active = 1 and customer_id like '_5'
Order by 2 desc;

/*Campos calculados (utilizando funciones)*/
select customer_id, Store_id,
concat(First_name, ' ' ,Last_name)as Nombre,
Year(create_date)as Año
From customer
 where active =1
 order by 2 desc;
 
 /*Campos calculados (utilizando funciones) ejercicio 2*/
 select customer_id, 
 Amount, 
 Amount * 0.16 as Iva,
 Amount + Amount * 0.16 as Total,
 payment_date
 from payment 
 where customer_id = 10;
 
  /*Operador Between*/
   select customer_id, 
 Amount, 
 Amount * 0.16 as Iva,
 Amount + Amount * 0.16 as Total,
 payment_date
 from payment 
 where customer_id = 10 and payment_date between '2005-06-01'and '2005-06-30';
 
 /*Operador In*/
 select title as Titulo,
 release_year as Estreno,
 Rating as Clasificacion
 
 from film 
 where rating in('G','PG','PG-13');
 
  /*Sentencia Group by (agrupar)*/
  select /*customer_id,*/
  Store_id
  from customer
  group by store_id;