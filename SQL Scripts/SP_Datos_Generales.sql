
USE WideWorldImporters;
GO

-- Obtener las categorias de los clientes
CREATE PROCEDURE sp_ObtenerCategoriasClientes
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
		CC.CustomerCategoryID,
		CC.CustomerCategoryName
    FROM view_CategoriasClientes CC;
END;
GO

-- Obtener las categoras de los proveedores
CREATE PROCEDURE sp_ObtenerCategoriasProveedores
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
		CC.SupplierCategoryID,
		CC.SupplierCategoryName
    FROM view_CategoriasProveedores CC;
END;
GO

-- Obtener los metodos de entrega
CREATE PROCEDURE sp_ObtenerMetodosEntrega
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
		CC.DeliveryMethodID,
		CC.DeliveryMethodName
    FROM MetodosEntrega CC;
END;
GO