a. Las distintas categorías de ls que se disponene productos.
SELECT * FROM OE2.CATEGORIES_TAB;

b. Los diferentes idiomas en los que se tienen datos informativos de los productos.
SELECT DISTINCT LANGUAGE_ID FROM OE2.PRODUCT_DESCRIPTIONS;

c. El artículo más caro y el más barato en los disponibles.
SELECT * FROM OE2.PRODUCT_INFORMATION;
SELECT PRODUCT_NAME,LIST_PRICE FROM OE2.PRODUCT_INFORMATION WHERE LIST_PRICE = (SELECT MAX(LIST_PRICE) FROM OE2.PRODUCT_INFORMATION);
SELECT PRODUCT_NAME,LIST_PRICE FROM OE2.PRODUCT_INFORMATION WHERE LIST_PRICE = (SELECT MIN(LIST_PRICE) FROM OE2.PRODUCT_INFORMATION);

d. Los artículos que tienen hasta una semana de garantía.
SELECT * FROM OE2.PRODUCT_INFORMATION;
SELECT PRODUCT_NAME,WARRANTY_PERIOD,LIST_PRICE FROM OE2.PRODUCT_INFORMATION WHERE WARRANTY_PERIOD >= 7;

e. Que liste todas las órdenes de algún cliente inroducidos como argumento.
SELECT * FROM OE2.ORDERS;
SELECT * FROM OE2.CUSTOMERS;
SELECT * FROM OE2.ORDERS WHERE CUSTOMER_ID = 101;

f. Que muestre las órdenes que están por ser procesadas en esta semana.
SELECT * FROM OE2.ORDERS WHERE ORDER_STATUS < 7;

g. Que iste las órdenes cuyos costos oscilan entre los 3500 y 9000.
SELECT * FROM OE2.ORDERS WHERE ORDER_TOTAL >= 3500 AND ORDER_TOTAL <= 9000;

h. Que muestre los datos de los productos que se encuentran en almacenes de la ciudad de México.
SELECT * FROM OE2.PRODUCT_INFORMATION;
SELECT * FROM OE2.INVENTORIES;
SELECT * FROM OE2.WAREHOUSES;

SELECT PRODUCT_ID,PRODUCT_NAME,LIST_PRICE FROM OE2.PRODUCT_INFORMATION 
WHERE PRODUCT_ID IN (SELECT DISTINCT PRODUCT_ID FROM OE2.INVENTORIES 
WHERE WAREHOUSE_ID = (SELECT WAREHOUSE_ID FROM OE2.WAREHOUSES WHERE WAREHOUSE_NAME = 'Mexico City'));

i. Que se muestren los alamcenes en donde se tiene inventarios de tarjetas de video.


j. Que liste los países de Europa.
SELECT * FROM OE2.COUNTRIES;
SELECT * FROM OE2.REGIONS;

SELECT * FROM OE2.COUNTRIES WHERE REGION_ID = (SELECT REGION_ID FROM OE2.REGIONS WHERE  REGION_NAME = 'Europe');


k. Que muestre todos los datos disponibles de un cliente dado por el usuario (a partir del nombre).
SELECT * FROM OE2.CUSTOMERS;
SELECT * FROM OE2.CUSTOMERS WHERE CUSTOMER_ID = (SELECT CUSTOMER_ID FROM OE2.CUSTOMERS WHERE CUST_FIRST_NAME = 'Sean' AND CUST_LAST_NAME = 'Olin');

l. Muestre las promiciones que más se aplican en las ventas.
SELECT * FROM OE2.PROMOTIONS;
SELECT * FROM OE2.PROMOTIONS WHERE PROMO_ID = (SELECT PROMO_ID,COUNT(PROMO_ID) MAXI FROM OE2.ORDERS GROUP BY PROMO_ID HAVING );

m. Muestre los datos de los productos que más se venden.
SELECT * FROM ORDER_ITEMS;
SELECT P.*, FORM OE2.PRODUCT_INFORMATION P WHERE ID;

n. Muestre los datos de los productos que menos se venden en América.


o. Muestre la cantidad de dinero recopilada por las ventas realizadas en cada País.
SELECT * FROM 

p. Muestre la cantidad de dinero recopilada por las ventas realizadas en cada Region siempre y cuando excedan de 10000.
SELECT * FROM REGIONS;
SELECT R.* FROM REGIONS R 

q. Indique los productos que ya están por desabastecerse en los almacenes localizados en un país (nombre) indicado por el usuario. Entendiendo por desabasto aquellos productos con cantidades menores a 100 en almacén.
SELECT * FROM OE2.INVENTORIES;
SELECT * FROM OE2.COUNTRIES;

SELECT * FROM OE2.PRODUCT_INFORMATION WHERE PRODUCT_ID 
IN (SELECT PRODUCT_ID FROM OE2.INVENTORIES WHERE WAREHOUSE_ID 
IN (SELECT WAREHOUSE_ID FROM OE2.WAREHOUSES WHERE LOCATION_ID 
IN (SELECT LOCATION_ID FROM OE2.LOCATIONS WHERE COUNTRY_ID = 'MX')) AND QUANTITY_ON_HAND <= 100);

r. Indique la categoría del producto que menos se vende.


s. Liste los números de teléfonos que han sido usados en compras durante 2007.
SELECT * FROM ORDERS;
SELECT * FROM OE2.PHONE_NUMBERS WHERE CUSTOMER_ID IN (SELECT CUSTOMER_ID FROM CUSTOMERS 
WHERE CUSTOMER_ID IN (SELECT CUSTOMER_ID FROM OE2.ORDERS 
WHERE TO_CHAR(ORDER_DATE,'YEAR')= '2007'));

t. Indique qué promociones no han sido nunca aplicadas en alguna venta.
SELECT * FROM OE2.ORDERS;
SELECT * FROM OE2.PROMOTIONS;
SELECT * FROM OE2.PROMOTIONS WHERE PROMO_ID = (SELECT DISTINCT PROMO_ID FROM OE2.ORDERS);

u. Indicar qué países nunca han tenido ventas.
SELECT * FROM OE2.COUNTRIES WHERE COUNTRY_ID NOT IN (SELECT COUNTRY_ID );
