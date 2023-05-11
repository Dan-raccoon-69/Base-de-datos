create database FACTURA
use Factura

create table cat_clie
(
id_clie int,
nom_clie nvarchar (50),
tel_clie nvarchar (12),
dir_clie nvarchar(28),
primary key (id_clie),
)

select * from cat_clie

insert into cat_clie values(125,'Arturo Teoyotl Martinez','5566421355','sur20')
insert into cat_clie values(126,'Abigail Romerro Navarrete','5566421322','sur 21')
insert into cat_clie values(127,'Pablo Molina Chavarria','5566421885','sur 230')
insert into cat_clie values(128,'Diego Lucas Arena','5566421775','sur 201')
insert into cat_clie values(129,'Kenia Franco Segundo','5566421885','sur208')
insert into cat_clie values(130,'Isaac Caballero Barcenas','5566421365','sur210')

create table factura (
id_fact int,
id_clie int,
fecha_fact datetime, 
primary key (id_fact),
foreign key (id_clie) references cat_clie
)

select*from factura

insert into factura values (100,125,'2023-03-09')
insert into factura values (101,126,'2023-03-04')
insert into factura values (102,127,'2023-02-20')
insert into factura values (103,129,'2023-04-22')
/* no existe el id_clie 117 por lo tanto marca error*/
insert into factura values (106,117,'2023-10-14')
insert into factura values (105,129,'2023-03-15')
insert into factura values (106,130,'2023-03-15')
select*from factura

delete FACTURA where id_fact =310

create table cat_articulo (
id_art int,
nombre_art varchar (20),
precio_art int
primary key (id_art)
)

insert into cat_articulo values(90,'GOMA 23',8.5)
insert into cat_articulo values(91,'LAPIZ 2',10.5)
insert into cat_articulo values(92,'LAPIZ 6',6.25)
insert into cat_articulo values(93,'PLUMA A',8.0)
insert into cat_articulo values(94,'COLORES X',18.5)
insert into cat_articulo values(95,'PLUMA B',10.5)

select*from cat_articulo

create table det_factura (
id_fact int foreign key references FACTURA,
id_art int,
cant_art int 
primary key (id_fact,id_art)
foreign key (id_art) references cat_articulo
)

insert into det_factura Values(100,90,100)
insert into det_factura Values(101,91,120)
insert into det_factura Values(102,92,200)
insert into det_factura Values(103,93,400)
insert into det_factura Values(105,94,150)
insert into det_factura Values(106,95,100)

/*
insert into det_factura Values(1010,94,120)
insert into det_factura Values(1010,93,200)
insert into det_factura Values(1010,91,400)
insert into det_factura Values(1012,94,150)
*/

select*from factura 
select*from det_factura

/* 
Borra la tabla completamente:
drop table det_factura
*/

select*from factura
select*from cat_clie
select*from det_factura
select*from cat_articulo

/* False*/
DELETE cat_clie WHERE id_clie = 125
/* True*/
update cat_clie set nom_clie ='NOEMI PEREZ.' where id_clie = 127
/* False*/
delete cat_clie where id_clie=125

select*from FACTURA
select*from cat_clie

insert into FACTURA values(312,126,'2013-02-11 19:25')
insert into cat_clie values(120,'sarai g.',5222984581,'sur 188')

--Agregar una columna a una tabla:
alter table cat_clie add cp int
--Eliminar una columna de una tabla:
alter table cat_clie drop column cp

/* False */ 
alter table cat_clie drop column id_clie

select*from cat_clie 
--SELECT DE ALGUNOS CAMPOS Y CAMBIO DE NOMBRES DE COLUMNAS = Y EL AS
select id_clie,nom_clie,tel_clie from cat_clie
select clave_cliente =id_clie,nom_clie,telefono =tel_clie from cat_clie 
select id_clie as clave_cliente,nom_clie,telefono =tel_clie from cat_clie

--CLAUSULA WHERE Y OPERADORES DE RELACION
select*from det_FACTURA
select*from det_FACTURA where id_fact =101 
select*from det_FACTURA where cant_art >100
select*from det_FACTURA where cant_art >=100
select*from det_FACTURA where cant_art <300
select*from det_FACTURA where cant_art <=200
select*from det_FACTURA where cant_art <>200
select*from det_FACTURA where cant_art !=200
select*from cat_clie where id_clie =129

