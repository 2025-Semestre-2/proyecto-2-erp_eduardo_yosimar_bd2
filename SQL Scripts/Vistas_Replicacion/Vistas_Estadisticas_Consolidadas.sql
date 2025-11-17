USE WWI_Corporativo_V1;
GO

-- Comprar por proveedor: Consolidada en las 2 sucursales limon y sanjose
CREATE OR ALTER VIEW view_CompraPorProveedor_Consolidado AS
    -- San Jose
    SELECT
        PO.Sucursal,
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
    GROUP BY PO.PurchaseOrderID, PO.SupplierID, S.SupplierName, SC.SupplierCategoryName, PO.OrderDate,  PO.Sucursal

    UNION ALL

    -- Limon
    SELECT
        PO.Sucursal,
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
    GROUP BY PO.PurchaseOrderID, PO.SupplierID, S.SupplierName, SC.SupplierCategoryName, PO.OrderDate,  PO.Sucursal;
GO





-- Para la estadistica de las ventas por cliente.
CREATE OR ALTER VIEW view_VentasPorCliente_Consolidado AS
    -- San Jose
    SELECT
        VFE.Sucursal,
        VFE.NumeroFactura,
        VFE.ClienteID,
        VFE.NombreCliente,
        CC.CustomerCategoryName AS Categoria,
        VFE.TotalFacturado
    FROM WWI_Sucursal_San_Jose_V1.dbo.view_FacturasEncabezado VFE
    JOIN WWI_Sucursal_San_Jose_V1.Sales.Clientes C ON VFE.ClienteID = C.CustomerID
    JOIN WWI_Sucursal_San_Jose_V1.dbo.CategoriasClientes CC ON C.CustomerCategoryID = CC.CustomerCategoryID
    GROUP BY VFE.NumeroFactura, VFE.ClienteID, VFE.NombreCliente, CC.CustomerCategoryName, VFE.TotalFacturado, VFE.Sucursal

    UNION ALL

    -- Limon
    SELECT
        VFE.Sucursal,
        VFE.NumeroFactura,
        VFE.ClienteID,
        VFE.NombreCliente,
        CC.CustomerCategoryName AS Categoria,
        VFE.TotalFacturado
    FROM WWI_Sucursal_Limon_V1.dbo.view_FacturasEncabezado VFE -- <- Revisar esta vistas que que funcione con las nuevas modificaciones.
    JOIN WWI_Sucursal_Limon_V1.Sales.Clientes C ON VFE.ClienteID = C.CustomerID
    JOIN WWI_Sucursal_Limon_V1.dbo.CategoriasClientes CC ON C.CustomerCategoryID = CC.CustomerCategoryID
    GROUP BY VFE.NumeroFactura, VFE.ClienteID, VFE.NombreCliente, CC.CustomerCategoryName, VFE.TotalFacturado, VFE.Sucursal;
GO
--select * from 


-- >> Para la tercera estadistica de productos con mas ganancia por año.
-- Primero se crea una consolidad para ambas sucursales, esta tendria los 
CREATE OR ALTER VIEW view_GananciaDeProductosPorAnio_Sucursal_Consolidado AS
    -- San José
    -- SELECT
    --     Sucursal,
    --     VFD.ProductID,
    --     VFD.NombreProducto,
    --     YEAR(VFE.FechaFactura) AS Anio,
    --     SUM(VFD.Ganancia) AS GananciaTotal
    -- FROM WWI_Sucursal_San_Jose_V1.Sales.view_FacturasEncabezado VFE
    -- JOIN WWI_Sucursal_San_Jose_V1.Sales.view_FacturasDetalle VFD 
    --     ON VFE.NumeroFactura = VFD.FacturaID
    -- JOIN WWI_Sucursal_San_Jose_V1.Warehouse.Productos SI 
    --     ON VFD.ProductID = SI.StockItemID
    -- GROUP BY VFD.ProductID, VFD.NombreProducto, YEAR(VFE.FechaFactura)

    -- UNION ALL

    -- -- Limón
    -- SELECT
    --     Sucursal = N'Limon',
    --     VFD.ProductID,
    --     VFD.NombreProducto,
    --     YEAR(VFE.FechaFactura) AS Anio,
    --     SUM(VFD.Ganancia) AS GananciaTotal
    -- FROM WWI_Sucursal_Limon_V1.Sales.view_FacturasEncabezado VFE
    -- JOIN WWI_Sucursal_Limon_V1.Sales.view_FacturasDetalle VFD 
    --     ON VFE.NumeroFactura = VFD.FacturaID
    -- JOIN WWI_Sucursal_Limon_V1.Warehouse.Productos SI 
    --     ON VFD.ProductID = SI.StockItemID
    -- GROUP BY VFD.ProductID, VFD.NombreProducto, YEAR(VFE.FechaFactura);

    -- Productos de San jose.
    SELECT * FROM WWI_Sucursal_San_Jose_V1.dbo.view_GananciaDeProductosPorAnio
    
    UNION ALL

    -- Productos de Limon.
    SELECT * FROM WWI_Sucursal_Limon_V1.dbo.view_GananciaDeProductosPorAnio;

GO


-- Esta seria para lo mismo que la de arriba nada mas que aqui no separamos los productos por sucursal, la tratamos co,o una sola.
CREATE OR ALTER VIEW view_GananciaDeProductosPorAnio_Consolidada AS
SELECT
    V.ProductID,
    V.NombreProducto,
    V.Anio,
    SUM(V.GananciaTotal) AS GananciaTotal
FROM view_GananciaDeProductosPorAnio_Sucursal_Consolidado V
GROUP BY V.ProductID, V.NombreProducto, V.Anio;
GO



-- >> Para la cuarta estadistica de clientes con mas facturas por años.
CREATE OR ALTER VIEW view_ClientesConMasFacturasPorAnio_Sucursal_Consolidado AS
    SELECT * FROM WWI_Sucursal_San_Jose_V1.dbo.view_ClientesConMasFacturasPorAnio
    UNION ALL
    SELECT * FROM WWI_Sucursal_Limon_V1.dbo.view_ClientesConMasFacturasPorAnio;
GO

-- Vista general que no hace distincion entre sucursales,
CREATE OR ALTER VIEW view_ClientesConMasFacturasPorAnio_Consolidada AS
SELECT
    ClienteID,
    NombreCliente,
    Anio,
    SUM(CantidadFacturas) AS CantidadFacturas,
    SUM(MontoFacturado) AS MontoFacturado
FROM view_ClientesConMasFacturasPorAnio_Sucursal_Consolidado
GROUP BY ClienteID, NombreCliente, Anio;
GO



-- >> Vistas para las ordenes de proveedores consolidando los pedidos de ambas sucursales.
CREATE OR ALTER VIEW view_OrdenesPorProveedorPorAnio_Sucursal_Consolidado AS
    SELECT * FROM WWI_Sucursal_San_Jose_V1.dbo.view_OrdenesPorProveedorPorAnio
    UNION ALL
    SELECT * FROM WWI_Sucursal_Limon_V1.dbo.view_OrdenesPorProveedorPorAnio;
GO

-- Unifiar los datos de las dos bases de datos en una sola para que no haya distincion entre proveedores.
CREATE OR ALTER VIEW view_OrdenesPorProveedorPorAnio_Consolidada AS
SELECT
    SupplierID,
    SupplierName,
    Anio,
    SUM(CantidadOrdenes) AS CantidadOrdenes,
    SUM(MontoTotal) AS MontoTotal
FROM view_OrdenesPorProveedorPorAnio_Sucursal_Consolidado
GROUP BY SupplierID, SupplierName, Anio;
GO



