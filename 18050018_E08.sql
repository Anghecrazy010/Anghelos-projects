/*Ejercicio No.8*/ 
/*Utilizando la base de datos Salika, crear una función que reciba como argumento el ID de una película y que regrese el Idioma Original de dicha película. 
Dar a la función el siguiente nombre: Matricula_PeliculaIdiomaOriginal*/ 

use sakila;

select 
F.title as Pelicula,
F.film_id as Numero_pelicula,
L.name as Idiomas_disponibles
from 
film as F
inner join Language as L on F.language_id = L.language_id
where original_language_id = 18050018_PeliculaIdiomaOriginal(10);


 Delimiter $$
 create function 18050018_PeliculaIdiomaOriginal (A int)Returns tinyint
 Reads sql data
Return A
$$

select  18050018_PeliculaIdiomaOriginal(10) as Id_idioma_original;



select original_language_id from film;