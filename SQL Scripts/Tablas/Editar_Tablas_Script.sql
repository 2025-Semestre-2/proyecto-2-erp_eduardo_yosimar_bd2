-- En esta archivo se encuntra el script para editar algunas tablas de la base de datos WWI original. 


-- =================== Order, aqui vamos a agregar una columna Sucursal, para diferenciar los pedidos. ===================
SELECT COUNT(*)/2 FROM Sales.Orders;

ALTER TABLE Sales.Orders
ADD Sucursal NVARCHAR(50) NULL;

UPDATE Sales.Orders
SET Sucursal = 'Limon'
WHERE OrderID IN (
    SELECT TOP (36797) OrderID
    FROM Sales.Orders
    ORDER BY OrderID ASC
);

UPDATE Sales.Orders
SET Sucursal = 'San Jose'
WHERE Sucursal IS NULL;


SELECT * FROM Sales.Orders where Sucursal = 'San Jose' ;