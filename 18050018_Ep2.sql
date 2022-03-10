/*2 do Examen parcial*/
/*Ejercicio 1*/

use sakila;
select 
city_id,
city as Ciudad,
Country_id,
last_update
from 
city
order by Ciudad;

/*Ejercicio 2*/
create view  CteStatus as 
select 
C.First_name as Nombre,
C.Last_name as Apellido,
C.active as Estatus,
A.Phone as Telefono,
C.Customer_id as Numero_cliente
from
Customer as C
inner join Address as A on A.address_id = C.address_id
where active =0;

select 
Nombre,Apellido,Estatus,Telefono,Numero_cliente
from
CteStatus;



/*Ejercicio 3*/
/*Utilizando un query, obtener el ranking de películas con base en el monto
acumulado de rentas en el mes de mayo de 2005.*/
use sakila;
select 
F.Title as Pelicula,
F.film_id as Numero_pelicula,
count(*) as Cantidad
from 
Rental as R
inner Join inventory as I on I.inventory_id = R.inventory_id
inner Join Film as F on F.film_id= I.film_id
where R.rental_date between '2005-05-01' and '2005-05-31'
order by Cantidad desc;


/*Ejercicio 4*/
/*Desarrolla un query que utilice las sentencias LIKE o IN.*/
select * from customer where First_name like '%K%';
select * from customer where  last_name like 'Williams';


use sakila;
select year(payment_date) as Año,
Month(payment_date) as Mes,
customer_id
from
payment
where payment_date between '2005-01-01' and '2005-12-31' and customer_id like '_8' 
group by customer_id;




