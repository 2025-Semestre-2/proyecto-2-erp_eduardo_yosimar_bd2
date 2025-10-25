
USE WideWorldImporters;
GO
-- Procedure para el mdoulo de inventario


-- >>> Obtener los datos generales de todos los proveedores del sistema.

CREATE PROCEDURE sp_ObtenerInventario
    @NombreProducto VARCHAR(50) = NULL,
    @Grupo VARCHAR(50) = NULL,
	@CantidadMinima INT = NULL,
	@CantidadMaxima INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT DISTINCT
				
		ProductID,
		NombreProducto,
		--Grupo,
		STRING_AGG (Grupo, ' -- ') AS ListaGrupos,
		-- La fucion STRING_AGG es para concatenar elementos de una misma columna.
		-- Doc de la funcion: https://learn.microsoft.com/en-us/sql/t-sql/functions/string-agg-transact-sql?view=sql-server-ver17
		CantidadDisponible

	FROM view_Inventario
	WHERE (@NombreProducto IS NULL OR NombreProducto LIKE '%' + @NombreProducto + '%') -- Buscar que si no es nulo, de esa forma sabemos si activar el filtro o no.
    AND (@Grupo IS NULL OR Grupo LIKE '%' + @Grupo + '%')
	
	-- Rango de cantidades. 
	AND (@CantidadMinima IS NULL OR CantidadDisponible >= @CantidadMinima)
    AND (@CantidadMaxima IS NULL OR CantidadDisponible <= @CantidadMaxima)
	GROUP BY ProductID, NombreProducto, CantidadDisponible
	ORDER BY NombreProducto ASC;
END;
GO



-- >>> Obtener los datos de un producto especifico.
CREATE PROCEDURE sp_ObtenerProductoPorID
    @ProductID SMALLINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT DISTINCT *
    FROM view_Inventario
    WHERE ProductID = @ProductID;
END;
GO

-- Obtener la lista de grupos de un producto especifico.
CREATE PROCEDURE sp_ObtenerListaGruposPorProducto
    @ProductID SMALLINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM view_GruposProducto
    WHERE ProductID = @ProductID;
END;
GO