USE tienda;

/* 1. List the name of all the products in the product table. */
SELECT nombre FROM producto;

/* 2. List the names and prices of all the products in the product table. */
SELECT nombre, precio FROM producto;

/* 3. List all columns of the product table. */
SELECT * FROM producto;

/* 4. List the name of the products, the price in euros and the price in US dollars (USD). Change: 1 EUR = 1.08 USD */
SELECT 
nombre, 
precio as precio_EUR,
precio * 1.08 as precio_USD 
FROM producto;

/* 5. List the name of the products, the price in euros and the price in US dollars (USD). Use the following aliases for the columns: product name, euros, dollars. */
SELECT 
nombre as `product name`, 
precio as euros,
precio * 1.08 as dollars 
FROM producto;

/* 6. List the names and prices of all products in the product table, converting the names to uppercase. */
SELECT 
UPPER(nombre) as nombre, 
precio
FROM producto;

/* 7. List the names and prices of all products in the product table, converting the names to lowercase. */
SELECT 
LOWER(nombre) as nombre, 
precio
FROM producto;

/* 8. List the name of all manufacturers in one column, and in another column capitalize the first two characters of the manufacturer's name. */
SELECT
nombre,
UPPER(SUBSTR(nombre, 1, 2)) as short_name
FROM fabricante;

/* 9. List the names and prices of all products in the product table, rounding the price value. */
SELECT 
nombre, 
ROUND(precio, 0)
FROM producto;

/* 10. Lists the names and prices of all products in the product table, truncating the price value to display it without any decimal places. */
SELECT 
nombre, 
TRUNCATE(precio, 0)
FROM producto;

/* 11. List the code of the manufacturers that have products in the product table. */
SELECT 
fabricante.codigo
FROM producto
INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;

/* 12. List the code of the manufacturers that have products in the product table, eliminating the codes that appear repeatedly. */
SELECT 
DISTINCT(fabricante.codigo)
FROM producto
INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;

/* 13. List manufacturer names in ascending order. */
SELECT
nombre
FROM fabricante
ORDER BY nombre ASC;

/* 14. List manufacturer names in descending order. */
SELECT
nombre
FROM fabricante
ORDER BY nombre DESC;

/* 15. Lists product names sorted first by name in ascending order and second by price in descending order. */
SELECT
nombre, precio
FROM producto
ORDER BY nombre ASC, precio DESC;

/* 16. Return a list with the first 5 rows of the manufacturer table. */
SELECT
codigo, nombre
FROM fabricante
ORDER BY codigo LIMIT 5;

/* 17. Return a list with 2 rows starting from the fourth row of the manufacturer table. The fourth row must also be included in the answer. */
SELECT
codigo, nombre
FROM fabricante
WHERE codigo BETWEEN 4 AND 5;

/* 18. List the cheapest product name and price. (Use only the ORDER BY and LIMIT clauses). NOTE: do not use MIN(price) here, it would need GROUP BY. */
SELECT
nombre, precio
FROM producto
ORDER BY precio ASC LIMIT 1;

/* 19. List the most expensive product name and price. (Use only the ORDER BY and LIMIT clauses). NOTE: do not use MAX(price) here, it would need GROUP BY. */
SELECT
nombre, precio
FROM producto
ORDER BY precio DESC LIMIT 1;

/* 20. List the name of all products from the manufacturer whose manufacturer code is equal to 2. */
SELECT
nombre
FROM producto
WHERE codigo_fabricante = 2;

/* 21. Return a list with the product name, price, and manufacturer name of all products in the database. */
SELECT
producto.nombre, producto.precio, fabricante.nombre as fabricante
FROM producto
INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;

/* 22. Return a list with the product name, price, and manufacturer name of all products in the database. Sort the result by manufacturer name, in alphabetical order. */
SELECT
producto.nombre, producto.precio, fabricante.nombre as fabricante
FROM producto
INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
ORDER BY fabricante.nombre;

/* 23. Return a list with the product code, product name, manufacturer code, and manufacturer name of all products in the database. */
SELECT
producto.codigo as product_code,
producto.nombre as product_name,
fabricante.codigo as manufacturer_code,
fabricante.nombre as manufacturer_name
FROM producto
INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;

/* 24. Return the name of the product, its price and the name of its manufacturer, of the cheapest product. */
SELECT
producto.nombre, producto.precio, fabricante.nombre as fabricante
FROM producto
INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
ORDER BY precio ASC LIMIT 1;

/* 25. Return the name of the product, its price and the name of its manufacturer, of the most expensive product. */
SELECT
producto.nombre, producto.precio, fabricante.nombre as fabricante
FROM producto
INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
ORDER BY precio DESC LIMIT 1;

/* 26. Return a list of all products from manufacturer Lenovo. */
SELECT
producto.*
FROM producto
INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE fabricante.nombre = 'Lenovo';

/* 27. Return a list of all products from manufacturer Crucial that have a price greater than €200. */
SELECT
producto.*
FROM producto
INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200;

/* 28. Return a list with all the products of the manufacturers Asus, Hewlett-Packard and Seagate. Without using the IN operator. */
SELECT
producto.*
FROM producto
INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';

/* 29. Return a list with all the products of the manufacturers Asus, Hewlett-Packard and Seagate. Using the IN operator. */
SELECT
producto.*
FROM producto
INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

/* 30. Return a list with the name and price of all products from manufacturers whose name ends with the vowel e. */
SELECT
producto.nombre, producto.precio
FROM producto
INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE SUBSTR(fabricante.nombre, LENGTH(fabricante.nombre), 1) = 'e';

/* 31. Return a list with the name and price of all products whose manufacturer name contains the character w in their name. */
SELECT
producto.nombre, producto.precio
FROM producto
INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE LOCATE('w', fabricante.nombre) != 0;

/* 32. Return a list with the product name, price and manufacturer name, of all products that have a price greater than or equal to €180. Sort the result first by price (in descending order) and second by name (in ascending order). */
SELECT
producto.nombre, producto.precio, fabricante.nombre
FROM producto
INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE producto.precio >= 180
ORDER BY producto.precio DESC, producto.nombre ASC;

/* 33. Return a list with the manufacturer's code and name, only of those manufacturers that have associated products in the database. */
SELECT 
DISTINCT(fabricante.codigo), fabricante.nombre
FROM producto
INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;

/* 34. Return a list of all the manufacturers that exist in the database, along with the products that each of them has. The list must also show those manufacturers that do not have associated products. */
SELECT 
fabricante.*, producto.*
FROM fabricante
LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

/* 35. Returns a list showing only those manufacturers that do not have any associated products. */
SELECT 
fabricante.*, producto.*
FROM fabricante
LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante
WHERE producto.nombre IS NULL;

/* 36. Returns all products from the manufacturer Lenovo. (Without using INNER JOIN). */
SELECT
*
FROM producto
WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');

/* Returns all data for products that have the same price as the most expensive product from the manufacturer Lenovo. (Without using INNER JOIN). */
/*
SELECT
*
FROM producto
WHERE precio = codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');
*/

/* 
Llista el nom del producte més car del fabricant Lenovo.
Llista el nom del producte més barat del fabricant Hewlett-Packard.
Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
41. Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
 */