/*Ejercicio N° 7*/ 
/*Crea un procedimiento almacenado y nómbralo Matricula_CategoriaPelicula. 
Este recibirá como argumento el ID de la película y mostrará la información de dicha película con su respectiva categoría.*/ 
use sakila;

Delimiter $$
create procedure Matricula_CategoriaPelicula_angNew1(In M_Cp int)
select 
F.title as Titulo,
F.release_year as Año_estreno,
F.rating as Clasificacion,
Ca.name as Categoria,
F.Film_id as Numero_pelicula
From
Film as F
inner join Film_category as FC on F.film_id = FC.film_id
inner join category as Ca on Ca.category_id = FC.category_id
where F.film_id = M_Cp;
$$

call Matricula_Categoriapelicula_angNew1(2);
