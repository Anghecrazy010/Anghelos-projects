/*Sesion no.3/
/*Vistas*/

/*Vista sintaxis general*/
create view Nombre_vista as 
select <sentencias>;

/*Crear Vista*/
use sakila;
create view  Actor_pelicula as 
select 
First_name as Nombre,
Last_name as Apellido,
Title as Titulo
from
Film as F
inner join film_actor as FC on F.film_id = FC.film_id
inner join actor as A on FC.actor_id = A.actor_id;

/*Utilizacion de vistas*/
select 
Apellido, Titulo
from 
actor_pelicula;


/*Edicion de una vista*/




/*Ventajas en el uso de las vistas*/





