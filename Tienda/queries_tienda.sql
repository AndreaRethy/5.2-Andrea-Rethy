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

/* 27. Returns a list of all products from manufacturer Crucial that have a price greater than €200. */
SELECT
producto.*
FROM producto
INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE fabricante.nombre = 'Crucial'
ORDER BY producto.precio DESC LIMIT 1;


/* 
Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Sense utilitzar l'operador IN.
Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Fent servir l'operador IN.
Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense usar INNER JOIN).
Llista el nom del producte més car del fabricant Lenovo.
Llista el nom del producte més barat del fabricant Hewlett-Packard.
Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
41. Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
 */