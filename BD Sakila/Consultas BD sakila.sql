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

/* CONSULTAS CON BETWEEN. */

/* Consulta la tabla payment de la base de datos sakila, 
filtra la información donde amount esté entre 2.99 y 4.99,  staff_id sea igual a 2 y customer_id sea 1 y 2. */
select * from payment where (amount between 2.99 and 4.99) and (staff_id = 2) and (customer_id between 1 and 2);

/* Consulta la tabla address de la base de datos sakila, 
filtra la información donde city_id esté entre 300 y 350. */
select * from address where city_id between 300 and 350;

/* Consulta la tabla film de la base de datos sakila, 
filtra la información donde rental_rate esté entre 0.99 y 2.99, length sea menor igual de 50  y replacement_cost sea menor de 20. */
select * from film where (rental_rate between 0.99 and 2.99) and (length <= 50) and (replacement_cost < 20);

/* CONSULTAS CON LIKE. */

/* Consulta la tabla film de la base de datos sakila, 
filtra la información donde release_year sea igual a 2006  y title empiece con ALI. */
select * from film where (release_year = 2006) and (title like 'ALI%');

/* CONSULTAS INNER JOIN, LEFT JOIN, RIGHT JOIN. */

/* Consulta la tabla address de la base de datos sakila,
realiza un INNER JOIN con las tablas city y country, mostrar las columnas address, city, country */
select * from address;
select * from city;
select * from country;
select ad.address as Direccion, ci.city as Ciudad, co.country as Pais from address ad inner join city ci on (ad.city_id = ci.city_id) 
inner join country co on (ci.country_id = co.country_id);

/* Consulta la tabla customer de la base de datos sakila,
realiza un LEFT JOIN con las tablas store y address, mostrar las columnas first_name, address, store_id */
select * from customer;
select * from address;
select * from store;
select c.first_name as Nombre, a.address as Direccion , s.store_id as ID_Store from sakila.customer c left join sakila.store s 
on (c.store_id = s.store_id) left join sakila.address a on (c.address_id = a.address_id);


