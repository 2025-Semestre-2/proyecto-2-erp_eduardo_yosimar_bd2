SELECT * 
INTO Warehouse.ColdRoomTemperatures_Stage
FROM WWI_Limon_V1.Warehouse.ColdRoomTemperatures;

SELECT * 
INTO Warehouse.Colors_Stage
FROM WWI_Limon_V1.Warehouse.Colors;


SELECT * 
INTO Warehouse.PackageTypes_Stage
FROM WWI_Limon_V1.Warehouse.PackageTypes;

SELECT * 
INTO Warehouse.StockGroups_Stage
FROM WWI_Limon_V1.Warehouse.StockGroups;

SELECT * 
INTO Warehouse.StockItemHoldings_Stage
FROM WWI_Limon_V1.Warehouse.StockItemHoldings;

SELECT * 
INTO Warehouse.StockItems_Stage
FROM WWI_Limon_V1.Warehouse.StockItems;


SELECT * 
INTO Warehouse.StockItemStockGroups_Stage
FROM WWI_Limon_V1.Warehouse.StockItemStockGroups;

SELECT * 
INTO Warehouse.StockItemTransactions_Stage
FROM WWI_Limon_V1.Warehouse.StockItemTransactions;

SELECT * 
INTO Warehouse.VehicleTemperatures_Stage
FROM WWI_Limon_V1.Warehouse.VehicleTemperatures;

--SELECT * 
--INTO Warehouse.StockItemStockGroups_Stage
--FROM WideWorldImporters.Warehouse.StockItemStockGroups;
