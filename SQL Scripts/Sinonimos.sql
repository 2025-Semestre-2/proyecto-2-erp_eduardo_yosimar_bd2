
-- Se generan sinonimos para las tablas mas importantes

USE WideWorldImporters;
GO

-- Personas
CREATE SYNONYM Personas FOR Application.People;

-- Clientes
CREATE SYNONYM Clientes FOR Sales.Customers;
CREATE SYNONYM CategoriasClientes FOR Sales.CustomerCategories;

-- Proveedores
CREATE SYNONYM Proveedores FOR Purchasing.Suppliers;
CREATE SYNONYM CategoriasProveedores FOR Purchasing.SupplierCategories;


-- Productos e inventario
CREATE SYNONYM Productos FOR Warehouse.StockItems;
CREATE SYNONYM InventarioActual FOR Warehouse.StockItemHoldings;

-- Facturas
CREATE SYNONYM Facturas FOR Sales.Invoices;
CREATE SYNONYM DetalleFacturas FOR Sales.InvoiceLines;

-- Ordenes de compra
CREATE SYNONYM OrdenesCompra FOR Purchasing.PurchaseOrders;
CREATE SYNONYM DetalleOrdenesCompra FOR Purchasing.PurchaseOrderLines;

-- Metodos de entrega
CREATE SYNONYM MetodosEntrega FOR Application.DeliveryMethods;

-- Ciudades:
CREATE SYNONYM Ciudades FOR Application.Cities;


-- Personas
-- Clientes
-- CategoriasClientes
-- Proveedores
-- CategoriasProveedores
-- Productos
-- InventarioActual
-- Facturas
-- DetalleFacturas
-- OrdenesCompra
-- DetalleOrdenesCompra
-- MetodosEntrega
-- Ciudades