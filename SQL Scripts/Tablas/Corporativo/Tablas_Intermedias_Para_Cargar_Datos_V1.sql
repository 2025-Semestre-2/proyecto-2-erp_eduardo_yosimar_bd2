-- >> Aplication.

SELECT * 
INTO Application.Cities_Stage
FROM WideWorldImporters.Application.Cities;

SELECT * 
INTO Application.Countries_Stage
FROM WideWorldImporters.Application.Countries;

SELECT * 
INTO Application.DeliveryMethods_Stage
FROM WideWorldImporters.Application.DeliveryMethods;

SELECT * 
INTO Application.PaymentMethods_Stage
FROM WideWorldImporters.Application.PaymentMethods;

SELECT * 
INTO Application.People_Stage
FROM WideWorldImporters.Application.People;

SELECT * 
INTO Application.StateProvinces_Stage
FROM WideWorldImporters.Application.StateProvinces;

SELECT * 
INTO Application.SystemParameters_Stage
FROM WideWorldImporters.Application.SystemParameters;

SELECT * 
INTO Application.TransactionTypes_Stage
FROM WideWorldImporters.Application.TransactionTypes;


-- >> Purchasing:
SELECT * 
INTO Purchasing.PurchaseOrderLines_Stage
FROM WideWorldImporters.Purchasing.PurchaseOrderLines;

SELECT * 
INTO Purchasing.PurchaseOrders_Stage
FROM WideWorldImporters.Purchasing.PurchaseOrders;

SELECT * 
INTO Purchasing.SupplierCategories_Stage
FROM WideWorldImporters.Purchasing.SupplierCategories;

SELECT * 
INTO Purchasing.Suppliers_Stage
FROM WideWorldImporters.Purchasing.Suppliers;

SELECT * 
INTO Purchasing.SupplierTransactions_Stage
FROM WideWorldImporters.Purchasing.SupplierTransactions;

SELECT * 
INTO Sales.BuyingGroups_Stage
FROM WideWorldImporters.Sales.BuyingGroups;

SELECT * 
INTO Sales.CustomerCategories_Stage
FROM WideWorldImporters.Sales.CustomerCategories;

SELECT * 
INTO Sales.Customers_Stage
FROM WideWorldImporters.Sales.Customers;

SELECT * 
INTO Sales.ClientesDatosSensibles_Stage
FROM WideWorldImporters.Sales.ClientesDatosSensibles;

SELECT * 
INTO Sales.CustomerTransactions_Stage
FROM WideWorldImporters.Sales.CustomerTransactions;

SELECT * 
INTO Sales.InvoiceLines_Stage
FROM WideWorldImporters.Sales.InvoiceLines;

SELECT * 
INTO Sales.Invoices_Stage
FROM WideWorldImporters.Sales.Invoices;

SELECT * 
INTO Sales.OrderLines_Stage
FROM WideWorldImporters.Sales.OrderLines;

SELECT * 
INTO Sales.Orders_Stage
FROM WideWorldImporters.Sales.Orders;

SELECT * 
INTO Sales.SpecialDeals_Stage
FROM WideWorldImporters.Sales.SpecialDeals;


-- >> Wherehouse 

SELECT * 
INTO Warehouse.ColdRoomTemperatures_Stage
FROM WideWorldImporters.Warehouse.ColdRoomTemperatures;

SELECT * 
INTO Warehouse.Colors_Stage
FROM WideWorldImporters.Warehouse.Colors;

SELECT * 
INTO Warehouse.PackageTypes_Stage
FROM WideWorldImporters.Warehouse.PackageTypes;

SELECT * 
INTO Warehouse.StockGroups_Stage
FROM WideWorldImporters.Warehouse.StockGroups;

SELECT * 
INTO Warehouse.StockItemHoldings_Stage
FROM WideWorldImporters.Warehouse.StockItemHoldings;

SELECT * 
INTO Warehouse.StockItems_Stage
FROM WideWorldImporters.Warehouse.StockItems;

SELECT * 
INTO Warehouse.StockItemStockGroups_Stage
FROM WideWorldImporters.Warehouse.StockItemStockGroups;

SELECT * 
INTO Warehouse.StockItemTransactions_Stage
FROM WideWorldImporters.Warehouse.StockItemTransactions;

SELECT * 
INTO Warehouse.VehicleTemperatures_Stage
FROM WideWorldImporters.Warehouse.VehicleTemperatures;

--SELECT * 
--INTO Warehouse.StockItemStockGroups_Stage
--FROM WideWorldImporters.Warehouse.StockItemStockGroups;
