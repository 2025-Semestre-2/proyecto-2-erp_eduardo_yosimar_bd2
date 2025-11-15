-- En esta archivo se encuntra el script para editar algunas tablas de la base de datos WWI original. 


-- =================== Order, aqui vamos a agregar una columna Sucursal, para diferenciar los pedidos. ===================
SELECT COUNT(*)/2 FROM Sales.Orders;
GO

ALTER TABLE Sales.Orders
ADD Sucursal NVARCHAR(50) NULL;
GO

UPDATE Sales.Orders
SET Sucursal = 'Limon'
WHERE OrderID IN (
    SELECT TOP (36797) OrderID
    FROM Sales.Orders
    ORDER BY OrderID ASC
);
GO

UPDATE Sales.Orders
SET Sucursal = 'San Jose'
WHERE Sucursal IS NULL;
GO

-- SELECT * FROM Sales.Orders where Sucursal = 'San Jose' ;



-- =================== PurchaseOrders, aqui vamos a agregar una columna Sucursal, para diferenciar los pedidos a los proveedores. ===================
SELECT COUNT(*)/2 FROM Purchasing.PurchaseOrders;
GO

ALTER TABLE Purchasing.PurchaseOrders
ADD Sucursal NVARCHAR(50) NULL;
GO

UPDATE Purchasing.PurchaseOrders
SET Sucursal = 'Limon'
WHERE PurchaseOrderID IN (
    SELECT TOP (1037) PurchaseOrderID
    FROM Purchasing.PurchaseOrders
    ORDER BY PurchaseOrderID ASC
);
GO

UPDATE Purchasing.PurchaseOrders
SET Sucursal = 'San Jose'
WHERE Sucursal IS NULL;
GO

SELECT * FROM Purchasing.PurchaseOrders where Sucursal = 'San Jose' ;