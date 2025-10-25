
-- Scripts para la creacion de los procedure de las estadisticas.
USE WideWorldImporters;
GO

-- >> Para los pedidos hechos a los porveedores
-- Se van a general conjuntos d 2 filas
-- 1. Datos generales con nombre y categoria completos. Va a tener el min, max y promedio especificos
-- 2. Va a tener a dar la categoria en null. Sera el promerio para ese proveedor en todas las categorias (Cada proveedor solo tiene una categoria, asi que no se.)

-- Se va a tener una tercera fila (Va a estar al final de toda la consulta): esta es el promedio de todos los datos que cumplieron las condiciones de filtrado-

CREATE PROCEDURE sp_EstadisticasDeComprasPorProveedor -- Los proveedores tiene solo una categoria.
	@NombreProveedor VARCHAR(50) = NULL,
    @Categoria VARCHAR(50) = NULL

AS
BEGIN
	SELECT

		--ProveedorID,
		NombreProveedor,
		Categoria,

		MIN(TotalPedido) AS MontoMinimo,
		MAX(TotalPedido) AS MontoMaximo,
		AVG(TotalPedido) AS MontoPromedio

	FROM view_CompraPorProveedor
    WHERE (@NombreProveedor IS NULL OR NombreProveedor LIKE '%' + @NombreProveedor + '%') AND
		(@Categoria IS NULL OR Categoria LIKE '%' + @Categoria + '%')
    GROUP BY ROLLUP(NombreProveedor, Categoria);
END;
GO
-- EXEC sp_EstadisticasDeComprasPorProveedor @NombreProveedor = '', @Categoria = 'Novelty Goods Supplier';


-- Para los facturado a los clientes
CREATE PROCEDURE sp_EstadisticasVentasPorCliente
	@NombreCliente NVARCHAR(100) = NULL,
	@CategoriaCliente NVARCHAR(100) = NULL
AS
BEGIN
	SELECT
		NombreCliente,
		Categoria,

		MIN(TotalFacturado) AS VentaMinima,
		MAX(TotalFacturado) AS VentaMaxima,		
		AVG(TotalFacturado) AS VentaPromedio
	FROM view_VentasPorCliente
	WHERE(@NombreCliente IS NULL OR NombreCliente LIKE '%' + @NombreCliente + '%') AND
		(@CategoriaCliente IS NULL OR Categoria LIKE '%' + @CategoriaCliente + '%')
	GROUP BY ROLLUP(NombreCliente, Categoria);
END;
GO
-- select * from view_VentasPorCliente
-- EXEC sp_EstadisticasVentasPorCliente @NombreCliente = '', @CategoriaCliente = '';

-- Para los de los productos mas vendidos por año
-- Se ocupa un select para filtrar los datos que esten en el rango de años y un select para filtrar los que esten en el top 5.
CREATE PROCEDURE sp_TopProductosPorGananciaPorAnio
	@AnioInicio INT,
	@AnioFin INT
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
			
		FROM view_GananciaDeProductosPorAnio
		WHERE Anio BETWEEN @AnioInicio AND @AnioFin

	) resultado
	WHERE resultado.Rango <=5
	ORDER BY resultado.Anio, resultado.Rango

END;
GO
-- EXEC sp_TopProductosPorGananciaPorAnio @AnioInicio = 2014, @AnioFin = 2015;


-- Top 5 clientes con mas factura emetidad.
CREATE PROCEDURE sp_TopClientesPorPedidosPorAnio
	@AnioInicio INT,
	@AnioFin INT
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
			
		FROM view_ClientesConMasFacturasPorAnio
		WHERE Anio BETWEEN @AnioInicio AND @AnioFin

	) resultado
	WHERE resultado.Rango <=5
	ORDER BY resultado.Anio, resultado.Rango

END;
GO

-- EXEC sp_TopClientesPorPedidosPorAnio @AnioInicio = 2014, @AnioFin = 2014;



-- Top 5 proveedores con mas ordenes por a�o. -> Rango de a�os 2013-2016
CREATE PROCEDURE sp_TopProveedoresPorOrdenesPorAnio
	@AnioInicio INT,
	@AnioFin INT
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
			
		FROM view_OrdenesPorProveedorPorAnio
		WHERE Anio BETWEEN @AnioInicio AND @AnioFin
	) resultado
	WHERE resultado.Rango <=5
	ORDER BY resultado.Anio, resultado.Rango

END;
GO

--EXEC sp_TopProveedoresPorOrdenesPorAnio @AnioInicio = 2014, @AnioFin = 2016;
