/*Sesion No.4*/ 

/*Procedimiento almacenado*/ 

/*Procedimiento almacenado sintaxis general*/ 
create procedure Nombre_procedimiento(<Lista de argumentos>)
/*Begin*/ 
       <Sentencias sql>;
       End
       
/*Tipos de argumentos*/ 
In: Argumentos de entrada
Out: Argumentos de salida
Inout: Argumentos mixtos

/*Crear procedimientos almacenados*/ 
use sakila;
Delimiter $$
create procedure Sumar(In A int, In B int , Out C int)
begin
set C = A+B;
end

$$


/*Utilizacion de procedimientos almacenados*/ 
Call Sumar(3,5,@Resultado);

select @Resultado as Resultado;

/*Ejemplo 1*/ 
Delimiter $$
create procedure Pelicula_x_Actor(In Cve_Act int)
select 
A.Actor_id as Identificador,
First_name as Nombre,
Last_name as Apellido,
title as Titulo
From
Film as F
inner join film_actor as Fc on F.film_id = Fc.film_id
inner join Actor as A on Fc.actor_id = A.actor_id
where A.actor_id = Cve_Act;
$$

call Pelicula_x_Actor(150);


/*Edicion de procediemtos almacenados*/ 
/*Es igual que las vistas*/ 


/*Ventajas al utilizar procedimientos almacenados*/ 
/* 
-Reduce el tiempo de ejecucion ya que al ser creado ya paso por ese proceso
-El codigo puede ser reutilizado
-El procedimiento almacenado permite la independencia de las aplicaciones y los datos entre el from end y el back end
-Motivo ayuda a la independencia de datos ya que solo se tendria que utilizar el procedimientos mas no todo el script*/ 




