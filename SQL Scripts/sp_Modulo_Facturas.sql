
USE WideWorldImporters;
GO
-- Procedure para el mdoulo de facturas


-- >>> Obtener los datos generales de todos las facturas del sistema.

CREATE PROCEDURE sp_ObtenerFacturas
    @NumeroFactura INT = NULL,
    @NombreCliente VARCHAR(50) = NULL,

	@FechaMinima DATE = NULL,
    @FechaMaxima DATE = NULL,

	@MontoMinimo FLOAT = NULL,
	@MontoMaximo FLOAT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
				
		NumeroFactura,
		NombreCliente,
		FechaFactura,
		MetodoEnvio,
		TotalFacturado

	FROM view_FacturasEncabezado

	WHERE (@NumeroFactura IS NULL OR NumeroFactura = @NumeroFactura)

	AND (@NombreCliente IS NULL OR NombreCliente LIKE '%' + @NombreCliente + '%') -- Buscar que si no es nulo, de esa forma sabemos si activar el filtro o no.
    
	-- Rango de fechas.
	--AND (FechaFactura BETWEEN @FechaMinima AND @FechaMaxima) 
    -- AND (@FechaSalida BETWEEN R2.FechaHoraIngreso AND R2.FechaHoraSalida)
	-- AND ((@FechaMinima IS NULL OR @FechaMaxima)FechaFactura BETWEEN @FechaMinima AND @FechaMaxima)
	AND (@FechaMinima IS NULL OR FechaFactura >= @FechaMinima)
	AND (@FechaMaxima IS NULL OR FechaFactura <= @FechaMaxima)

	-- Rango del monto. 
	AND ( @MontoMinimo IS NULL OR TotalFacturado >= @MontoMinimo)
    AND (@MontoMaximo IS NULL OR TotalFacturado <= @MontoMaximo)

	ORDER BY NombreCliente ASC;
END;
GO

-- EXEC sp_ObtenerFacturas @NumeroFactura = null, @NombreCliente = 2014;

-- >>> Obtener los datos de un producto especifico.
CREATE PROCEDURE sp_ObtenerFacturaPorID
    @NumeroFactura INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM view_FacturasEncabezado
    WHERE NumeroFactura = @NumeroFactura;
END;
GO

-- >>> Obtener la lista de productos que conforman a una factura, mediante el ID de factura.
CREATE PROCEDURE sp_ObtenerDetalleFacturaPorID
    @NumeroFactura INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM view_FacturasDetalle
    WHERE FacturaID = @NumeroFactura;
END;
GO