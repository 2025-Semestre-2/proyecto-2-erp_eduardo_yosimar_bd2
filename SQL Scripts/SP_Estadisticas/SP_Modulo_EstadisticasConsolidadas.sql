-- En este se supone que tambie deberia de poder filtrar por sucursal.
CREATE PROCEDURE sp_EstadisticasDeComprasPorProveedor_Consolidado -- Los proveedores tiene solo una categoria.
	@NombreProveedor VARCHAR(50) = NULL,
    @Categoria VARCHAR(50) = NULL,
    @Sucursal  VARCHAR(50) = NULL

AS
BEGIN
	SELECT

		--ProveedorID,
		SupplierName,
		SupplierCategoryName,

		MIN(TotalPedido) AS MontoMinimo,
		MAX(TotalPedido) AS MontoMaximo,
		AVG(TotalPedido) AS MontoPromedio

	FROM view_CompraPorProveedor_Consolidado
    WHERE (@NombreProveedor IS NULL OR SupplierName LIKE '%' + @NombreProveedor + '%') AND
		(@Categoria IS NULL OR SupplierCategoryName LIKE '%' + @Categoria + '%') AND 
        (@Sucursal IS NULL OR Sucursal = @Sucursal)
    GROUP BY ROLLUP(SupplierName, SupplierCategoryName);

END;
GO

CREATE PROCEDURE sp_EstadisticasVentasPorCliente_consolidado
	@NombreCliente NVARCHAR(100) = NULL,
	@CategoriaCliente NVARCHAR(100) = NULL,
    @Sucursal  VARCHAR(50) = NULL
AS
BEGIN
	SELECT
		NombreCliente,
		Categoria,

		MIN(TotalFacturado) AS VentaMinima,
		MAX(TotalFacturado) AS VentaMaxima,		
		AVG(TotalFacturado) AS VentaPromedio
	FROM view_VentasPorCliente_Consolidado
	WHERE(@NombreCliente IS NULL OR NombreCliente LIKE '%' + @NombreCliente + '%') AND
		(@CategoriaCliente IS NULL OR Categoria LIKE '%' + @CategoriaCliente + '%') AND 
        (@Sucursal IS NULL OR Sucursal = @Sucursal)
	GROUP BY ROLLUP(NombreCliente, Categoria);
END;
GO


CREATE PROCEDURE sp_TopProductosPorGananciaPorAnio_consolidado
	@AnioInicio INT,
	@AnioFin INT,
    @Sucursal  VARCHAR(50) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		ProductID,
		NombreProducto,
		Anio,
		GananciaTotal,
		resultado.Rango
	FROM (
		SELECT 
			ProductID,
			NombreProducto,
			Anio,
			GananciaTotal,
			DENSE_RANK() OVER (PARTITION BY Anio ORDER BY GananciaTotal DESC) AS Rango
			
		FROM view_GananciaDeProductosPorAnio_Sucursal_Consolidado
		WHERE (Anio BETWEEN @AnioInicio AND @AnioFin) AND 
            (@Sucursal IS NULL OR Sucursal = @Sucursal)

	) resultado
	WHERE resultado.Rango <=5
	ORDER BY resultado.Anio, resultado.Rango

END;
GO

CREATE PROCEDURE sp_TopClientesPorPedidosPorAnio_consolidado
	@AnioInicio INT,
	@AnioFin INT,
    @Sucursal  VARCHAR(50) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		ClienteID,
		NombreCliente,
		CantidadFacturas,
		MontoFacturado,
		Anio,
		resultado.Rango
	FROM (
		SELECT 
			ClienteID,
			NombreCliente,
			CantidadFacturas,
			MontoFacturado,
			Anio,
			DENSE_RANK() OVER (PARTITION BY Anio ORDER BY CantidadFacturas DESC) AS Rango
			
		FROM view_ClientesConMasFacturasPorAnio_Sucursal_Consolidado
		WHERE (Anio BETWEEN @AnioInicio AND @AnioFin) AND 
            (@Sucursal IS NULL OR Sucursal = @Sucursal)

	) resultado
	WHERE resultado.Rango <=5
	ORDER BY resultado.Anio, resultado.Rango

END;
GO

-- EXEC sp_TopClientesPorPedidosPorAnio @AnioInicio = 2014, @AnioFin = 2014;



-- Top 5 proveedores con mas ordenes por a�o. -> Rango de a�os 2013-2016
CREATE PROCEDURE sp_TopProveedoresPorOrdenesPorAnio_consolidado
	@AnioInicio INT,
	@AnioFin INT,
    @Sucursal  VARCHAR(50) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		SupplierID,
		SupplierName,
		CantidadOrdenes,
		MontoTotal,
		Anio,
		resultado.Rango
	FROM (
		SELECT 
			SupplierID,
			SupplierName,
			CantidadOrdenes,
			MontoTotal,
			Anio,
			DENSE_RANK() OVER (PARTITION BY Anio ORDER BY CantidadOrdenes DESC) AS Rango
			
		FROM view_OrdenesPorProveedorPorAnio_Sucursal_Consolidado
		WHERE (Anio BETWEEN @AnioInicio AND @AnioFin) AND 
            (@Sucursal IS NULL OR Sucursal = @Sucursal)
	) resultado
	WHERE resultado.Rango <=5
	ORDER BY resultado.Anio, resultado.Rango

END;
GO

