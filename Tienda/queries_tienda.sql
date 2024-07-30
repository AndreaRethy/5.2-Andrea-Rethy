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


/* 
Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.
Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
Llista el codi dels fabricants que tenen productes en la taula producto.
Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.
Llista els noms dels fabricants ordenats de manera ascendent.
Llista els noms dels fabricants ordenats de manera descendent.
Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
Retorna una llista amb les 5 primeres files de la taula fabricante.
Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.
Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
Retorna una llista de tots els productes del fabricant Lenovo.
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