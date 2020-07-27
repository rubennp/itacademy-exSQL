# Exercicis SQL dels Exercicis d’accés a la capacitació Developer Program IT Academy

# BD dels exercicis
DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

## EXERCICIS 1.1.3:
# 1. noms dels productes de la taula 'producto'
SELECT nombre FROM producto;
# 2. nom i preus dels productes de la taula 'producto'
SELECT nombre, precio FROM producto;
# 3. totes les columnes de la taula 'producto'
SELECT * FROM producto;
# 4. nom, preu en euros i preu en dòlars
SELECT nombre, CONCAT(precio, '€'), CONCAT(precio, '$') FROM producto;
# 5.  nom del producte i el preu en euros i en dólars (utilitzant àlies de columna 'nombre de producto', 'euros', 'dólares'
SELECT nombre AS "nombre de producto", CONCAT(precio, '€') AS euros, CONCAT(precio, '$') AS dólares FROM producto;
# 6.  noms i  preus de 'producto' convertint nom a MAJÚSCULES
SELECT UPPER(nombre), precio FROM producto;
# 7.  noms i preus de 'producto' convertint el nom a minúscules
SELECT LOWER(nombre), precio FROM producto;
# 8. noms fabricants en una columna i en una altra els dos primers caràcters del nom en majúscules
SELECT nombre AS fabricante, UPPER(SUBSTRING(nombre, 1, 2)) AS código FROM fabricante;
# 9. nom i  preu (arrodonit) de 'producto'
SELECT nombre, ROUND(precio) FROM producto;
# 10.  nom i  preus (sense decimals) de 'producto'
SELECT nombre, FLOOR(precio) FROM producto;
# 11. codi fabricants que tenen productes a 'producto'
SELECT codigo_fabricante FROM producto;
# 12. codi fabricants eliminant duplicats
SELECT DISTINCT codigo_fabricante FROM producto;
# 13. nom fabricants ordenats ASC
SELECT nombre FROM fabricante ORDER BY nombre ASC;
# 14. idem desc
SELECT nombre FROM fabricante ORDER BY nombre DESC;
# 15. nombre de productos por nombre asc i después por precio desc
SELECT nombre FROM producto ORDER BY nombre ASC;
SELECT nombre FROM producto ORDER  BY precio DESC;
# 16. 5 primeras filas de 'fabricante'
SELECT * FROM fabricante LIMIT 5;
# 17. 4a i 5a fila de 'fabricante'
SELECT * FROM fabricante LIMIT 2 OFFSET 3;
# 18. nombre y precio producto más barato (utilizando ORDER BY y LIMIT)
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
# 19. idem del más caro
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
# 20. nombre de productos de fabricante = 2
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
# 21. nombre productos precio <= 120€
SELECT nombre FROM producto WHERE precio <= 120;
# 22. idem precio >= 400€
SELECT nombre FROM producto WHERE precio >= 400;
# 23. idem precio NOT >= 400€
SELECT nombre FROM producto WHERE NOT precio >= 400;
# 24. productos que tengan precio entre 80€ y 300€ (no utilizar BETWEEN)
SELECT * FROM producto WHERE precio >= 80 AND precio <= 300;
# 25. preoductos entre 60 y 200 euros (con BETWEEN)
SELECT * FROM producto WHERE precio BETWEEN 60 AND 200;
# 26. productos precio > 200 i codigo fabricante = 6
SELECT * FROM producto WHERE precio > 200 AND codigo_fabricante = 6;
# 27. productos de fabricantes 1, 3 o 5 sin IN
SELECT * FROM producto WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;
# 28. idem utilizando IN
SELECT * FROM producto WHERE codigo_fabricante IN (1, 3, 5);
# 29 nombre y precio en céntimos con alias 'céntimos'
SELECT nombre, precio*100 AS céntimos FROM producto;
# 30. nombre de fabricantes que empiezan por S
SELECT nombre FROM fabricante WHERE SUBSTRING(nombre, 1, 1) = 'S';
# 31. nombre fabricantes acaben en 'e'
SELECT nombre FROM fabricante WHERE SUBSTRING(REVERSE(nombre), 1, 1) = 'e';
# 32. nombre fabricantes contengan 'w'
SELECT nombre FROM fabricante WHERE INSTR(fabricante.nombre, 'w') > 0;
# 33. nombre fabricantes de 4 carácteres
SELECT nombre FROM fabricante WHERE LENGTH(nombre) = 4;
# 34. nombre productos con palabra 'Poratátil'
SELECT nombre FROM producto WHERE INSTR(producto.nombre, 'Portátil') > 0;
# 35. nombre productos con palabra 'Monitor' de menos de 215€
SELECT nombre FROM producto WHERE INSTR(producto.nombre, 'Monitor') > 0 AND precio < 215;
# 36. nombre y precio productos precio <= 180€. Ordenar por precio DESC y luego nombre ASC
SELECT nombre, precio FROM producto WHERE precio <= 180 ORDER BY precio DESC, nombre ASC;

## EXERCICIS 1.1.4:
# 1. nombre y precio producto y nombre fabricante
SELECT producto.nombre Producto, producto.precio, fabricante.nombre AS Fabricante 
FROM producto, fabricante 
WHERE producto.codigo_fabricante = fabricante.codigo;
# 2. idem ordenado por fabricante alfabético
SELECT producto.nombre Producto, producto.precio, fabricante.nombre AS Fabricante 
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
ORDER BY fabricante.nombre ASC;
# 3. código y nombre producto y código y nombre fabricante
SELECT producto.codigo, producto.nombre AS Producto, fabricante.codigo, fabricante.nombre AS Fabricante
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo;
# 4. nombre y precio producto y nombre fabricante del producto más barato
SELECT producto.nombre AS Producto, producto.precio, fabricante.nombre AS Fabricante
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio ASC
LIMIT 1;
# 5. idem del más caro
SELECT producto.nombre AS Producto, producto.precio, fabricante.nombre AS Fabricante
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio DESC
LIMIT 1;
# 6. todos los productos del fabricante 'Lenovo'
SELECT producto.nombre AS Producto, producto.precio, fabricante.nombre AS Fabricante
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = 'Lenovo';
# 7. todos los productos del fabricante 'Crucial' con precio superior a 200€
SELECT producto.nombre AS Producto, producto.precio, fabricante.nombre AS Fabricante
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = 'Crucial' AND producto.precio > 200;
# 8. todos los productos de 'Asus', 'Hewlett-Packard' y Seagate (sin IN)
SELECT producto.nombre AS Producto, producto.precio, fabricante.nombre AS Fabricante
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo AND (fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate');
# 9. idem con IN
SELECT producto.nombre AS Producto, producto.precio, fabricante.nombre AS Fabricante
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
# 10. nombre y precio productos fabricantes cuyo nombre termine con 'e'
SELECT producto.nombre AS Producto, producto.precio, fabricante.nombre AS Fabricante
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo AND SUBSTRING(REVERSE(fabricante.nombre), 1, 1) = 'e';
# 11. idem cuyo nombre fabricante contenga 'w'
SELECT producto.nombre AS Producto, producto.precio, fabricante.nombre AS Fabricante
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo AND INSTR(fabricante.nombre, 'w') > 0;
# 12. nombre y precio producto y nombre fabricante de todos productos precio >= 180€. Ordenar precio DESC y después nombre ASC
SELECT producto.nombre AS Producto, producto.precio, fabricante.nombre AS Fabricante
FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo AND producto.precio >= 180
ORDER BY producto.precio, fabricante.nombre;
# 13. código y nombre fabricante que tengas productos asociados
SELECT DISTINCT fabricante.codigo, fabricante.nombre
FROM fabricante, producto
WHERE fabricante.codigo = producto.codigo_fabricante;

## EXERCICIS 1.1.5
# 1. todos los fabricantes y sus productos, también aquellos que no tengan productos
SELECT fabricante.nombre, producto.nombre FROM fabricante
LEFT JOIN producto
ON fabricante.codigo = producto.codigo_fabricante;
# 2. listado de aquellos fabricantes que no tienen productos asociados
SELECT fabricante.nombre FROM fabricante
LEFT JOIN producto
ON producto.codigo_fabricante = fabricante.codigo
WHERE producto.codigo_fabricante IS NULL;
# 3. ¿Pueden existir productos que no estén relacionados con un fabricante?
## > No, per la relació que existeix entre les dues taules: la clau externa a producto.codigo_fabricante, impedeix que s'inserti aquí cap valor que no estigui ja a fabricante.codigo

## EXERCICIS 1.1.6
# 1. Total productos
SELECT COUNT(*) AS Productos FROM producto;
# 2. Total fabricantes
SELECT COUNT(*) AS Fabricantes FROM fabricante;
# 3. Total fabricantes distintos en producto
SELECT COUNT(DISTINCT codigo_fabricante) AS "Fabricantes con producto"
FROM producto;
# 4. Media precio todos productos
SELECT ROUND(AVG(precio)) FROM producto;
# 5. Precio más barato
SELECT MIN(precio) FROM producto;
# 6. Precio más caro
SELECT MAX(precio) FROM producto;
# 7. nombre y precio producto más barato
SELECT nombre, precio FROM producto
WHERE precio = (SELECT MIN(precio) FROM producto);
# 8. idem del más caro
SELECT nombre, precio FROM producto
WHERE precio = (SELECT MAX(precio) FROM producto);
# 9. Suma precios todos productos
SELECT SUM(precio) FROM producto;
# 10. número productos fabricante Asus
SELECT COUNT(producto.codigo_fabricante) AS "Productos Asus" FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = 'Asus';
# 11. Media precio productos Asus
SELECT ROUND(AVG(precio)) FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = 'Asus';
# 12. Precio más barato productos Asus
SELECT MIN(precio) FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = 'Asus';
# 13. idem del más caro
SELECT MAX(precio) FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = 'Asus';
# 14. suma idem
SELECT SUM(precio) FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = 'Asus';
# 15. precio max, min, medio y total productos de Crucial
SELECT MAX(precio) AS "Más caro", MIN(precio) AS "Más barato", AVG(precio) AS MEDIA, COUNT(*) AS "TOTAL PRODUCTOS" FROM producto, fabricante
WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = 'Crucial';
# 16. fabricante y número de productos
SELECT fabricante.nombre, COUNT(producto.codigo_fabricante) AS Productos
FROM fabricante
LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.nombre ORDER BY Productos DESC;
# 17. nombre fabricante, precio max i min i medio dels productes de cada un d'ells
SELECT fabricante.nombre AS Fabricante, MAX(producto.precio) AS "Más caro", MIN(producto.precio) AS "Más barato", AVG(precio) AS "Precio medio"
FROM fabricante
LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.nombre;
# 18. precio max, min y medio y total productos de los fabricante que tienen medio superior a 200€. No necesario nombre si código del fabricante
SELECT codigo_fabricante AS Fabricante, COUNT(codigo_fabricante) AS Productos, MAX(precio) AS "Más caro", MIN(precio) AS "Más barato", AVG(precio) AS "Precio medio"
FROM producto
GROUP BY Fabricante
HAVING AVG(precio) > 200;
# 19. idem pero con nombre fabricante
SELECT fabricante.nombre AS Fabricante, COUNT(*) AS Productos, MAX(producto.precio) AS "Más caro", MIN(producto.precio) AS "Más barato", AVG(precio) AS "Precio medio"
FROM fabricante
LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.nombre
HAVING AVG(precio) > 200;
# 20. número de productos con precio mayor o igual a 180€
SELECT COUNT(*) AS ">=180€"
FROM producto
WHERE precio >= 180;
# 21. productos de cada fabricante con precio >= 180€
SELECT fabricante.nombre AS Fabricante, COUNT(*) AS Productos
FROM fabricante
LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante
WHERE producto.precio >= 180
GROUP BY fabricante.nombre;
# 22. precio medio de cada fabricante, sólo con código_fabricante
SELECT AVG(precio), codigo_fabricante AS Fabricante
FROM producto
GROUP BY codigo_fabricante;
# 23 idem pero con nombre fabricante
SELECT fabricante.nombre, AVG(precio) AS "Precio medio"
FROM fabricante, producto
WHERE fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.nombre;
# 24. Nombre fabricantes cuyo precio medio de productos >= 150€
SELECT fabricante.nombre
FROM fabricante
LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.nombre
HAVING AVG(precio) >= 150;
# 25. fabricantes que tienen 2 o mas productos
SELECT fabricante.nombre
FROM fabricante
LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.nombre
HAVING COUNT(*) >= 2;
# 26. fabricantes y número productos que tiene cada uno con un precio >= 200€
SELECT fabricante.nombre AS Fabricante, COUNT(*) AS "Productos >= 200€"
FROM fabricante
LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante
WHERE producto.precio >= 200
GROUP BY fabricante.nombre;
# 27. todos los fabricantes y el número de productos que tenga cada uno >= 220€
SELECT fabricante.nombre, SUM(CASE WHEN producto.precio >= 220 THEN 1 ELSE 0 END) AS Productos
FROM fabricante
LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.nombre
ORDER BY Productos DESC;
# 28. Listado fabricantes suma sus precios > 1000
SELECT fabricante.nombre AS Fabricante, SUM(producto.precio) AS TOTAL FROM fabricante
LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante
GROUP BY fabricante.nombre  HAVING SUM(producto.precio) > 1000
ORDER BY TOTAL DESC;
# 29. nombre producto más caro de cada fabricante, precio y fabricante (asc)
## ERROR: no consigo incluir nombre del producto
SELECT MAX(A.p) AS Precio, fabricante.nombre AS Fabricante
FROM (
	SELECT producto.nombre AS n, producto.precio AS p, producto.codigo_fabricante AS f FROM producto
) AS A, fabricante WHERE A.f = fabricante.codigo
GROUP BY Fabricante ORDER BY Fabricante ASC;