/*Exercice 01*/

SELECT * FROM customers WHERE country = 'France';

/*Exercice 02*/

SELECT products.ProductName, products.UnitPrice
FROM suppliers
JOIN products
ON suppliers.SupplierID = products.SupplierID
WHERE suppliers.CompanyName = 'Exotic Liquids';

/*Exercice 03*/

SELECT suppliers.CompanyName, COUNT(products.ProductName) AS NmbrProduct
FROM suppliers
JOIN products
ON suppliers.SupplierID = products.SupplierID
WHERE suppliers.Country = 'France'
GROUP BY suppliers.CompanyName
ORDER BY NmbrProduct DESC;

/*Exercice 04*/

SELECT customers.CompanyName, COUNT(orders.CustomerID) AS NmbrCommande
FROM orders
JOIN customers
ON customers.CustomerID = orders.CustomerID
WHERE customers.Country = 'France' 
GROUP BY customers.CompanyName
HAVING NmbrCommande > 10;

/*Exercice 05*/

SELECT customers.CompanyName, SUM(order_details.UnitPrice * order_details.Quantity) AS CA, customers.Country
FROM orders
JOIN customers ON customers.CustomerID = orders.CustomerID
JOIN order_details ON order_details.OrderID = orders.OrderID
GROUP BY customers.CompanyName
HAVING CA > 30000
ORDER BY CA DESC;

/*Exercice 06*/

SELECT orders.ShipCountry
FROM orders
JOIN order_details ON order_details.OrderID = orders.OrderID
JOIN products ON products.ProductID = order_details.ProductID
JOIN suppliers ON suppliers.SupplierID = products.SupplierID
WHERE suppliers.CompanyName = 'Exotic Liquids'
GROUP BY orders.ShipCountry;

/*Exercice 07*/

SELECT SUM(order_details.UnitPrice * order_details.Quantity) AS MontantVente97
FROM orders
JOIN order_details ON order_details.OrderID = orders.OrderID
WHERE YEAR(orders.OrderDate) = '1997';

/*Exercice 08*/

SELECT MONTH(orders.OrderDate) AS Mois97, SUM(order_details.UnitPrice * order_details.Quantity) AS MontantVente
FROM orders
JOIN order_details ON order_details.OrderID = orders.OrderID
WHERE YEAR(orders.OrderDate) = '1997'
GROUP BY Mois97;

/*Exercice 09*/

SELECT MAX(orders.OrderDate) AS DerniereCommande
FROM orders
JOIN customers
ON customers.CustomerID = orders.CustomerID
WHERE customers.CompanyName = 'Du monde entier';

/*Exercice 10*/

SELECT ROUND(AVG(DATEDIFF( orders.ShippedDate, orders.OrderDate))) AS TempsMoyCommande
FROM orders;