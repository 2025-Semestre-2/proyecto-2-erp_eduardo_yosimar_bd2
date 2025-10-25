-- Scripts para la creacion de vistas del proyecto.

USE WideWorldImporters;
GO
-- Vista para la los clientes

-- select * from Sales.Customers;
-- GO

-- DROP VIEW view_Clientes;

CREATE VIEW view_Clientes AS -- Hay que volver a crear esta vista.
SELECT
	C.CustomerID AS ClienteID,
	C.CustomerName AS NombreCliente,

	CC.CustomerCategoryName AS Categoria,

	BG.BuyingGroupName AS GrupoDeCompra,


	-- En esta parte de los contactos tambien se podria agregar el numero y el correo electronico
	PP.FullName AS ContactoPrimario,
	PP.PhoneNumber AS TelefonoCP,
	PP.EmailAddress AS CorreoCP,

	PA.FullName AS ContactoSecundario,
	PA.PhoneNumber AS TelefonoCS,
	PA.EmailAddress AS CorreoCS,


	CFAC.CustomerName AS ClienteParaFacturar,

	DM.DeliveryMethodName AS MetodoDeEntrega,

	CI.CityName AS CiudadDeEntrega,

	C.DeliveryPostalCode AS CodigoPostal,
	C.PhoneNumber AS NumeroTelefonico,
	C.FaxNumber AS FAX,
	C.PaymentDays AS DiasParaPagar,
	C.WebsiteURL AS SitioWeb,

	C.DeliveryAddressLine1 AS DireccionEnvio1,
	C.DeliveryAddressLine2 AS DireccionEnvio2,

	C.PostalAddressLine1 AS CodigoPostalLinea1,
	C.PostalAddressLine2  AS CodigoPostalLinea2,

	C.DeliveryLocation AS Localizacion, -- Este es que se usa para el mapa, es un dato geografico.

	C.AccountOpenedDate AS FechaAperturaCuenta

FROM Clientes C -- Usando left siempre me aseguro que los datos de los clientes siempre esten.

	LEFT JOIN CategoriasClientes  CC ON C.CustomerCategoryID = CC.CustomerCategoryID

	LEFT JOIN MetodosEntrega  DM ON C.DeliveryMethodID = dm.DeliveryMethodID

	LEFT JOIN Sales.BuyingGroups  BG ON C.BuyingGroupID = bg.BuyingGroupID

	LEFT JOIN Personas  PP ON C.PrimaryContactPersonID = PP.PersonID

	LEFT JOIN Personas  PA ON C.AlternateContactPersonID = PA.PersonID

	LEFT JOIN Clientes CFAC ON C.BillToCustomerID = CFAC.CustomerID -- Esto es para la factura

	LEFT JOIN Ciudades CI ON C.DeliveryCityID = CI.CityID;

GO


-- Vista para el modulo de proveedores:

-- select * from Purchasing.Suppliers;
-- GO

CREATE VIEW view_Proveedores AS
SELECT
	S.SupplierID AS ProveedorID,

    S.SupplierReference AS ReferenciaProveedor,

    S.SupplierName AS NombreProveedor,

    SC.SupplierCategoryName AS Categoria,

	-- Contactos
	PP.FullName AS ContactoPrimario,
	PP.PhoneNumber AS TelefonoCP,
	PP.EmailAddress AS CorreoCP,

	PA.FullName AS ContactoSecundario,
	PA.PhoneNumber AS TelefonoCS,
	PA.EmailAddress AS CorreoCS,


    DM.DeliveryMethodName AS MetodoDeEntrega,

    C.CityName AS CiudadDeEntrega,

    S.DeliveryPostalCode AS CodigoPostal,
    S.PhoneNumber AS Telefono,
    S.FaxNumber AS FAX,
    S.WebsiteURL AS SitioWeb,

    S.DeliveryAddressLine1 AS DireccionEnvio1,
    S.DeliveryAddressLine2 AS DireccionEnvio2,

    S.PostalAddressLine1 AS CodigoPostalLinea1,
    S.PostalAddressLine2 AS CodigoPostalLinea2,

    S.DeliveryLocation AS Localizacion, -- Este es el que se usa para el mapa

	-- Datos bancarios.
    S.BankAccountName AS NombreBanco,
    S.BankAccountNumber AS NumeroCuenta,
	S.BankAccountCode AS CodigoBanco,

    S.PaymentDays AS DiasParaPagar

FROM Proveedores S

	LEFT JOIN CategoriasProveedores SC ON S.SupplierCategoryID = SC.SupplierCategoryID

	LEFT JOIN Personas PP ON S.PrimaryContactPersonID = PP.PersonID

	LEFT JOIN Personas PA ON S.AlternateContactPersonID = PA.PersonID

	LEFT JOIN MetodosEntrega DM ON S.DeliveryMethodID = DM.DeliveryMethodID

	LEFT JOIN Ciudades C ON S.DeliveryCityID = C.CityID;

GO


-- Vista para el modulo de investarios.

CREATE VIEW view_Inventario AS -- Se ocupa volver a generar esta vista para actualizarla con los cambios.
SELECT

	SI.StockItemID AS ProductID,

    SI.StockItemName AS NombreProducto,

    SG.StockGroupName AS Grupo,

	S.SupplierID AS ProveedorID, -- Faltaba esta para poder buscar al proveedor.

    S.SupplierName AS NombreProveedor ,

    C.ColorName AS Color,

    -- Typos de embases (empaquetamiento) que se tiene.
    PT.PackageTypeName AS EmpaquetamientoBase,
    PTO.PackageTypeName AS EmpaquetamientoAlternativo,

    SI.RecommendedRetailPrice AS PrecioVenta,

    SI.TypicalWeightPerUnit AS Peso,

    SI.SearchDetails AS PalabrasClave,

	-- Empieza lo de descripcion.
    SI.QuantityPerOuter AS CantidadEmpaquetamiento,  -- Es la cantidad que puede haber por paquete.

    SI.Brand AS Marca,

    SI.Size AS Talla,

    SI.TaxRate AS Impuesto,

    SI.UnitPrice AS PrecioUnitacio,

    SIH.QuantityOnHand AS CantidadDisponible, -- Esta es la de cantidad en inventario

    SIH.BinLocation AS Ubicacion,

	SIH.ReorderLevel AS NivelOrdenamiento, -- No estoy seguro si pertenece a la ubicacion.

	SIH.TargetStockLevel AS NivelStockObjetivo, -- No estoy seguro de si es el nivel de stock que se deberia tener.

	SIH.LastStocktakeQuantity AS UltimaCantidadGuardada


FROM Productos SI

	LEFT JOIN Proveedores S ON SI.SupplierID = S.SupplierID

	LEFT JOIN Warehouse.Colors C ON SI.ColorID = C.ColorID

	LEFT JOIN Warehouse.PackageTypes PT ON SI.UnitPackageID = PT.PackageTypeID

	LEFT JOIN Warehouse.PackageTypes PTO ON SI.OuterPackageID = PTO.PackageTypeID

	LEFT JOIN InventarioActual SIH ON SI.StockItemID = SIH.StockItemID

	LEFT JOIN Warehouse.StockItemStockGroups SISG ON SI.StockItemID = SISG.StockItemID

	LEFT JOIN Warehouse.StockGroups SG ON SISG.StockGroupID = SG.StockGroupID;

GO

--select 
	--min(CantidadDisponible),
	--max(CantidadDisponible)
--from view_Inventario;

-- >> Vista para la lista de grupos que tiene un producto.
CREATE VIEW view_GruposProducto AS
SELECT
	SISG.StockItemStockGroupID AS RelacionID,
	SISG.StockItemID AS ProductID,
	SISG.StockGroupID AS GrupoID,
	SG.StockGroupName AS NombreGrupo

FROM Warehouse.StockItemStockGroups SISG
	JOIN Warehouse.StockGroups SG ON SISG.StockGroupID = SG.StockGroupID;
GO



-- Vistas para el modulo de facturas.

-- >> Detalle:

CREATE VIEW view_FacturasDetalle AS
SELECT

	IL.InvoiceID AS FacturaID,

    IL.StockItemID AS ProductID,

    SI.StockItemName AS NombreProducto,

    IL.Quantity AS Cantidad,

    IL.UnitPrice AS PrecioUnitario,

    IL.TaxRate AS Impuesto,

    IL.TaxAmount AS TotalImpuesto,

    IL.ExtendedPrice AS Total,

	IL.LineProfit AS Ganancia


FROM DetalleFacturas IL

	JOIN Productos SI ON IL.StockItemID = SI.StockItemID; -- Este podria funcionar sin el left join. - En el caso de las facturas debe ser usado lo para obtener el nombre, nada de precio, por que eso varia.

GO

-- >> Encabezado:

CREATE VIEW view_FacturasEncabezado AS
SELECT

	I.InvoiceID AS NumeroFactura,

	-- Cliente
    I.CustomerID AS ClienteID,
    C.CustomerName AS NombreCliente,

    DM.DeliveryMethodName AS MetodoEnvio,

    I.CustomerPurchaseOrderNumber AS NumeroDeOrden,

	-- Persona de contacto
    PC.FullName AS Contacto,

	-- Vendedor
    PV.FullName AS Vendedor,

    I.InvoiceDate AS FechaFactura,
 
	I.DeliveryInstructions AS InstruccionesEntrega,

	SUM(VFD.Total) AS TotalFacturado

FROM Facturas I

	 JOIN Clientes C ON I.CustomerID = C.CustomerID

	 JOIN Personas PC ON I.ContactPersonID = PC.PersonID -- Persona de contacto

	 JOIN Personas PV ON I.SalespersonPersonID = PV.PersonID -- Vendedor

	 JOIN MetodosEntrega DM ON I.DeliveryMethodID = DM.DeliveryMethodID
	 
	 JOIN view_FacturasDetalle VFD ON I.InvoiceID = vFD.FacturaID


	 group by I.InvoiceID, I.CustomerID, C.CustomerName, DM.DeliveryMethodName,I.CustomerPurchaseOrderNumber,PC.FullName, PV.FullName, I.InvoiceDate, I.DeliveryInstructions;


GO

--select 
	--min(FechaFactura),
	--max(FechaFactura)
--from view_FacturasEncabezado;






-- Vistas para la seccion de estadisticas:

-- >> Montos de compra a proveedores.

-- Ocupamos los montos (ocupamos el total de cada factura) minimos, maximos y promedios por proveedor.
-- Se agrupa por proveedor y categoria, usando rollup.
-- Se puede filtrar por categoria y el nombre del proveedor. -> Esto es del procedure y creo que el roullup tambien debe serlo
-- A lo que se puede ver, OrderedOuters y ExpectedUnitPricePerOuter, deberian de ser los usados para calcular el monto (Esto se debe revisar)
CREATE VIEW view_CompraPorProveedor AS
SELECT

	PO.PurchaseOrderID AS PedidoID,

	PO.SupplierID AS ProveedorID,
	S.SupplierName AS NombreProveedor,
	SC.SupplierCategoryName AS Categoria,
    PO.OrderDate AS FechaPedido,

	-- Calcular el total del pedido
    SUM(POL.ReceivedOuters * POL.ExpectedUnitPricePerOuter) AS TotalPedido
	-- Paquetes Pedidos * precio por paquete

FROM OrdenesCompra PO

	JOIN Proveedores S ON PO.SupplierID = S.SupplierID
	JOIN CategoriasProveedores SC ON S.SupplierCategoryID = SC.SupplierCategoryID

	-- De aqui para abajo es pra sacar el monto total del pedido.
	JOIN DetalleOrdenesCompra POL ON PO.PurchaseOrderID = POL.PurchaseOrderID
	GROUP BY PO.PurchaseOrderID, PO.SupplierID, S.SupplierName, SC.SupplierCategoryName, PO.OrderDate;
	--ORDER BY TotalPedido DESC; -- Que los de mayor monto esten primero.
GO
--select 
	--min(FechaPedido),
	--max(FechaPedido)
--from view_CompraPorProveedor;

-- >> Montos de las facturas o compras realizadas por los clientes.
-- Usamos la vista que se creo para facturas, pero hay que unirla con la tablas de clientes para buscar la categoria.
CREATE VIEW view_VentasPorCliente AS
SELECT
	VFE.NumeroFactura AS NumeroFactura,
    
	VFE.ClienteID AS ClienteID,
    VFE.NombreCliente AS NombreCliente,

    CC.CustomerCategoryName AS Categoria,

    VFE.TotalFacturado

FROM view_FacturasEncabezado VFE

	JOIN Clientes C ON VFE.ClienteID = C.CustomerID
	JOIN CategoriasClientes CC ON C.CustomerCategoryID = CC.CustomerCategoryID

	GROUP BY VFE.NumeroFactura, VFE.ClienteID, VFE.NombreCliente, CC.CustomerCategoryName, VFE.TotalFacturado;

GO


-- >>  Los 5 producto con mayor ganancia generada por año.
-- Para cada factura, obtener sus detalles con el precio (de ese momento) y la cantidad vendidad. A ese precio del momento en el que se vendio se le tiene que quitar el precio actual para ver la diferenca.
CREATE VIEW view_GananciaDeProductosPorAnio AS
SELECT

	VFD.ProductID,
	VFD.NombreProducto,

	YEAR(VFE.FechaFactura) AS Anio,

    -- SUM(VFD.Cantidad * (VFD.Ganancia)) AS GananciaTotal
	--SUM(VFD.Cantidad * (VFD.PrecioUnitario - SI.UnitPrice)) AS GananciaTotal --
	SUM(VFD.Ganancia) AS GananciaTotal

FROM view_FacturasEncabezado VFE

	JOIN view_FacturasDetalle VFD ON VFE.NumeroFactura = VFD.FacturaID
	JOIN Productos SI ON VFD.ProductID = SI.StockItemID -- Para obtener el precio actual.

	GROUP BY VFD.ProductID, VFD.NombreProducto, YEAR(VFE.FechaFactura);

GO


-- >> Los 5 clientes con mas facturas emitidas.
CREATE VIEW view_ClientesConMasFacturasPorAnio AS
SELECT

	VFE.ClienteID,
	VFE.NombreCliente,

	YEAR(VFE.FechaFactura) AS Anio,

    COUNT(VFE.NumeroFactura) AS CantidadFacturas,

	SUM(VFE.TotalFacturado) AS MontoFacturado

FROM view_FacturasEncabezado VFE
	GROUP BY VFE.ClienteID, VFE.NombreCliente, YEAR(VFE.FechaFactura);

GO


-- >> Los 5 proveedores con mas pedidos por año.
CREATE VIEW view_OrdenesPorProveedorPorAnio AS
SELECT

    PO.SupplierID,
    S.SupplierName,
	YEAR(po.OrderDate) AS Anio,

    COUNT(DISTINCT PO.PurchaseOrderID) AS CantidadOrdenes, -- Hay algunos id repetidos por 
    SUM(POL.OrderedOuters * POL.ExpectedUnitPricePerOuter) AS MontoTotal -- Aqui mas bien se ocupan todas las repeticiones para poder sumar.

FROM OrdenesCompra PO
	JOIN DetalleOrdenesCompra POL ON PO.PurchaseOrderID = POL.PurchaseOrderID
	JOIN Proveedores S ON PO.SupplierID = S.SupplierID

	GROUP BY  PO.SupplierID, S.SupplierName, YEAR(PO.OrderDate);
GO
