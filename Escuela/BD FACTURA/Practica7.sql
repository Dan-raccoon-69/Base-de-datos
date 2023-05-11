select * from cat_articulo
select * from det_factura;
select * from factura;
select * from cat_clie

/* Insertar los siguientes Clientes con todos sus datos */
alter table cat_clie add delegacion nvarchar(70);
ALTER TABLE cat_clie ALTER COLUMN dir_clie nvarchar(70);
INSERT INTO cat_clie (id_clie, nom_clie, tel_clie, dir_clie, delegacion)
VALUES
(137, 'ABARCA GODOY ALVARO', '57296000', 'Benito Juarez 25 Col. Arboles', 'Chalco'),
(138,'AMARO ARREDONDO JESUS MARTIN', '57296000', 'Benito Juarez 25 Col. Arboles', 'Nezahualcóyotl'),
(139, 'BUSTAMANTE SERDIO DIEGO ALEJANDRO', '57296000', 'Benito Juarez 250 Col. Arboles Grandes del Sur', 'Coyoacán'),
(140,'CABALLERO BARCENAS ISAAC BARUCH', '57296000', 'Benito Juarez 25 Col. Arboles', 'Cuajimalpa'),
(141,'CAMACHO VELAZQUEZ OBED', '57296000', 'Benito Juarez 25 Col. Arboles', 'Benito Juárez'),
(142,'CASTILLO VALENCIA BRANDON OMAR', '57296000', 'Benito Juarez 25 Col. Arboles', 'V. Carranza'),
(143,'CUELLAR CERVANTES ARTURO ADAIR', '57296000', 'Benito Juarez 25 Col. Arboles', 'Ecatepec'),
(144,'DE LA CRUZ BAUTISTA DANIEL GUSTAVO', '57296000', 'Benito Juarez 25 Col. Arboles', 'Naucalpan'),
(145, 'FLORES LINARES ALBERTO', '57296000', 'Benito Juarez 25 Col. Arboles', 'G. A. Madero'),
(146, 'FRANCO SEGUNDO KENIA', '57296000', 'Benito Juarez 25 Col. Arboles', 'Chalco'),
(147, 'HERNANDEZ CARDENAS ALBERTO', '57296000', 'Benito Juarez 25 Col. Arboles', 'Nezahualcóyotl'),
(148,'HERNANDEZ CORTES CARLOS URIEL', '57296000', 'Benito Juarez 25 Col. Arboles', 'Coyoacán'),
(149, 'HERNANDEZ HERNANDEZ LILI MARLENE', '57296000', 'Benito Juarez 25 Col. Arboles', 'Cuajimalpa'),
(150, 'LOPEZ LOPEZ KATHIA', '57296000', 'Benito Juarez 25 Col. Arboles', 'Benito Juárez'),
(151, 'LUCAS ARENAS DIEGO', '57296000', 'Benito Juarez 250 Col. Arboles Grandes del Sur', 'Ometepec'),
(152, 'MARTINEZ ABURTO DAVID', '57296000', 'Benito Juarez 25 Col. Arboles', 'Ecatepec'),
(153, 'MARTINEZ CAZARES LUIS ENRIQUE', '57296000', 'Benito Juarez 25 Col. Arboles', 'Naucalpan'),
(154, 'MARTINEZ LOPEZ LUIS SEBASTIAN', '57296000', 'Benito Juarez 25 Col. Arboles', 'G. A. Madero'),
(155, 'MARTINEZ SANVICENTE JOSE DANIEL', '57296000', 'Benito Juarez 25 Col. Arboles', 'Chalco'),
(156, 'MOLINA CHAVARRIA PABLO', '57296000', 'Benito Juarez 25 Col. Arboles', 'Nezahualcóyotl'),
(157, 'NAVARRO VARGAS MIGUEL ANGEL', '57296000', 'Benito Juarez 25 Col. Arboles', 'Coyoacán'),
(158, 'OROZCO QUEVEDO AXEL ALFREDO', '57296000', 'Benito Juarez 25 Col. Arboles', 'Cuajimalpa'),
(159, 'ORTIZ RANGEL MARIO ANDRES', '57296000', 'Benito Juarez 250 Col. Reforma', 'Almoloya'),
(160, 'PELAGIO CIBRIAN GABRIELA YOLOTZIN', '57296000', 'Benito Juarez 25 Col. Arboles', 'V. Carranza'),
(161, 'PEREZ RAMIREZ JUAN PABLO', '57296000', 'Benito Juarez 25 Col. Arboles', 'Ecatepec'),
(162, 'ROQUE RAMIRES JESUS GUADALUPE', '57296000', 'Benito Juarez 25 Col. Arboles', 'Naucalpan'),
(163, 'SALAZAR AGUILAR ANGELICA JAZMIN', '57296000', 'Benito Juarez 25 Col. Arboles', 'G. A. Madero');

/* Agregando Productos nuevos */
ALTER TABLE cat_articulo ALTER COLUMN nombre_art nvarchar(70);
INSERT INTO cat_articulo (id_art, nombre_art, precio_art)
VALUES
(100, 'Marcador para pizarrón blanco', 10),
(101,'Regla T', 5),
(102, 'USB', 50),
(103,'Escritorio negro', 100),
(104,'Escritorio blanco', 200),
(105,'Mesa plegable', 500),
(106,'Bolígrafo punto fino negro', 25),
(107,'Post it', 50),
(108,'Cartulina', 5),
(109, 'Hojas Blancas', 100),
(110, 'Etiquetas', 2);


set dateformat ymd; 
/* A 1 cliente venderle un marcador para pizarrón blanco */
insert into factura values(112,144,'2023-10-15', '2023-11-15');
insert into det_factura values(112,100,1);
/* Vender a 1 cliente 7 artículos */
insert into factura values(113,137,'2023-08-05', '2023-10-06');
insert into factura values(114,137,'2023-08-05', '2023-10-06');
insert into factura values(115,137,'2023-08-05', '2023-10-06');
insert into factura values(116,137,'2023-08-05', '2023-10-06');
insert into factura values(117,137,'2023-08-05', '2023-10-06');
insert into factura values(118,137,'2023-08-05', '2023-10-06');
insert into factura values(119,137,'2023-08-05', '2023-10-06');
insert into det_factura values(113,101,1);
insert into det_factura values(114,102,1);
insert into det_factura values(115,103,1);
insert into det_factura values(116,104,1);
insert into det_factura values(117,105,1);
insert into det_factura values(118,106,1);
insert into det_factura values(119,107,1);

/* A 1 cliente venderle una regla T */
insert into factura values(120,157,'2023-12-01', '2023-12-29');
insert into det_factura values(120,101,1);

/* A 1 cliente venderle un usb */
insert into factura values(121,154,'2023-01-21', '2023-02-06');
insert into det_factura values(121,102,1);

/* A 15 clientes 3 artículos (escritorio negro, escritorio blanco, mesa plegable,
bolígrafo punto fino negro, post it, cartulina, hojas blancas, etiquetas */
-- 1er cliente
insert into factura values(122,138,'2023-03-10', '2023-04-06');
insert into det_factura values(122,103,3);
-- 2do cliente
insert into factura values(123,139,'2023-02-10', '2023-04-06');
insert into det_factura values(123,104,3);
-- 3er cliente
insert into factura values(124,140,'2023-02-14', '2023-04-11');
insert into det_factura values(124,105,3);
-- 4to cliente
insert into factura values(125,141,'2023-01-20', '2023-04-20');
insert into det_factura values(125,106,3);
-- 5to cliente
insert into factura values(126,142,'2023-01-20', '2023-04-20');
insert into det_factura values(126,107,3);
-- 6to cliente
insert into factura values(127,143,'2023-11-23', '2023-12-20');
insert into det_factura values(127,108,3);
-- 7mo cliente
insert into factura values(128,145,'2023-02-14', '2023-06-01');
insert into det_factura values(128,109,3);
-- 8vo cliente
insert into factura values(129,146,'2023-02-14', '2023-06-01');
insert into det_factura values(129,110,3);
-- 9no cliente
insert into factura values(130,147,'2023-04-14', '2023-06-01');
insert into det_factura values(130,110,3);
-- 9no cliente
insert into factura values(131,148,'2023-03-14', '2023-04-01');
insert into det_factura values(131,109,3);
-- 10mo cliente
insert into factura values(132,149,'2023-03-14', '2023-05-01');
insert into det_factura values(132,108,3);
-- 11vo cliente
insert into factura values(133,150,'2023-05-14', '2023-06-01');
insert into det_factura values(133,107,3);
-- 12vo cliente
insert into factura values(131,148,'2023-03-14', '2023-04-01');
insert into det_factura values(131,109,3);
-- 13vo cliente
insert into factura values(134,151,'2023-03-14', '2023-04-01');
insert into det_factura values(134,108,3);
-- 14vo cliente
insert into factura values(135,152,'2023-02-14', '2023-03-01');
insert into det_factura values(135,107,3);
-- 15vo cliente
insert into factura values(136,153,'2023-02-20', '2023-03-30');
insert into det_factura values(136,106,3);
-- 16vo cliente
insert into factura values(142,161,'2023-02-20', '2023-03-30');
insert into det_factura values(142,109,1);
insert into factura values(143,161,'2023-03-04', '2023-03-30');
insert into det_factura values(143,100,1);

/* A 5 clientes 5 artículos */
-- 1er cliente
insert into factura values(137,155,'2023-05-20', '2023-05-30');
insert into det_factura values(137,101,5);

-- 2do cliente
insert into factura values(138,156,'2023-05-05', '2023-05-10');
insert into det_factura values(138,106,5);

-- 3er cliente
insert into factura values(139,158,'2023-06-07', '2023-06-30');
insert into det_factura values(139,107,5);

-- 4to cliente
insert into factura values(140,159,'2023-05-20', '2023-05-30');
insert into det_factura values(140,108,5);

-- 5to cliente
insert into factura values(141,160,'2023-02-20', '2023-03-30');
insert into det_factura values(141,110,5);

/* Realizar las siguientes consultas */

-- 1.Qué clientes viven en Coyoacan,Nezahualcoyolt y Naucalpan
select * from cat_clie where delegacion in ('Coyoacán', 'Nezahualcóyotl', 'Naucalpan');

-- 2.Qué id_clientes han facturado usb, reglaT, y post it
/* 102 = USB, 101 = reglaT, 107 = Post it */

-- usar este sentencia para comprobar
select f.id_fact, f.id_clie, det.id_art from factura f inner join det_factura det 
on (f.id_fact = det.id_fact) 

-- resultado
SELECT f.id_clie FROM Factura f
INNER JOIN det_factura det ON f.id_fact = det.id_fact
WHERE det.id_art IN (102, 101, 107) GROUP BY f.id_clie
HAVING COUNT(det.id_art) = 3;

-- 3.Qué id_clientes han facturado hojas blancas y marcador para pizarrón blanco
/* 109 = hojas blancas, 100 = Marcador para pizarrón blanco */

-- usar este sentencia para comprobar
select f.id_fact, f.id_clie, det.id_art from factura f inner join det_factura det 
on (f.id_fact = det.id_fact) 

-- resultado
SELECT f.id_clie FROM Factura f
INNER JOIN det_factura det ON f.id_fact = det.id_fact
WHERE det.id_art IN (109, 100) GROUP BY f.id_clie
HAVING COUNT(det.id_art) = 2;

-- 4.Qué id_clientes han facturado cartulina o etiquetas o post it
/* 108 = cartulina, 110 = etiquetas, 107 = post it */
select f.id_clie, det.id_art from factura f inner join det_factura det on (f.id_fact = det.id_fact) 
where det.id_art in (108, 110, 107);

-- 5.Qué id_clientes han facturado escritorio negro o usb 
/* 102 = USB, 103 = Escritorio negro */
select f.id_clie, det.id_art from factura f inner join det_factura det on (f.id_fact = det.id_fact) 
where det.id_art in (102, 103);

-- 6.Qué clientes viven en el estado de México y usted supone que son mujeres
select * from cat_clie where delegacion in ('Chalco', 'Nezahualcóyotl', 'Ecatepec', 'Almoloya') 
AND id_clie in (146, 149, 150, 160, 163)

-- 7.Que clientes viven en el estado de México
select id_clie, nom_clie from cat_clie where delegacion in ('Chalco', 'Nezahualcóyotl', 'Ecatepec', 'Almoloya') 