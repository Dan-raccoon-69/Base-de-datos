--  Crear una base de datos.
create database prueba;
-- Estamos diciendo a MYSQL que base de datos vamos a usar.
use prueba;
-- Eliminar una base de datos.
drop database prueba;
-- Muestra todas las base de datos existente
show databases;
/*
// Crear tabla en la DB
sintaxis: 
CREATE TABLE name_table (
    // columnas de la tabla 
    sintaxis: [atributo] [tipo de dato] [longitud] *opcionales[atributos]
    // llave primaria
    // El ID  es un identificador unico, es la llave primaria (primary key).
    sintaxis: PRIMARY KEY (atributo, el id de la tabla)
);
*/


/*CREACION DE TABLAS EN UNA NUEVA BASE DE DATOS ********************************/
create database tienda;
use tienda;
create table producto(
	idProducto int auto_increment primary key,
    nombre varchar(50) not null,
    -- La sintaxis del dato decimal: el 10 indica el valor entero y el 2 indica los decimales 
    precio decimal(10, 2) not null,
	fecha_venta date
);
-- Muestra las tablas que existen en la base de datos
show tables;
-- Muestra las columnas de la tabla producto 
show columns from producto;
-- Eliminar una tabla
drop table producto;
drop table codigoBarras;
/* RELACIONES ENTRE TABLAS *************************************/
/* 
	Las tablas tienen que estar relacionadas formando estructuras relacionales. 
    La relacion es una asociacion establecida entre campos comunes (columnas) en dos tablas.
    
    Existen 3 relaciones:
    1. Relacion uno a uno
    R = Se da cuando un registro esta relacionado con otro y con ese solamente, y 
    a su vez este segundo tambien estara relacionado solamente con el primero.
    Ejemplo: un producto tiene un codigo de barras, y un codigo de barras le corresponde solo a 1 producto.

    
    2. Relacion uno a muchos
    R = Un registro estara relacionado solo con otro, pero este segundo podra estar relacionado con más de uno.
    Ejemplo: un producto tiene solo una categoria, pero una categoria tiene muchos productos.
    
    3. Relacion de muchos a muchos
    R = Cada registro de la tabla A, se le puede asociar varios registros de la tabla B, y cada registro de la tabla B puede 
    estar relacionado con más de un registro de la tabla A.
    Ejemplo: cada producto puede tener varios provedores, y asu vez, un provedor puede prover muchos productos.
*/

/* EJEMPLO DE UNA RELACION 1 A 1 ******************************/

create table producto (
	idProducto int auto_increment,
    idCategoria int not null,
    nombre varchar(50) not null, 
    precio decimal(10,2) not null,
    fechaVenta date not null,
    primary key (idProducto),
    constraint fk_id_Categoria foreign key (idCategoria) references categoria (idCategoria)
    on delete cascade
    on update cascade
);

create table codigoBarras (
	idCodigoBarras int auto_increment,
    idProducto int not null, 
    serie varchar(30) not null, 
    primary key (idCodigoBarras),
    constraint fk_id_producto foreign key (idProducto) references producto(idProducto)
    on delete cascade
    on update cascade
);

insert into codigoBarras (idProducto, serie) values 
(1, "asldhve"),
(16, "ncvatey");

show columns from codigoBarras;

/* INGRESAR REGISTROS A LA TABLA ************************************/

-- Creamos una tabla:
create table categoria (
	idCategoria int auto_increment,
    nombre varchar(50) not null, 
    primary key (idCategoria)
);

-- Hay 3 formas de poder ingresar elementos
-- 1. Como el idCategoria es aunto incremente, no hay necesidad de colocarlo, solo debemnos decirme a mysql que algo debe ir alli (NULL)
insert into categoria values (NULL, "Bebidas");
-- 2. Si no quieres colocar NULL, solo coloca el nombre del campo y su valor.
insert into categoria (nombre) values ("Bebidas");
-- 3. Si quieres colocar multiples registros en una sola linea, debes de separarlos por comas:
insert into categoria (nombre) values ("Detergentes"), ("Galletas"), ("Chocolates"), ("Frituras");
select * from categoria;
/* Agregando datos a producto ***************************/
insert into producto (idCategoria, nombre, precio, fechaVenta) values 
(1, "Coca Cola", 20, "2000-05-31");

insert into producto (idCategoria, nombre, precio, fechaVenta) values 
(1, "Pepsi", 18, "2000-07-14"),
(2, "Clorox", 30, "2005-02-03"),
(3, "Trikitrakatelas", 17, "2003-10-10"),
(4, "Kiss", 40, "2010-02-14"),
(5, "Doritos", 17, "2003-05-31"),
(5, "Doritos", 17, "2003-05-31"),
(5, "Chetoos", 15, curdate());
/* El metodo curdate te muestra guarda la fecha actual, asi no tienes que escribir la fecha varias veces*/
select * from producto;
select * from codigoBarras;

/* MODIFICAR REGISTRO EN LA TABLA ****************************/
/* Vamos a modificar el dato de un campo de la tabla producto*/
-- sintaxis: UPDATE name_table SET atributo  = valor WHERE atributo = dato;
update producto set nombre = "Ferrero rocher" where idProducto = 19;
update producto set precio = 59.99 where idProducto = 19;

/* MODIFICAR TABLA *******************************************/
/* Vamos a agregar un campo a la tabla producto*/ 
-- sintaxis: ALTER TABLE name_BD MODIFY COLUMN [campo] [tipo_de_dato] [atributo]; 
alter table producto add column cantidadProducto int not null;
update producto set cantidadProducto = 100 where idProducto = 1;

/* ELIMINAR REGISTROS DE LA TABLA *****************************/
-- Sintaxis: DELETE FROM name_table where id = valor;
/* Estamos borrando el producto cuyo idProducto = 22*/
delete from producto where idProducto = 22;
-- comprobando
select * from producto;
select * from categoria;

/* MAS EJEMPLOS DE CONSULTAS ****************************/
-- No se necesita mostrar todos los datos de una tabla, podemos saber un campo en especifico:
select nombre from producto;
-- O ciertos campos nada mas: 
select idProducto, idCategoria, precio from producto;
-- Agregarle un "alias" al nombre del campo, ojo que es "temporal", se sigue llamando de la misma forma
/* Si mi campo se llama nombre, puedo colocarle el alias de nombreProducto*/
select nombre as 'nombreProducto', idProducto, precio from producto;
-- Ahora en la tabla nos muestra "nombreProducto", ya no "nombre".
-- AGREGANDO LA CLAUSULA WHERE
-- Muestra todos los datos siempre y cuando el idProducto sea igual a 1.
select * from producto where idProducto = 1;
-- Muestra todos los datos siempre y cuando pertenezcan a la categoria igual a 1.
select * from producto where idCategoria = 1;
-- Muestra el nombre y precio de los registros donde la cantidad de productos sean mayores a 100.
select nombre, precio from producto where cantidadProducto >= 100;
-- Ordenar el nombre de los productos alfabeticamente ascendente
select nombre, precio from producto order by nombre asc;
-- Ordenar el nombre de los productos alfabeticamente descendente
select nombre, precio from producto order by nombre desc;

-- Sabes muy bien, ue puedes utilizar operadores logicos, AND, OR, NOT, XOR, NAND, NOR , BETTEWN, etc.
/* Los ejemplos estan en tu carpeta de BD del IPN*/
-- Para el operador NOT, puedes utilizar "!=" o puede usar "<>".

/* LIKE se usa para encontrar coincidencias */
-- Esta sentencia nos muestra lo que va iniciando en la palabra y le da igual como termina
select * from producto where nombre like 'Dor%';
-- Esta sentencia nos muestra lo que va iniciando en la palabra y le da igual como termina
select * from producto where nombre like '%tos';