-- 1. Eliminar primero las líneas asociadas a órdenes de la sucursal Limón
DELETE POL
FROM Purchasing.PurchaseOrderLines AS POL
INNER JOIN Purchasing.PurchaseOrders AS PO
    ON POL.PurchaseOrderID = PO.PurchaseOrderID
WHERE PO.Sucursal = 'San Jose';

-- 2. Luego eliminar las órdenes de la sucursal Limón
DELETE FROM Purchasing.PurchaseOrders
WHERE Sucursal = 'San Jose';



-- 1. Eliminar InvoiceLines asociadas a Invoices de Orders de sucursal Limon
DELETE IL
FROM Sales.InvoiceLines AS IL
INNER JOIN Sales.Invoices AS I
    ON IL.InvoiceID = I.InvoiceID
INNER JOIN Sales.Orders AS O
    ON I.OrderID = O.OrderID
WHERE O.Sucursal = 'San Jose';

-- 2. Eliminar Invoices asociadas a Orders de sucursal Limon
DELETE I
FROM Sales.Invoices AS I
INNER JOIN Sales.Orders AS O
    ON I.OrderID = O.OrderID
WHERE O.Sucursal = 'San Jose';

-- 3. Eliminar OrderLines asociadas a Orders de sucursal Limon
DELETE OL
FROM Sales.OrderLines AS OL
INNER JOIN Sales.Orders AS O
    ON OL.OrderID = O.OrderID
WHERE O.Sucursal = 'San Jose';

-- 4. Eliminar Orders de sucursal Limon
DELETE FROM Sales.Orders
WHERE Sucursal = 'San Jose';
