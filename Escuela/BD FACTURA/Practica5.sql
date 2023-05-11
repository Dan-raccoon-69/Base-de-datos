
------------consulta de cero o mas caracteres-------------------
use factura;
create table practica5 (
id int not null IDENTITY (1,1),
nombre varchar (45),
curp varchar(20),
boleta varchar (10),
primary key (id),
unique (id,curp),
)

insert into practica5 (nombre,curp,boleta) values ( 'CRUZ GARZA LETICIA',' CUGL770826MCCRRT67','2017546522')
insert into practica5 (nombre,curp,boleta) values ( 'CRUZ GUTIERREZ CARLOS',' CUGC01523HCCRTRE6','2018646522')
insert into practica5 (nombre,curp,boleta) values ( 'GOMEZ CORDERO JAIME',' GOCJ87111HHGMRM15','2021546522')
insert into practica5 (nombre,curp,boleta) values ( 'ZUÑIGA MARTINEZ MIRANDA',' ZUMM081225MCSÑRRV8','2022355444')
insert into practica5 (nombre,curp,boleta) values ( 'GARCIA ROMERO JOSE',' GARJ12231HCSRMSU2','2022301455')
insert into practica5 (nombre,curp,boleta) values ( 'GONZALEZ PEREZ FATIMA',' GOPF0395MCXNRTH6','2021354588')
Select * from practica5

------------consulta de cero o mas caracteres-------------------

SELECT [nombre],[boleta] from practica5 where nombre like 'CR%'

SELECT [nombre],[boleta] from practica5 where nombre like 'Z%'

------------------ un solo catacter--------
SELECT [nombre], [boleta], curp from practica5 where curp like '----------C%'
SELECT [nombre],[boleta],curp from practica5 where boleta like '---2%'
SELECT [nombre], [boleta] from practica5 where nombre like '[go]%'
SELECT [nombre],[boleta] from practica5 where nombre like '[CR]%'