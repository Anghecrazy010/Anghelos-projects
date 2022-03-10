/*Tarea N° 5*/  
/*Desarrolla un procedimiento almacenado que reciba como argumento el ID de la tienda y que muestre la relación de películas que dicha tienda tiene en su inventario. 
Nombra al procedimiento como Matricula_InventarioTienda.*/ 

use sakila;

Delimiter $$
create procedure 18050018_InventarioTienda(In M_IT int)
select 
F.title as Titulo,
F.release_year as Año_estreno,
F.rating as Clasificacion,
F.Film_id as Numero_pelicula,
I.inventory_id as Numero_inventario

From
Store as S


inner join inventory as I on S.store_id = I.store_id
inner join Film as F on  I.film_id = F.film_id
where S.store_id = M_IT;
order by Numero_pelicula;
$$

call 18050018_InventarioTienda(2);