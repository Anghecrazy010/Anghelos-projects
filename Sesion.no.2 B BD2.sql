/*Sesion no.2 B */
/*Analisis sentencia join -Setencia inner join */
/*Join sintaxis general */
select 
<Lista de campos>
From 
Tabla 1
inner/Left/Right/Join Tabla 2 on <Expresion relacional>

/*Setencia inner join*/
use sakila;
select * from customer;
select * from address;

select customer_id,
First_name,
Last_name,
address,
District
From
address
inner Join customer on address.address_id = customer.address_id;

/*Uso de alias en tablas*/
select customer_id,
First_name,
Last_name,
address,
District
From
address as A 
inner Join customer as C on A.address_id = C.address_id;

/*¿Que es la ambigüedad? y como evitarla*/
select customer_id,
First_name,
Last_name,
A.address_id,
address,
District
From
address as A 
inner Join customer as C on A.address_id = C.address_id;

/*Sentencia Left Join*/
select customer_id,
First_name,
Last_name,
A.address_id,
address,
District
From
address as A 
Left Join customer as C on A.address_id = C.address_id;

select customer_id,
First_name,
Last_name,
A.address_id,
address,
District
From
address as A 
Left Join customer as C on A.address_id = C.address_id
where c.address_id is null;

/*Sentencia Right Join*/
select customer_id,
First_name,
Last_name,
A.address_id,
address,
District
From
customer as C
Right Join address as A on C.address_id = A.address_id;

select customer_id,
First_name,
Last_name,
A.address_id,
address,
District
From
customer as C
Right Join address as A on C.address_id = A.address_id
where C.address_id is null; 








