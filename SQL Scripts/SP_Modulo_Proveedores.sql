
USE WideWorldImporters;
GO;
-- Procedure para el mdoulo de proveedores


-- >>> Obtener los datos generales de todos los proveedores del sistema.

CREATE PROCEDURE sp_ObtenerProveedores
    @NombreProveedor VARCHAR(50) = NULL,
    @Categoria VARCHAR(50) = NULL,
	@MetodoEntrega VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
				
		ProveedorID,
		NombreProveedor,
		Categoria,
		MetodoDeEntrega

    FROM view_Proveedores
	 WHERE (@NombreProveedor IS NULL OR NombreProveedor LIKE '%' + @NombreProveedor + '%') -- Buscar que si no es nulo, de esa forma sabemos si activar el filtro o no.
     AND (@Categoria IS NULL OR Categoria = @Categoria)
	 AND (@MetodoEntrega IS NULL OR MetodoDeEntrega = @MetodoEntrega)
	ORDER BY NombreProveedor ASC;
END;
GO

-- EXEC sp_ObtenerProveedores  @NombreProveedor = null, @Categoria = null, @MetodoEntrega = null

-- >>> Obtener los datos de un proveedor especifico.
CREATE PROCEDURE sp_ObtenerProveedorPorID
    @ProveedorID SMALLINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM view_Proveedores
    WHERE ProveedorID = @ProveedorID;
END;
GO