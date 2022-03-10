/*Tarea No.4*/
/*Utilizando la base de datos Sakila, desarrolla una Vista con el nombre Matricula_DtsCte. 
Esta deberá mostrar los datos del Cliente(Numero, Nombre, Apellido y Estatus) 
así como el número de la Tienda de adscripción y su Dirección incluyendo la Ciudad y el País.*/

use sakila;
create view  Matricula_DtsCte as 
select 
C.First_name as Nombre,
C.Last_name as Apellido,
C.Store_id as Numero_tienda,
C.active as Estatus,
C.customer_id as Numero_cliente,
A.address as Direccion,
Ci.city as Ciudad,
Co.Country as Pais
from
City as Ci
inner join Address as A on A.City_id = Ci.City_id
inner join Customer as C on C.address_id = A.address_id
inner join Country as Co on Co.Country_id = Ci.Country_id
order by Nombre;

select 
Nombre,Apellido,Numero_tienda,Numero_cliente,Estatus,Direccion,Ciudad,Pais
from Matricula_DtsCte

