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

    I.Sucursal,

	SUM(VFD.Total) AS TotalFacturado

FROM Facturas I

	 JOIN Clientes C ON I.CustomerID = C.CustomerID

	 JOIN Personas PC ON I.ContactPersonID = PC.PersonID -- Persona de contacto

	 JOIN Personas PV ON I.SalespersonPersonID = PV.PersonID -- Vendedor

	 JOIN MetodosEntrega DM ON I.DeliveryMethodID = DM.DeliveryMethodID
	 
	 JOIN view_FacturasDetalle VFD ON I.InvoiceID = vFD.FacturaID


	 group by I.InvoiceID, I.CustomerID, C.CustomerName, DM.DeliveryMethodName,I.CustomerPurchaseOrderNumber,PC.FullName, PV.FullName, I.InvoiceDate, I.DeliveryInstructions;


GO