/*Tarea No.6*/ 
/*Utilizando la base de datos Sakila crear una función con el nombre Matricula_Multa, 
la cual deberá recibir como argumento el ID de la renta y esta devolverá un 1 (uno) si dicha renta tiene multa o un 0 (cero) en caso contrario.*/ 

use sakila;

 Delimiter $$
 create function 18050018_Multa (A int)Returns int
 Reads sql data
begin

set @A1=''; set @A2=''; set @A3=''; set @A4='',@A5='';

select 
R.rental_id, customer_id, rental_date, return_date,
if(datediff(rental_date,return_date) <= rental_duration, 0,1) as 'Multa'
into @A1,@A2,@A3,@A4,@A5
from 
rental as R

Inner join Inventory as I on R.inventory_id = i.inventory_id
inner join film as F on  I.Film_id = F.film_id
where R.rental_id = A;
return @B5;
end 
$$

select 18050018_Multa (34) as Multa;
select 18050018_Multa (8) as Multa;





