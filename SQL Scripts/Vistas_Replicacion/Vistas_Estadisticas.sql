USE WWI_Corporativo_V1;
GO

-- Comprar por proveedor: Consolidada en las 2 sucursales limon y sanjose
CREATE OR ALTER VIEW view_CompraPorProveedor AS
    -- San José
    SELECT
        Sucursal = N'SanJose',
        PO.PurchaseOrderID,
        PO.SupplierID,
        SupplierName = S.SupplierName,
        SupplierCategoryName = SC.SupplierCategoryName,
        PO.OrderDate,
        TotalPedido = SUM(COALESCE(POL.ReceivedOuters, POL.OrderedOuters) * COALESCE(POL.ExpectedUnitPricePerOuter, 0.0)) -- coalesce para no nulosw
    FROM WWI_Sucursal_San_Jose_V1.Purchasing.PurchaseOrders PO
    JOIN WWI_Sucursal_San_Jose_V1.Purchasing.Suppliers S ON PO.SupplierID = S.SupplierID
    JOIN WWI_Sucursal_San_Jose_V1.Purchasing.SupplierCategories SC ON S.SupplierCategoryID = SC.SupplierCategoryID
    JOIN WWI_Sucursal_San_Jose_V1.Purchasing.PurchaseOrderLines POL ON PO.PurchaseOrderID = POL.PurchaseOrderID
    GROUP BY PO.PurchaseOrderID, PO.SupplierID, S.SupplierName, SC.SupplierCategoryName, PO.OrderDate

    UNION ALL

    -- Limón
    SELECT
        Sucursal = N'Limon',
        PO.PurchaseOrderID,
        PO.SupplierID,
        SupplierName = S.SupplierName,
        SupplierCategoryName = SC.SupplierCategoryName,
        PO.OrderDate,
        TotalPedido = SUM(COALESCE(POL.ReceivedOuters, POL.OrderedOuters) * COALESCE(POL.ExpectedUnitPricePerOuter, 0.0)) -- Coalesce para que no de valores nulos
    FROM WWI_Sucursal_Limon_V1.Purchasing.PurchaseOrders PO
    JOIN WWI_Sucursal_Limon_V1.Purchasing.Suppliers S ON PO.SupplierID = S.SupplierID
    JOIN WWI_Sucursal_Limon_V1.Purchasing.SupplierCategories SC ON S.SupplierCategoryID = SC.SupplierCategoryID
    JOIN WWI_Sucursal_Limon_V1.Purchasing.PurchaseOrderLines POL ON PO.PurchaseOrderID = POL.PurchaseOrderID
    GROUP BY PO.PurchaseOrderID, PO.SupplierID, S.SupplierName, SC.SupplierCategoryName, PO.OrderDate;
GO


-- sp de resumen
CREATE OR ALTER PROCEDURE dbo.sp_ResumenComprasPorProveedor
    @Categoria NVARCHAR(100) = NULL,
    @Proveedor NVARCHAR(200) = NULL
AS
BEGIN
  -- Procedimiento miedo
END
GO

-- VISTA 2

-- Vista consolidada de facturas por sucursales
CREATE OR ALTER VIEW view_FacturasPorSucursal AS
    -- San José
    SELECT
        Sucursal = N'SanJose',
        I.InvoiceID,
        I.CustomerID,
        CustomerName = C.CustomerName,
        CustomerCategoryName = CC.CustomerCategoryName,
        I.InvoiceDate,
        TotalFactura = SUM(COALESCE(IL.Quantity, 0) * COALESCE(IL.UnitPrice, 0.0))
    FROM WWI_Sucursal_San_Jose_V1.Sales.Invoices I
    JOIN WWI_Sucursal_San_Jose_V1.Sales.InvoiceLines IL ON I.InvoiceID = IL.InvoiceID
    JOIN WWI_Sucursal_San_Jose_V1.Sales.Clientes C ON I.CustomerID = C.CustomerID
    JOIN WWI_Sucursal_San_Jose_V1.Sales.CustomerCategories CC ON C.CustomerCategoryID = CC.CustomerCategoryID
    GROUP BY I.InvoiceID, I.CustomerID, C.CustomerName, CC.CustomerCategoryName, I.InvoiceDate

    UNION ALL

    -- Limón
    SELECT
        Sucursal = N'Limon',
        I.InvoiceID,
        I.CustomerID,
        CustomerName = C.CustomerName,
        CustomerCategoryName = CC.CustomerCategoryName,
        I.InvoiceDate,
        TotalFactura = SUM(COALESCE(IL.Quantity, 0) * COALESCE(IL.UnitPrice, 0.0))
    FROM WWI_Sucursal_Limon_V1.Sales.Invoices I
    JOIN WWI_Sucursal_Limon_V1.Sales.InvoiceLines IL ON I.InvoiceID = IL.InvoiceID
    JOIN WWI_Sucursal_Limon_V1.Sales.Clientes C ON I.CustomerID = C.CustomerID
    JOIN WWI_Sucursal_Limon_V1.Sales.CustomerCategories CC ON C.CustomerCategoryID = CC.CustomerCategoryID
    GROUP BY I.InvoiceID, I.CustomerID, C.CustomerName, CC.CustomerCategoryName, I.InvoiceDate;
GO


-- sp de resumen
CREATE OR ALTER PROCEDURE dbo.sp_ResumenVentasPorCliente
    @Categoria NVARCHAR(100) = NULL,
    @Cliente   NVARCHAR(200) = NULL
AS
BEGIN
 -- SP miedo
END
GO

-- vista 3: 

USE WWI_Corporativo_V1;
GO

-- vistas de InvoiceLines sucurales
CREATE OR ALTER VIEW view_LineasFacturasSucursal AS
    SELECT
        Sucursal     = N'SanJose',
        I.InvoiceID,
        IL.StockItemID           AS ProductID,
        SI.StockItemName         AS NombreProducto,
        I.InvoiceDate,
        LineProfit   = COALESCE(IL.LineProfit, 0.0)
    FROM WWI_Sucursal_San_Jose_V1.Sales.Invoices I
    JOIN WWI_Sucursal_San_Jose_V1.Sales.InvoiceLines IL ON I.InvoiceID = IL.InvoiceID
    JOIN WWI_Sucursal_San_Jose_V1.Warehouse.StockItems SI ON IL.StockItemID = SI.StockItemID

    UNION ALL

    SELECT
        Sucursal     = N'Limon',
        I.InvoiceID,
        IL.StockItemID           AS ProductID,
        SI.StockItemName         AS NombreProducto,
        I.InvoiceDate,
        LineProfit   = COALESCE(IL.LineProfit, 0.0)
    FROM WWI_Sucursal_Limon_V1.Sales.Invoices I
    JOIN WWI_Sucursal_Limon_V1.Sales.InvoiceLines IL ON I.InvoiceID = IL.InvoiceID
    JOIN WWI_Sucursal_Limon_V1.Warehouse.StockItems SI ON IL.StockItemID = SI.StockItemID;
GO

-- sp resumen
CREATE OR ALTER PROCEDURE dbo.sp_TopProductosPorGanancia
    @AnioDesde INT = NULL,
    @AnioHasta INT = NULL,
    @AniosCSV NVARCHAR(MAX) = NULL
AS
BEGIN
 -- SP mieo
END
GO