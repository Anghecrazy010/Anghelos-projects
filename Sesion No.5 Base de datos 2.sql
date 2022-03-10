/*Sesion No.5*/ 

/*Funciones*/ 
/*Funciones sintaxis general*/ 
/*create function Nombre_Funcion(<Lista de argumentos>) Returns <Tipo dato> 
Begin*/ 
<Sentencias sql>;
End

/*Crear Funciones*/ 
use sakila;

Delimiter $$
Create function Sumar(A int, B int) returns int
reads sql data 
Begin 
declare C int;
set C = A + B;
Return C;
End 
$$

/*Utilizacion de funciones*/ 
select sumar(5,3) as Resultado;

Delimiter $$
create function Sumar2 (A int, B int) returns int
Reads sql data
Return A+B ;
$$

/*Edicion de funciones*/ 
  select customer_id, 
 Amount, 
IVA(Amount, 16) as Iva,
 Amount + IVA(Amount, 16) as Total,
 IVA(Amount, 16) as IVA,
 Amount + IVA (Amount, 16) as Total,
 payment_date
 from payment 
 where customer_id = 10;
 
 Delimiter $$
 create function IVA (Monto Decimal(5,2), Tasa int)Returns Decimal(5,2)
 Reads sql data
Return Monto * Tasa/100;
$$

select IVA (500,50) as Impuesto;


/*Ventajas en el uso de funciones*/ 


