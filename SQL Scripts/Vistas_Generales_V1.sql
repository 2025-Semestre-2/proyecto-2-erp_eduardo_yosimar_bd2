
-- Crear vistas para obtener datos generales.
USE WideWorldImporters;
GO

-- Para la categoria de los clientes
CREATE VIEW view_CategoriasClientes AS 
SELECT
	*
FROM CategoriasClientes; 
GO

-- Para los metodos de entrega.
CREATE VIEW view_MetodosDeEntrega AS 
SELECT
	*
FROM MetodosEntrega; 
GO

-- Para las categorias de los porveedores
CREATE VIEW view_CategoriasProveedores AS 
SELECT
	*
FROM CategoriasProveedores; 
GO


