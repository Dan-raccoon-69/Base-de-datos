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

/* CONSULTAS COUNT, AVG, SUM, MAX, MIN. */

/* Consulta la tabla rental de la base de datos sakila, 
realiza un COUNT de  la columna rental_id */
select * from rental;
select count(rental_id) as Total_Registros from rental;

/* Consulta la tabla payment de la base de datos sakila, 
realiza un MAX de  la columna amount */
select max(amount) as Cantidad_Maxima from payment;

/* CONSULTAS CON GROUP BY. */

/* Consulta la tabla actor de la base de datos sakila,
realiza un conteo de la columna de cada last_name. */
select last_name, count(last_name) from actor group by last_name;

/* Consulta la tabla payment y  customer de la base de datos sakila,
muestra en la tabla las columnas customer_id, first_name, last_name y la suma total de amount de cada customer_id */
select * from payment;
select * from customer;
select c.customer_id as Id_Cliente, c.first_name as Nombre, c.last_name as Apellido, sum(p.amount) as Cantidad 
from payment p inner join customer c on (c.customer_id = p.customer_id) group by c.customer_id;

/* CONSULTAS CON HAVING. */

/* Consulta la tabla payment y  customer de la base de datos sakila,
muestra en la tabla las columnas customer_id, first_name, last_name y la suma total de amount de cada customer_id 
cuando la suma total de amount sea < 80 y de acuerdo al campo amount ordenalos de forma descendente */
select c.customer_id as Id_Cliente, c.first_name as Nombre, c.last_name as Apellido, sum(p.amount) as Cantidad 
from payment p inner join customer c on (c.customer_id = p.customer_id) group by c.customer_id
having sum(p.amount) < 80 order by sum(p.amount) desc;

/* Consulta la tabla actor de la base de datos sakila, 
realiza un COUNT de  last_name, mostrar cuando el COUNT sea mayor de 2 */
select * from actor;
select last_name as Apellido, count(last_name) as Conteo_Apellidos from actor 
group by last_name having count(last_name) > 2;

/* Más CONSULTAS */

-- ¿Qué actores tienen el primer nombre 'Scarlett'?
select * from actor where first_name = 'Scarlett';

-- ¿Qué actores tienen el apellido "Johansson"?
select * from actor where last_name = 'Johansson';

-- ¿Cuántos apellidos de actores distintos hay?
select distinct(last_name) from actor;

-- ¿Qué apellidos no se repiten?
select last_name from actor group by last_name having count(last_name) < 2;

-- ¿Qué actor ha aparecido en la mayoría de las películas?
select * from film_actor;
select * from film;
select * from actor;

select fa.actor_id, a.first_name, a.last_name, count(fa.actor_id) from film_actor fa
inner join film f on (fa.film_id = f.film_id)
inner join actor a on (a.actor_id = fa.actor_id) 
group by actor_id 
order by count(actor_id) desc
limit 1;

-- ¿Se puede alquilar ‘Academy Dinosaur’ en la tienda 1?
-- Conociendo que film_id = 1 = Academy Dinosaur.
select f.film_id, f.title, i.store_id from film f 
inner join inventory i on (f.film_id = i.film_id) 
having f.film_id = 1;