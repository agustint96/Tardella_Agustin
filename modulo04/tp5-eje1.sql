DROP DATABASE IF EXISTS sistema;
CREATE DATABASE sistema CHARACTER SET utf8mb4;
USE sistema;
CREATE TABLE departamentos (
iddepartamento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
estado  boolean NOT NULL
);
CREATE TABLE empleados (
idemplaedo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cuil_cuit VARCHAR(15) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
id_departamento INT UNSIGNED,
estado BOOLEAN,
FOREIGN KEY (id_departamento) REFERENCES departamentos(iddepartamento)
);
INSERT INTO departamentos VALUES(1, 'Desarrollo', 120000, true);
INSERT INTO departamentos VALUES(2, 'Sistemas', 150000, true);
INSERT INTO departamentos VALUES(3, 'Recursos Humanos', 280000, true);
INSERT INTO departamentos VALUES(4, 'Contabilidad', 110000, true);
INSERT INTO departamentos VALUES(5, 'I+D', 375000, true);
INSERT INTO departamentos VALUES(6, 'Proyectos', 0,true );
INSERT INTO departamentos VALUES(7, 'Publicidad', 0, true);
INSERT INTO departamentos VALUES(8, 'Comercial', 0, false);
INSERT INTO empleados VALUES(1, '27-32481596-3', 'Aarón', 'Rivero', 1, true);
INSERT INTO empleados VALUES(2, '27-29557532-1', 'Adela', 'Salas', 2, true);
INSERT INTO empleados VALUES(3, '20-36970642-1', 'Adolfo', 'Rubio', 3, true);
INSERT INTO empleados VALUES(4, '20-41705545-1', 'Adrián', 'Suárez', 4, true);
INSERT INTO empleados VALUES(5, '20-17087203-3', 'Marcos', 'Loyola', 5, true);
INSERT INTO empleados VALUES(6, '27-38382980-3', 'María', 'Santana', 1, true);
INSERT INTO empleados VALUES(7, '23-80576669-1', 'Pilar', 'Ruiz', 2, true);
INSERT INTO empleados VALUES(8, '24-71651431-3', 'Pepe', 'Ruiz', 3, true);
INSERT INTO empleados VALUES(9, '25-36399183-3', 'Juan', 'Gómez', 2, true);
INSERT INTO empleados VALUES(10, '20-34638446-3', 'Diego','Flores', 5, true);
INSERT INTO empleados VALUES(11, '27-36738983-3', 'Marta','Herrera', 1, true);
INSERT INTO empleados VALUES(12, '27-44123836-1', 'Irene','Salas', NULL, false);
INSERT INTO empleados VALUES(13, '20-38265162-1', 'Juan Antonio', "Tardella",  NULL, true);

-- Consulta 1. Lista el apellido de todos los empleados.
SELECT apellido from sistema.empleados;

-- Consulta 2. Lista el apellido de los empleados eliminando los apellidos que estén repetidos.
SELECT DISTINCT(apellido) FROM sistema.empleados;

-- Consulta 3. Lista todas las columnas de la tabla empleados.
SELECT DISTINCT(apellido) FROM sistema.empleados;

-- Consulta 4. Lista el nombre y apellido de todos los empleados.
SELECT nombre, apellido FROM sistema.empleados; 

-- Consulta 5. Lista el cuit/cuil de los departamentos de los empleados que aparecen en la tabla empleados.
SELECT cuil_cuit FROM sistema.empleados;

-- Consulta 6. Lista el nombre y apellido de los empleados en una única columna.
SELECT concat_ws(", ", apellido, nombre) as Nombre_empleado FROM sistema.empleados;

-- Consulta 7. Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
SELECT UPPER(concat_ws(", ", apellido, nombre)) as Nombre_empleado FROM sistema.empleados;

-- Consulta 8. Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
SELECT LOWER(concat_ws(", ", apellido, nombre)) as Nombre_empleado FROM sistema.empleados;

-- Consulta 9. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
SELECT nombre, presupuesto from sistema.departamentos order by presupuesto asc;

-- Consulta 10. Lista el nombre de todos los departamentos ordenados de forma ascendente. 
SELECT nombre  from sistema.departamentos order by nombre asc;

-- Consulta 11. Lista el nombre de todos los departamentos ordenados de forma descendente.
SELECT nombre  from sistema.departamentos order by nombre desc;

-- Consulta 12. Lista el apellido y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar su apellido y luego su nombre.
SELECT  apellido, nombre  from sistema.empleados order by apellido, nombre asc;

-- Consulta 13. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
SELECT nombre, presupuesto FROM sistema.departamentos ORDER BY presupuesto DESC LIMIT 3;

-- Consulta 14. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
SELECT nombre, presupuesto FROM sistema.departamentos ORDER BY presupuesto ASC LIMIT 3;

-- Consulta 15. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a $150000.
SELECT nombre, presupuesto FROM sistema.departamentos WHERE (presupuesto >= 150000) ;

-- Consulta 16. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
SELECT nombre, presupuesto FROM sistema.departamentos WHERE ( 100000 <= presupuesto && presupuesto <= 200000 ) ;

-- Consulta 17. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
SELECT nombre from sistema.departamentos WHERE (presupuesto < 100000 || presupuesto > 200000);

-- Consulta 18. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN.
select nombre from sistema.departamentos WHERE (presupuesto between 100000 and 200000 );

-- Consulta 19. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN.
select nombre, presupuesto from sistema.departamentos WHERE (presupuesto not between 100000 and 200000 );

-- Consulta 20. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. 
select * from empleados as e  
inner join departamentos as d 
on d.iddepartamento = e.id_departamento;

-- Consulta 21. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético) y en segundo lugar por apellido y el nombre de los empleados. 
select * from empleados as e  
inner join departamentos as d 
on d.iddepartamento = e.id_departamento order by d.nombre ASC , e.apellido ASC,  e.nombre ASC ;

-- Consulta 22 Devuelve un listado con el código y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
select d.nombre, d.iddepartamento from sistema.departamentos as d 
join sistema.empleados as e on d.iddepartamento = e.id_departamento 
group by d.nombre ;

-- Consulta 23. Devuelve el nombre del departamento donde trabaja el empleado que tiene el cuit 27-38382980-3. 
select d.nombre from sistema.departamentos as d 
join sistema.empleados as e on d.iddepartamento = e.id_departamento 
where e.cuil_cuit like '27-38382980-3';

-- Consulta 24. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz. 
select d.nombre from sistema.departamentos as d 
join sistema.empleados as e on d.iddepartamento = e.id_departamento
where e.nombre like "Pepe%" and e.apellido like "Ruiz%";

-- Consulta 25. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
select e.* from sistema.departamentos as d 
join sistema.empleados as e on d.iddepartamento = e.id_departamento
where d.nombre like "I+D%" order by e.nombre asc;

-- Consulta 26. Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.
select e.* from sistema.departamentos as d 
join sistema.empleados as e on d.iddepartamento = e.id_departamento
where d.nombre like "Sist%" or d.nombre like "Contabilida%" or d.nombre like "I+%" order by e.nombre asc;

-- 27. Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre $100000 y $200000. 
select e.nombre from sistema.departamentos as d 
join sistema.empleados as e on d.iddepartamento = e.id_departamento
WHERE (d.presupuesto not between 100000 and 200000 );








