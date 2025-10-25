
USE WideWorldImporters;
GO;
-- Procedure para el mdoulo de clientes


-- >>> Obtener los datos generales de todos los clientes del sistema.

CREATE PROCEDURE sp_ObtenerClientes
    @NombreCliente VARCHAR(50) = NULL,
    @Categoria VARCHAR(50) = NULL,
	@MetodoEntrega VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
		
		ClienteID,
		NombreCliente,
		Categoria,
		MetodoDeEntrega

    FROM view_Clientes
	 WHERE (@NombreCliente IS NULL OR NombreCliente LIKE '%' + @NombreCliente + '%') -- Buscar que si no es nulo, de esa forma sabemos si activar el filtro o no.
     AND (@Categoria IS NULL OR Categoria = @Categoria)
	 AND (@MetodoEntrega IS NULL OR MetodoDeEntrega = @MetodoEntrega)
	ORDER BY NombreCliente ASC;

END;
GO


-- >>> Obtener los datos de un cliente especifico.
CREATE PROCEDURE sp_ObtenerClientePorID
    @ClienteID SMALLINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM view_Clientes
    WHERE ClienteID = @ClienteID;
END;
GO