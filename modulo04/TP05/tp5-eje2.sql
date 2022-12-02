DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas CHARACTER SET utf8mb4;
USE ventas;
CREATE TABLE clientes (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
ciudad VARCHAR(100),
categoría INT UNSIGNED
);
CREATE TABLE vendedores (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
comisión FLOAT
);
CREATE TABLE pedidos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cantidad DOUBLE NOT NULL,
fecha DATE,
id_cliente INT UNSIGNED NOT NULL,id_vendedor INT UNSIGNED NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id),
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id)
);
INSERT INTO clientes VALUES(1, 'Aarón', 'Rivero', '20-4148122-1', 'Garuhape',
100);
INSERT INTO clientes VALUES(2, 'Adela', 'Salas', '27-42482596-3', 'Capiovi',
200);
INSERT INTO clientes VALUES(3, 'Adolfo', 'Rubio', '23-37928596-3', 'Posadas',
NULL);
INSERT INTO clientes VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO clientes VALUES(5, 'Marcos', 'Loyola', '24-42481327-3', 'Posadas',
200);
INSERT INTO clientes VALUES(6, 'María', 'Santana', '27-38771523-1', 'Obera',
100);
INSERT INTO clientes VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO clientes VALUES(8, 'Pepe', 'Ruiz', '20-27436152-2', 'Iguazu', 200);
INSERT INTO clientes VALUES(9, 'Guillermo', 'López', '20-42481328-1',
'Andresito', 225);
INSERT INTO clientes VALUES(10, 'Daniel', 'Santana', '20-40159624-3',
'Apostoles', 125);
INSERT INTO vendedores VALUES(1, 'Daniel', 'Sáez', '24-38481296-3', 0.15);
INSERT INTO vendedores VALUES(2, 'Juan', 'Gómez', '20-39231523-3', 0.13);
INSERT INTO vendedores VALUES(3, 'Diego','Flores', '20-38481221-3', 0.11);
INSERT INTO vendedores VALUES(4, 'Marta','Herrera', '27-40481736-1', 0.14);
INSERT INTO vendedores VALUES(5, 'Antonia','Carretero', '20-31481370-7', 0.12);
INSERT INTO vendedores VALUES(6, 'Manuel','Domínguez', '20-29876342-3', 0.13);
INSERT INTO vendedores VALUES(7, 'Antonio','Vega', '20-32521596-3', 0.11);
INSERT INTO vendedores VALUES(8, 'Alfredo','Ruiz', '20-42436477-3', 0.05);
INSERT INTO pedidos VALUES(1, 150.5, '2020-10-05', 5, 2);
INSERT INTO pedidos VALUES(2, 270.65, '2019-09-10', 1, 5);
INSERT INTO pedidos VALUES(3, 65.26, '2022-10-05', 2, 1);
INSERT INTO pedidos VALUES(4, 110.5, '2021-08-17', 8, 3);
INSERT INTO pedidos VALUES(5, 948.5, '2021-09-10', 5, 2);
INSERT INTO pedidos VALUES(6, 2400.6, '2021-07-27', 7, 1);
INSERT INTO pedidos VALUES(7, 5760, '2018-09-10', 2, 1);
INSERT INTO pedidos VALUES(8, 1983.43, '2021-10-10', 4, 6);
INSERT INTO pedidos VALUES(9, 2480.4, '2019-10-10', 8, 3);INSERT INTO pedidos VALUES(10, 250.45, '2018-06-27', 8, 2);
INSERT INTO pedidos VALUES(11, 75.29, '2021-08-17', 3, 7);
INSERT INTO pedidos VALUES(12, 3045.6, '2022-04-25', 2, 1);
INSERT INTO pedidos VALUES(13, 545.75, '2022-01-25', 6, 1);
INSERT INTO pedidos VALUES(14, 145.82, '2022-02-02', 6, 1);
INSERT INTO pedidos VALUES(15, 370.85, '2021-03-11', 1, 5);
INSERT INTO pedidos VALUES(16, 2389.23, '2021-03-11', 1, 5);
INSERT INTO pedidos VALUES(17, 275.93, '2021-08-17', 2, 5);
INSERT INTO pedidos VALUES(18, 328.34, '2021-08-17', 1, 3);
INSERT INTO pedidos VALUES(19, 1838.66, '2020-03-19', 3, 4);
INSERT INTO pedidos VALUES(20, 2598.23, '2020-05-21', 5, 1);

SELECT * FROM clientes;
SELECT * FROM pedidos;
SELECT * FROM vendedores;

/* 1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar
ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes. */ 
SELECT * from ventas.pedidos ORDER BY fecha DESC;

/* 2. Devuelve todos los datos de los dos pedidos de mayor valor. */
SELECT * from ventas.pedidos ORDER BY cantidad DESC LIMIT 2;

/* 3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido.
Tenga en cuenta que no debe mostrar identificadores que estén repetidos. */ 
SELECT id_cliente FROM ventas.pedidos as p JOIN ventas.clientes as c on c.id = p.id_cliente 
GROUP BY c.id;

/* 4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2022, cuya
cantidad total sea superior a $500. */ 
SELECT * FROM ventas.pedidos WHERE fecha LIKE "2022%" AND cantidad > 500 ;

/* 5. Devuelve un listado con el nombre y apellido de los vendedores que tienen una comisión
entre 0.05 y 0.11.*/
SELECT nombre, apellido FROM ventas.vendedores WHERE ventas.vendedores.comisión >= 0.05 and ventas.vendedores.comisión <= 0.11;

/* 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla vendedores. */
SELECT comisión FROM ventas.vendedores ORDER BY comisión DESC LIMIT 1; 

/* 7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo cuitcuil no es
NULL. El listado deberá estar ordenado alfabéticamente por apellido y nombre. */ 
SELECT v.id, v.apellido, v.nombre  FROM ventas.clientes as v WHERE v.cuitcuil is not null order by apellido, nombre ASC;

/* 8. Devuelve un listado de los nombres de los clientes que empiezan por “A” y terminan por “n” y
también los nombres que empiezan por “P”. El listado deberá estar ordenado
alfabéticamente. */
SELECT nombre, apellido FROM ventas.clientes WHERE nombre like "A%N"  or nombre like "P%"; 

/* 9. Devuelve un listado de los nombres de los clientes que no empiezan por “A”. El listado deberá
estar ordenado alfabéticamente. */
SELECT nombre, apellido FROM ventas.clientes WHERE nombre not like "A%" ORDER BY nombre, apellido ASC; 

/* 10.Devuelve un listado con los nombres de los vendedores que terminan por “el” o “o”. Tenga en
cuenta que se deberán eliminar los nombres repetidos. */ 
SELECT nombre FROM ventas.vendedores WHERE nombre like "%EL" or nombre like "%o" GROUP BY nombre; 

/* 11.Devuelve un listado con el identificador, nombre y apellido de todos los clientes que han
realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar
los elementos repetidos. */ 
SELECT id_cliente, nombre, apellido FROM ventas.pedidos as p JOIN ventas.clientes as c on c.id = p.id_cliente GROUP BY c.id ORDER BY nombre, apellido ASC;

/* 12.Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado
debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de
los clientes ordenados alfabéticamente. */ 
SELECT p.* , id_cliente, nombre, apellido FROM ventas.pedidos as p JOIN ventas.clientes as c on c.id = p.id_cliente GROUP BY c.id ORDER BY nombre, apellido ASC;

/* 13.Devuelve un listado que muestre todos los pedidos en los que ha participado un vendedor. El
resultado debe mostrar todos los datos de los pedidos y de los vendedores. El listado debe
mostrar los datos de los vendedores ordenados alfabéticamente. */ 
SELECT * FROM ventas.pedidos as p JOIN ventas.vendedores as v on p.id_vendedor = v.id ORDER BY v.apellido,v.nombre ASC;

/* 14.Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y
con los datos de los vendedores asociados a cada pedido. */ 
SELECT concat_ws(' ',c.nombre,c.apellido) AS Cliente, 
concat_ws(' ',v.nombre,v.apellido) AS Vendedor,
p.id as "id pedido", p.Cantidad,p.Fecha
FROM clientes AS c INNER JOIN vendedores AS v INNER JOIN pedidos AS p  
WHERE c.id = p.id_cliente and p.id_vendedor = v.id ORDER BY c.nombre ASC;

/* 15.Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2022, cuyo
monto esté entre $300 y $1000. */ 
SELECT * FROM ventas.clientes as c INNER JOIN ventas.pedidos as p WHERE c.id = p.id_cliente 
and p.fecha like "2022%" and p.cantidad between 300 and 1000;

/* 16.Devuelve el nombre y apellido de todos los vendedores que han participado en algún pedido
realizado por María Santana. */ 
SELECT v.nombre, v.apellido FROM ventas.vendedores as v 
INNER JOIN ventas.pedidos as p 
INNER JOIN ventas.clientes as c 
WHERE v.id = p.id_vendedor and (p.id_cliente= c.id) and c.nombre like "Maria" and c.apellido like "Santana"; 

/* 17.Devuelve el nombre de todos los clientes que han realizado algún pedido con el vendedor
Daniel Sáez. */ 
SELECT c.nombre, c.apellido 
FROM ventas.clientes AS c INNER JOIN ventas.vendedores as v INNER JOIN ventas.pedidos as p 
WHERE (c.id = p.id_cliente) and (p.id_vendedor = v.id) and (v.nombre like "Daniel" and v.apellido like "S%");

/* 18.Devuelve un listado con todos los clientes junto con los datos de los pedidos que han
realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido.
El listado debe estar ordenado alfabéticamente por el apellido y nombre de los clientes. */ 
SELECT c.*, p.id as "ID PEDIDO", p.cantidad as "Cantidad pedido", p.fecha FROM ventas.clientes as c 
INNER JOIN ventas.pedidos as p 
WHERE (c.id = p.id_cliente) or (c.id) group by c.id order by c.apellido, c.nombre ASC;

/* 19.Devuelve un listado con todos los vendedores junto con los datos de los pedidos que han
realizado. Este listado también debe incluir los vendedores que no han realizado ningún
pedido. El listado debe estar ordenado alfabéticamente por el apellido y nombre de los
vendedores. */ 
SELECT v.id as "Id vendedor", concat_ws(" ",v.nombre,v.apellido) as "Nombre Vendedor", v.cuitcuil, p.id as "Id pedido", p.cantidad, p.fecha FROM ventas.vendedores as v 
INNER JOIN ventas.pedidos as p 
WHERE (v.id = p.id_vendedor) ORDER BY v.apellido, v.nombre ASC;

/* 20.Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido. */
select c.Id as Id_Cliente, c.Nombre, c.Apellido from ventas.pedidos as p
right join ventas.clientes as c on c.id=p.id_cliente where p.id_cliente is null;

-- 21.Devuelve un listado que solamente muestre los vendedores que no han realizado ningún pedido.
select v.Id as Id_Vendedor, v.Nombre, v.Apellido from ventas.pedidos as p
right join ventas.vendedores as v on v.id=p.id_vendedor where p.id_vendedor is null;

-- 22.Devuelve un listado con los clientes que no han realizado ningún pedido y de los vendedores que no han participado en ningún pedido.
-- Ordene el listado alfabéticamente por el apellido y el nombre.
-- En el listado deberá diferenciar de algún modo los clientes y los vendedores.
select c.Id as Id_Cliente, ' ' as Id_Vendedor, c.Nombre, c.Apellido from ventas.pedidos as p
right join ventas.clientes as c on c.id=p.id_cliente where p.id_cliente is null
union
select ' ' as Id_Cliente, v.Id as Id_Vendedor, v.Nombre, v.Apellido from ventas.pedidos as p
right join ventas.vendedores as v on v.id=p.id_vendedor where p.id_vendedor is null;

-- 23.Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
select sum(cantidad) from ventas.pedidos;

-- 24.Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
select avg(cantidad) from ventas.pedidos;

-- 25.Calcula el número total de vendedores distintos que aparecen en la tabla pedido.
select count(distinct id_vendedor) as Vendedores from ventas.pedidos;

-- 26.Calcula el número total de clientes que aparecen en la tabla cliente.
select count(id) Clientes from ventas.clientes;

-- 27.Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
select max(cantidad) Max_Valor from ventas.pedidos;

-- 28.Calcula cuál es la menor cantidad que aparece en la tabla pedido
select min(cantidad) Max_Valor from ventas.pedidos;

-- 29.Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
select distinct Ciudad, max(Categoría) from ventas.clientes group by ciudad order by ciudad;

-- 30.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes.
-- Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día.
-- Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido.
-- Muestra el identificador del cliente, nombre, apellido, la fecha y el valor de la cantidad.
select c.Id, concat_ws(' ', c.Nombre, c.Apellido) as Nombre, p.Fecha, max(p.Cantidad) Mayor_Valor from ventas.clientes as c
join ventas.pedidos as p on c.id=p.id_cliente group by id_cliente, p.fecha;

-- 31.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo
-- en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de $2000 .
select c.Id, concat_ws(' ', c.Nombre, c.Apellido) Nombre, p.Fecha, max(p.Cantidad) Mayor_valor from ventas.clientes as c
join ventas.pedidos as p on c.id=p.id_cliente where p.cantidad >2000 group by id_cliente, p.fecha;

-- 32.Calcula el máximo valor de los pedidos realizados para cada uno de los vendedores durante la fecha 2021-08-17.
-- Muestra el identificador del vendedor, nombre, apellido y total.
select v.Id, concat_ws(' ', v.Nombre, v.Apellido) Nombre_Vendedor, p.Fecha, max(p.Cantidad) Mayor_valor from ventas.vendedores as v
join ventas.pedidos as p on v.id=p.id_vendedor where p.fecha like '2021-08-17' group by id_vendedor;

-- 33.Devuelve un listado con el identificador de cliente, nombre y apellido y el número total de pedidos que ha realizado cada
-- uno de los clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también
-- deben aparecer en el listado indicando que el número de pedidos realizados es 0.
select c.Id, concat_ws(' ', c.Nombre, c.Apellido) Nombre_Cliente, count(p.id) Cantidad_Pedidos  from ventas.clientes c
left join ventas.pedidos p on c.id=p.id_cliente group by c.id order by Cantidad_Pedidos;

-- 34.Devuelve un listado con el identificador de cliente, nombre, apellido y el número total de pedidos que ha realizado
-- cada uno de los clientes durante el año 2020.
select c.Id, concat_ws(' ', c.Nombre, c.Apellido) Nombre_Cliente, count(p.id) Cantidad_Pedidos  from ventas.clientes c
left join ventas.pedidos p on c.id=p.id_cliente where p.fecha like '2020%' group by c.id;

-- 35.Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
select distinct year(p.fecha) Año, max(cantidad) Mayor_Valor from ventas.pedidos p group by año order by cantidad;

-- 36.Devuelve el número total de pedidos que se han realizado cada año.
select distinct year(p.fecha) Año, count(id) Pedidos from ventas.pedidos p group by año order by cantidad;

-- 37.Devuelve un listado con todos los pedidos que ha realizado Adela Salas. (Sin utilizar INNER JOIN).
select concat_ws(' ', c.Nombre, c.Apellido) Nombre, p.Fecha, p.Id Pedido, p.Cantidad from ventas.clientes c
left join ventas.pedidos p on c.id=p.id_cliente where nombre like 'adela';

-- 38.Devuelve el número de pedidos en los que ha participado el vendedor Daniel Sáe. (Sin utilizar INNER JOIN)
select count(p.id) Pedidos, concat_ws(' ', v.Nombre, v.Apellido) Nombre from ventas.pedidos p
left join ventas.vendedores v on v.id=p.id_vendedor where nombre like 'Daniel';

-- 39.Devuelve los datos del cliente que realizó el pedido más caro en el año 2020. (Sin utilizar INNER JOIN)
select c.Id, concat_ws(' ', c.apellido, c.nombre) Cliente, max(p.cantidad) Monto from ventas.clientes as c
right join ventas.pedidos p on c.id=p.id_cliente where p.fecha like '2020%';

-- 40.Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz.
select c.Id, concat_ws(' ', c.apellido, c.nombre) Cliente, min(p.cantidad) Monto from ventas.clientes as c
right join ventas.pedidos p on c.id=p.id_cliente where nombre like 'pepe';

-- 41.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
select * from ventas.clientes c where id not in (select id_cliente from ventas.pedidos);

-- 42.Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando IN o NOT IN).
select * from ventas.vendedores v where id not in (select id_vendedor from ventas.pedidos);

-- 43.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
select * from ventas.clientes c where not exists (select id_cliente from ventas.pedidos p where p.id_cliente=c.id);

-- 44.Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
select * from ventas.vendedores v where not exists (select id_vendedor from ventas.pedidos p where p.id_vendedor=v.id);


























