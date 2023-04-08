use sakila;
show tables;

/* CLAUSULAS SELECT, DISTINC, ORDER BY */

/* Consulta store_id, first_name y last_name de la tabla customer de la base de datos sakila, 
cambia el nombre de las columnas store_id, first_name y last_name a Tienda, Nombre y Apellido respectivamente,
y ordena de manera descendente la columna Apellido  */
select store_id as Tienda, first_name as Nombre, last_name as Apellido from customer order by apellido desc;

/* Consulta la tabla payment de la base de datos sakila,  
¿Cuál es la cantidad mas baja y mas alta de la columna amount? */
select max(amount) as mayor from payment;
select min(amount) as menor from payment;
select distinct amount from payment order by amount asc;

/* CLAUSULA WHERE */

/* Consulta description, release_year de la tabla film de la base de datos sakila, 
Filtra la información donde title sea IMPACT ALADDIN */
select description, release_year from film where title = "IMPACT ALADDIN";

/* Consulta la tabla payment de la base de datos sakila, 
filtra la información donde amount sea mayor a 0.99. */
select * from payment where amount > 0.99;

/* CONSULTAS CON OPERADORES AND, OR, NOT. */

/* Consulta la tabla payment de la base de datos sakila, 
filtra la información donde customer_id sea igual a 36, amount sea mayor a 0.99 y staff_id sea igual a 1. */
select * from payment where customer_id = 36 and amount > 0.99 and staff_id = 1;

/* Consulta la tabla rental de la base de datos sakila, 
filtra la información donde staff_id no sea 1, customer_id sea mayor a 250 y inventory_id sea menor de 100. */
select * from rental where staff_id <> 1 and customer_id > 250 and inventory_id < 100;

/* CONSULTAS CON OPERADOR IN */

/* Consulta la tabla film_text de la base de datos sakila, 
filtra la información donde title  sea ZORRO ARK, VIRGIN DAISY, UNITED PILOT */
select * from film_text where title in ('ZORRO ARK', 'VIRGIN DAISY', 'UNITED PILOT');

/* Consulta la tabla city de la base de datos sakila,
filtra la información donde city sea Chiayi, Dongying, Fukuyama y Kilis. */
select * from city where city in ('Chiayi', 'Dongying', 'Fukuyama', 'Kilis');
