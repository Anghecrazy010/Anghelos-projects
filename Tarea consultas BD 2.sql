
use sakila;

/*Tarea de las 10 consultas */
select * from film where  rental_rate between 0.99 and 5.0;
select * from film where rental_rate not between 5.0 and 10;
select * from film where rental_duration between 1 and 3;
select * from film where release_year between '2000' and '2010';
select * from film where rental_rate = 2+2;
select * from customer where  last_name like 'Williams';
select * from customer where  first_name like  'L%';
select * from customer where address_id between 2 and 20;
select * from customer where create_date between '2006-02-10' and '2006-10-02';
select * from customer where last_name like '%nd%';