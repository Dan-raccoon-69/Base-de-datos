-- Tablas de la BD Factura
select * from cat_articulo;
select * from cat_clie;
select * from det_factura;
select * from factura;

-- Apuntes sobre la practica 3 ****************************************************************

-- Between
-- El operador BETWEEN selecciona valores dentro de un rango determinado. Los valores pueden ser números, texto o fechas. 
-- El operador BETWEEN es inclusivo: los valores iniciales y finales están incluidos.
SELECT * FROM cat_articulo WHERE precio_art BETWEEN 20 AND 30;
 -- Not Between
 -- Para mostrar los productos fuera del rango, use NOT BETWEEN
SELECT * FROM cat_articulo WHERE precio_art NOT BETWEEN 10 AND 30;
-- BETWEEN with IN
 -- La siguiente instrucción SQL selecciona todos los productos con un precio ENTRE 10 y 30. 
 -- Además;no muestre productos con un ID de 92,94 o 95:
SELECT * FROM cat_articulo WHERE (precio_art BETWEEN 10 AND 30) AND NOT id_art IN (92,94,95);
-- BETWEEN Valores de Texto Ejemplo
-- La siguiente instrucción SQL selecciona todos los clientes con un Nombre ENTRE 'Abigail' y 'Kenia':
SELECT * FROM cat_clie WHERE nom_clie BETWEEN 'Abigail' AND 'Kenia' ORDER BY nom_clie;
-- BETWEEN Fecha 
-- La siguiente instrucción SQL selecciona todas las facturas con una Fecha de factura BETWEEN '01 -Febrero-2023' y '30 -Marzo-2023':
SELECT * FROM factura WHERE fecha_fact BETWEEN '2023/02/01' AND '2023/03/30' ORDER BY fecha_fact;

-- Tipos de datos de fecha de SQL.

-- •DATE -format YYYY-MM-DD
-- •DATETIME -format: YYYY-MM-DD HH:MI:SS
-- •SMALLDATETIME -format: YYYY-MM-DD HH:MI:SS
-- •TIMESTAMP -format: a unique number

/* 
1.Las fechas se ingresan entre comillas simples.
2.Para almacenar valores de tipo fecha se permiten como separadores "/", "-" y ".".
Ejemplos:
insert into factura values(1034,125,'2023-03-15')
insert into factura values(1035,125,'2023-03-15 19:25')
insert into factura values(1036,126,'2012/03/15 13:12')
insert into factura values(1037,125,'2020.05.15')
*/

/* 
Formatos de entrada de tipo fecha
Todos los valores de tipo "datetime" se muestran en formato "año-mes-día.

-mdy: 4/15/96 (mes y día con 1 ó 2 dígitos y año con 2 ó 4 dígitos)
-myd: 4/96/15
-dmy: 15/4/1996
-dym: 15/96/4
-ydm: 96/15/4
-ydm: 1996/15/4

Ejemplo: 
Para ingresar una fecha con formato "día-mes-año",se tiene:
set dateformat dmy; 
El formato por defecto es "mdy".
*/

-- ACTIVIDAD DE LA PRACTICA 3 ******************************************************************************

/* 
1.Añadir a la tabla factura la Fecha de Entrega (use ALTER Y UPDATE) y realizar consulta 
para saber cuántos días tardo en entregar el pedido.
*/
select * from factura
alter table factura add fecha_entrega datetime;

update factura set fecha_entrega = '2023/03/14' where id_fact = 100;
update factura set fecha_entrega = '2023/03/09' where id_fact = 101;
update factura set fecha_entrega = '2023/03/02' where id_fact = 102;
update factura set fecha_entrega = '2023/04/25' where id_fact = 103;
update factura set fecha_entrega = '2023/03/27' where id_fact = 105;
update factura set fecha_entrega = '2023/03/28' where id_fact = 106;
update factura set fecha_entrega = '2013/02/21' where id_fact = 312;
-- DIFERENCIA DE FECHAS EN DIAS
-- 1era forma
SELECT id_fact, DATEDIFF(DD,fecha_fact,fecha_entrega) as DiasEntrega FROM factura;
-- 2da forma
SELECT id_fact, fecha_fact, fecha_entrega, DATEDIFF(DD,fecha_fact,fecha_entrega) as dias_de_Entrega FROM factura;

/* 
2.Añadir 5 facturas y cambiar el formato de fecha que usted decida
*/
insert into cat_clie values(131,'Sofía Martínez García','5512345678','sur 52')
insert into cat_clie values(132,'Juan Carlos Reyes Torres','5598765432','sur 71')
insert into cat_clie values(133,'Ana Isabel Pérez Jiménez','5555555555','sur 235')
insert into cat_clie values(134,'Diego Alejandro Cruz Morales','5524681357','sur 666')
insert into cat_clie values(135,'Valeria Hernández Ortiz','5536914815','sur 69')

set dateformat dmy;
insert into factura values (107,131,'12/01/2023', '28/01/2023')
insert into factura values (108,132,'24/03/2023', '02/04/2023')
insert into factura values (109,133,'17/06/2023', '25/06/2023')
insert into factura values (110,134,'02/09/2023', '28/09/2023')
insert into factura values (111,135,'29/11/2023', '09/12/2023')
select * from factura;

/*
3.Realizar 10 consultas de fechas
*/
-- Selecciona aquellos registros en donde la fecha_factura sea menor igual al 28 de feb del 2023.
SELECT * FROM factura WHERE fecha_fact <= '28/02/2023';
-- Selecciona aquellos registros en donde la fecha_factura sea mayor igual al 28 de feb del 2023.
SELECT * FROM factura WHERE fecha_fact >= '28/02/2023';
-- Selecciona aquellos registros en donde la fecha_factura sea igual al 22 de Abril del 2023.
SELECT * FROM factura WHERE fecha_fact = '22/04/2023';
-- Muestra el numero de facturas realizadas en diversos meses
SELECT MONTH(fecha_fact) as Mes, COUNT(*) as cantidadFacturas FROM factura GROUP BY MONTH(fecha_fact);
-- Muestra el numero de entregas realizadas en diversos meses
SELECT MONTH(fecha_entrega) as Mes, COUNT(*) as cantidadEntregas FROM factura GROUP BY MONTH(fecha_entrega);
-- Ordena las fechas de entrega de forma ascendente
SELECT * FROM factura ORDER BY fecha_entrega ASC;
-- Ordena las fechas de entrega de forma descendente
SELECT * FROM factura ORDER BY fecha_entrega DESC;
--Muestra los registros donde la fecha de entrega sea igual a la fecha del dia en la que te encuentres.
SELECT * FROM factura WHERE fecha_entrega = GETDATE();
--Muestra los registros donde la fecha de entrega sea igual al año 2013.
SELECT * FROM factura WHERE YEAR(fecha_entrega) = 2013;
--Muestra los registros donde la fecha de entrega sea igual al dia 14 de cualquier mes.
SELECT * FROM factura WHERE DAY(fecha_entrega) = 14;

/*
4.Realizar 10 consultas con Between
*/
-- Muestra los registros donde fecha_factura se encuentre entre el 1 de Ene del 2023 y 1 de Mar del 2023
SELECT * FROM factura WHERE fecha_fact BETWEEN '01/01/2023' AND '01/03/2023';
-- Muestra los registros donde el año de la fecha_factura se encuentre entre 2020 y 2023
SELECT * FROM factura WHERE YEAR(fecha_fact) BETWEEN 2020 AND 2023;
-- Muestra los registros donde precio del articulo se encuentre entre $20 y $50
SELECT * FROM cat_articulo WHERE precio_art BETWEEN 20.00 AND 50.00;
-- Muestra los registros donde id del factura se encuentre entre 100 y 105 y la fecha de entrega es mayor al 15 de Mar del 2023
set dateformat dmy;
SELECT * FROM factura WHERE (id_fact BETWEEN 100 AND 105) AND (fecha_entrega > '15/03/2023');
-- Muestra los registros donde el precio del articulo no se encuentre entre $10 y $30
SELECT * FROM cat_articulo WHERE precio_art NOT BETWEEN 10 AND 30;
-- Muestra los registros donde precio del articulo se encuentre entre $10 y $30 y su id del articulo no sea el 92,94 ni 95
SELECT * FROM cat_articulo WHERE (precio_art BETWEEN 10 AND 30) AND NOT id_art IN (92,94,95);
-- Muestra los registros donde el nombre del cliente empieze por Abigail hasta Kenia y ordenalos ascendentemente
SELECT * FROM cat_clie WHERE nom_clie BETWEEN 'Abigail' AND 'Kenia' ORDER BY nom_clie;
-- Muestra los registros donde el id de factura no se encuentre entre 100 y 103 y la cantidad de anticulos sea menor a 150
SELECT * FROM det_factura WHERE (id_fact NOT BETWEEN '100' AND '103') AND (cant_art < '150');
--Muestra los registros donde el id cliente se encuentre entre 125 y 127 y el numero del cliente no se encuentre el numero 5566421322
SELECT * FROM cat_clie WHERE (id_clie BETWEEN '125' AND '127') AND NOT tel_clie IN ('5566421322');
-- Muestra los registros donde el id del articulo no se encuentre entre 93 y 95 y el nombre del articulo no se encuentre Lapiz 2
SELECT * FROM cat_articulo WHERE (id_art NOT BETWEEN '93' AND '95') AND NOT Nombre_art IN ('LAPIZ 2');