/*Ejercicio no.6*/
/* Utilizando la base de datos Sakila, 
crear una vista que obtenga una lista de películas con sus respectivas categorias.*/

use sakila;
create view  Pelicula_Categoria as 
select 
F.title as Pelicula,
C.name as clasificacion,
Title as Titulo
from
Film as F
inner join film_category as FCA on F.film_id = FCA.film_id
inner join category as C on FCA.category_id = C.category_id;

select 
Pelicula,Clasificacion
from
Pelicula_Categoria
