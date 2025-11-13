-- Tabla de Cities.

ALTER TABLE [Application].[Cities] WITH CHECK ADD CONSTRAINT [FK_Cities_People]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);

ALTER TABLE [Application].[Cities] WITH CHECK ADD CONSTRAINT [FK_Cities_StateProvince]
FOREIGN KEY ([StateProvinceID]) REFERENCES [Application].[StateProvinces] ([StateProvinceID]);


-- Countries:
ALTER TABLE [Application].[Countries] WITH CHECK ADD CONSTRAINT [FK_Countries_People]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);


-- DeliveryMethods:
ALTER TABLE [Application].[DeliveryMethods] WITH CHECK ADD CONSTRAINT [FK_DeliveryMethods_People]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);


-- PaymentMethods:
ALTER TABLE [Application].[PaymentMethods] WITH CHECK ADD CONSTRAINT [FK_PaymentMethods_People]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);

--  People:
ALTER TABLE [Application].[People] WITH CHECK ADD CONSTRAINT [FK_People_LastEditedBy]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);


-- StateProvinces:
-- FK hacia People
ALTER TABLE [Application].[StateProvinces] WITH CHECK ADD CONSTRAINT [FK_StateProvinces_People]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia Countries
ALTER TABLE [Application].[StateProvinces] WITH CHECK ADD CONSTRAINT [FK_StateProvinces_Countries]
FOREIGN KEY ([CountryID]) REFERENCES [Application].[Countries] ([CountryID]);


-- SystemParameters:
-- FK hacia People
ALTER TABLE [Application].[SystemParameters] WITH CHECK ADD CONSTRAINT [FK_SystemParameters_People]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia Cities (DeliveryCityID)
ALTER TABLE [Application].[SystemParameters] WITH CHECK ADD CONSTRAINT [FK_SystemParameters_DeliveryCity]
FOREIGN KEY ([DeliveryCityID]) REFERENCES [Application].[Cities] ([CityID]);

-- FK hacia Cities (PostalCityID)
ALTER TABLE [Application].[SystemParameters] WITH CHECK ADD CONSTRAINT [FK_SystemParameters_PostalCity]
FOREIGN KEY ([PostalCityID]) REFERENCES [Application].[Cities] ([CityID]);


-- >> TransactionTypes
-- FK hacias People
ALTER TABLE [Application].[TransactionTypes] WITH CHECK ADD CONSTRAINT [FK_TransactionTypes_People]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);


-- >> PurchaseOrderLines
-- FK hacia People
ALTER TABLE [Purchasing].[PurchaseOrderLines] WITH CHECK ADD CONSTRAINT [FK_PurchaseOrderLines_People]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia PackageTypes
ALTER TABLE [Purchasing].[PurchaseOrderLines] WITH CHECK ADD CONSTRAINT [FK_PurchaseOrderLines_PackageTypes]
FOREIGN KEY ([PackageTypeID]) REFERENCES [Warehouse].[PackageTypes] ([PackageTypeID]);

-- FK hacia PurchaseOrders
ALTER TABLE [Purchasing].[PurchaseOrderLines] WITH CHECK ADD CONSTRAINT [FK_PurchaseOrderLines_PurchaseOrders]
FOREIGN KEY ([PurchaseOrderID]) REFERENCES [Purchasing].[PurchaseOrders] ([PurchaseOrderID]);

-- FK hacia StockItems
ALTER TABLE [Purchasing].[PurchaseOrderLines] WITH CHECK ADD CONSTRAINT [FK_PurchaseOrderLines_StockItems]
FOREIGN KEY ([StockItemID]) REFERENCES [Warehouse].[StockItems] ([StockItemID]);


-- >> PurchaseOrders
-- FK hacia People (LastEditedBy)
ALTER TABLE [Purchasing].[PurchaseOrders] WITH CHECK ADD CONSTRAINT [FK_PurchaseOrders_People_LastEditedBy]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia People (ContactPersonID)
ALTER TABLE [Purchasing].[PurchaseOrders] WITH CHECK ADD CONSTRAINT [FK_PurchaseOrders_People_ContactPerson]
FOREIGN KEY ([ContactPersonID]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia DeliveryMethods
ALTER TABLE [Purchasing].[PurchaseOrders] WITH CHECK ADD CONSTRAINT [FK_PurchaseOrders_DeliveryMethods]
FOREIGN KEY ([DeliveryMethodID]) REFERENCES [Application].[DeliveryMethods] ([DeliveryMethodID]);

-- FK hacia Suppliers
ALTER TABLE [Purchasing].[PurchaseOrders] WITH CHECK ADD CONSTRAINT [FK_PurchaseOrders_Suppliers]
FOREIGN KEY ([SupplierID]) REFERENCES [Purchasing].[Suppliers] ([SupplierID]);


-- >> Suppliers
-- FK hacia People (AlternateContactPersonID)
ALTER TABLE [Purchasing].[Suppliers] WITH CHECK ADD CONSTRAINT [FK_Suppliers_AlternateContactPerson]
FOREIGN KEY ([AlternateContactPersonID]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia People (LastEditedBy)
ALTER TABLE [Purchasing].[Suppliers] WITH CHECK ADD CONSTRAINT [FK_Suppliers_LastEditedBy]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia Cities (DeliveryCityID)
ALTER TABLE [Purchasing].[Suppliers] WITH CHECK ADD CONSTRAINT [FK_Suppliers_DeliveryCity]
FOREIGN KEY ([DeliveryCityID]) REFERENCES [Application].[Cities] ([CityID]);

-- FK hacia DeliveryMethods
ALTER TABLE [Purchasing].[Suppliers] WITH CHECK ADD CONSTRAINT [FK_Suppliers_DeliveryMethods]
FOREIGN KEY ([DeliveryMethodID]) REFERENCES [Application].[DeliveryMethods] ([DeliveryMethodID]);

-- FK hacia Cities (PostalCityID)
ALTER TABLE [Purchasing].[Suppliers] WITH CHECK ADD CONSTRAINT [FK_Suppliers_PostalCity]
FOREIGN KEY ([PostalCityID]) REFERENCES [Application].[Cities] ([CityID]);

-- FK hacia People (PrimaryContactPersonID)
ALTER TABLE [Purchasing].[Suppliers] WITH CHECK ADD CONSTRAINT [FK_Suppliers_PrimaryContactPerson]
FOREIGN KEY ([PrimaryContactPersonID]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia SupplierCategories
ALTER TABLE [Purchasing].[Suppliers] WITH CHECK ADD CONSTRAINT [FK_Suppliers_SupplierCategories]
FOREIGN KEY ([SupplierCategoryID]) REFERENCES [Purchasing].[SupplierCategories] ([SupplierCategoryID]);


-- >> SupplierTransactions
-- FK hacia People
ALTER TABLE [Purchasing].[SupplierTransactions] WITH CHECK ADD CONSTRAINT [FK_SupplierTransactions_People]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia PaymentMethods
ALTER TABLE [Purchasing].[SupplierTransactions] WITH CHECK ADD CONSTRAINT [FK_SupplierTransactions_PaymentMethods]
FOREIGN KEY ([PaymentMethodID]) REFERENCES [Application].[PaymentMethods] ([PaymentMethodID]);

-- FK hacia PurchaseOrders
ALTER TABLE [Purchasing].[SupplierTransactions] WITH CHECK ADD CONSTRAINT [FK_SupplierTransactions_PurchaseOrders]
FOREIGN KEY ([PurchaseOrderID]) REFERENCES [Purchasing].[PurchaseOrders] ([PurchaseOrderID]);

-- FK hacia Suppliers
ALTER TABLE [Purchasing].[SupplierTransactions] WITH CHECK ADD CONSTRAINT [FK_SupplierTransactions_Suppliers]
FOREIGN KEY ([SupplierID]) REFERENCES [Purchasing].[Suppliers] ([SupplierID]);

-- FK hacia TransactionTypes
ALTER TABLE [Purchasing].[SupplierTransactions] WITH CHECK ADD CONSTRAINT [FK_SupplierTransactions_TransactionTypes]
FOREIGN KEY ([TransactionTypeID]) REFERENCES [Application].[TransactionTypes] ([TransactionTypeID]);


-- >> BuyingGroups
ALTER TABLE [Sales].[BuyingGroups] WITH CHECK ADD CONSTRAINT [FK_BuyingGroups_People]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);

-- >> CustomerCategories
ALTER TABLE [Sales].[CustomerCategories] WITH CHECK ADD CONSTRAINT [FK_CustomerCategories_People]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);



-- >> Customer:
-- FK autoreferencial (BillToCustomerID)
ALTER TABLE [Sales].[Customers] WITH CHECK ADD CONSTRAINT [FK_Customers_BillToCustomer]
FOREIGN KEY ([BillToCustomerID]) REFERENCES [Sales].[Customers] ([CustomerID]);

-- FK hacia CustomerCategories
ALTER TABLE [Sales].[Customers] WITH CHECK ADD CONSTRAINT [FK_Customers_CustomerCategories]
FOREIGN KEY ([CustomerCategoryID]) REFERENCES [Sales].[CustomerCategories] ([CustomerCategoryID]);

-- FK hacia BuyingGroups
ALTER TABLE [Sales].[Customers] WITH CHECK ADD CONSTRAINT [FK_Customers_BuyingGroups]
FOREIGN KEY ([BuyingGroupID]) REFERENCES [Sales].[BuyingGroups] ([BuyingGroupID]);

-- FK hacia People (PrimaryContactPersonID)
ALTER TABLE [Sales].[Customers] WITH CHECK ADD CONSTRAINT [FK_Customers_PrimaryContactPerson]
FOREIGN KEY ([PrimaryContactPersonID]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia People (AlternateContactPersonID)
ALTER TABLE [Sales].[Customers] WITH CHECK ADD CONSTRAINT [FK_Customers_AlternateContactPerson]
FOREIGN KEY ([AlternateContactPersonID]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia People (LastEditedBy)
ALTER TABLE [Sales].[Customers] WITH CHECK ADD CONSTRAINT [FK_Customers_LastEditedBy]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia DeliveryMethods
ALTER TABLE [Sales].[Customers] WITH CHECK ADD CONSTRAINT [FK_Customers_DeliveryMethods]
FOREIGN KEY ([DeliveryMethodID]) REFERENCES [Application].[DeliveryMethods] ([DeliveryMethodID]);

-- FK hacia Cities (DeliveryCityID)
ALTER TABLE [Sales].[Customers] WITH CHECK ADD CONSTRAINT [FK_Customers_DeliveryCity]
FOREIGN KEY ([DeliveryCityID]) REFERENCES [Application].[Cities] ([CityID]);

-- FK hacia Cities (PostalCityID)
ALTER TABLE [Sales].[Customers] WITH CHECK ADD CONSTRAINT [FK_Customers_PostalCity]
FOREIGN KEY ([PostalCityID]) REFERENCES [Application].[Cities] ([CityID]);



-- >> CustomerTransactions
-- FK hacia People
ALTER TABLE [Sales].[CustomerTransactions] WITH CHECK ADD CONSTRAINT [FK_CustomerTransactions_People]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia Customers
ALTER TABLE [Sales].[CustomerTransactions] WITH CHECK ADD CONSTRAINT [FK_CustomerTransactions_Customers]
FOREIGN KEY ([CustomerID]) REFERENCES [Sales].[Customers] ([CustomerID]);

-- FK hacia Invoices
ALTER TABLE [Sales].[CustomerTransactions] WITH CHECK ADD CONSTRAINT [FK_CustomerTransactions_Invoices]
FOREIGN KEY ([InvoiceID]) REFERENCES [Sales].[Invoices] ([InvoiceID]);

-- FK hacia PaymentMethods
ALTER TABLE [Sales].[CustomerTransactions] WITH CHECK ADD CONSTRAINT [FK_CustomerTransactions_PaymentMethods]
FOREIGN KEY ([PaymentMethodID]) REFERENCES [Application].[PaymentMethods] ([PaymentMethodID]);

-- FK hacia TransactionTypes
ALTER TABLE [Sales].[CustomerTransactions] WITH CHECK ADD CONSTRAINT [FK_CustomerTransactions_TransactionTypes]
FOREIGN KEY ([TransactionTypeID]) REFERENCES [Application].[TransactionTypes] ([TransactionTypeID]);



-- >> Invoices
-- FK hacia People (AccountsPersonID)
ALTER TABLE [Sales].[Invoices] WITH CHECK ADD CONSTRAINT [FK_Invoices_AccountsPerson]
FOREIGN KEY ([AccountsPersonID]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia People (LastEditedBy)
ALTER TABLE [Sales].[Invoices] WITH CHECK ADD CONSTRAINT [FK_Invoices_LastEditedBy]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia Customers (BillToCustomerID)
ALTER TABLE [Sales].[Invoices] WITH CHECK ADD CONSTRAINT [FK_Invoices_BillToCustomer]
FOREIGN KEY ([BillToCustomerID]) REFERENCES [Sales].[Customers] ([CustomerID]);

-- FK hacia People (ContactPersonID)
ALTER TABLE [Sales].[Invoices] WITH CHECK ADD CONSTRAINT [FK_Invoices_ContactPerson]
FOREIGN KEY ([ContactPersonID]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia Customers (CustomerID)
ALTER TABLE [Sales].[Invoices] WITH CHECK ADD CONSTRAINT [FK_Invoices_Customer]
FOREIGN KEY ([CustomerID]) REFERENCES [Sales].[Customers] ([CustomerID]);

-- FK hacia DeliveryMethods
ALTER TABLE [Sales].[Invoices] WITH CHECK ADD CONSTRAINT [FK_Invoices_DeliveryMethods]
FOREIGN KEY ([DeliveryMethodID]) REFERENCES [Application].[DeliveryMethods] ([DeliveryMethodID]);

-- FK hacia Orders
ALTER TABLE [Sales].[Invoices] WITH CHECK ADD CONSTRAINT [FK_Invoices_Orders]
FOREIGN KEY ([OrderID]) REFERENCES [Sales].[Orders] ([OrderID]);

-- FK hacia People (PackedByPersonID)
ALTER TABLE [Sales].[Invoices] WITH CHECK ADD CONSTRAINT [FK_Invoices_PackedByPerson]
FOREIGN KEY ([PackedByPersonID]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia People (SalespersonPersonID)
ALTER TABLE [Sales].[Invoices] WITH CHECK ADD CONSTRAINT [FK_Invoices_SalespersonPerson]
FOREIGN KEY ([SalespersonPersonID]) REFERENCES [Application].[People] ([PersonID]);



-- >> OrderLines
-- FK hacia People (LastEditedBy)
ALTER TABLE [Sales].[OrderLines] WITH CHECK ADD CONSTRAINT [FK_OrderLines_LastEditedBy]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia Orders
ALTER TABLE [Sales].[OrderLines] WITH CHECK ADD CONSTRAINT [FK_OrderLines_Orders]
FOREIGN KEY ([OrderID]) REFERENCES [Sales].[Orders] ([OrderID]);

-- FK hacia PackageTypes
ALTER TABLE [Sales].[OrderLines] WITH CHECK ADD CONSTRAINT [FK_OrderLines_PackageTypes]
FOREIGN KEY ([PackageTypeID]) REFERENCES [Warehouse].[PackageTypes] ([PackageTypeID]);

-- FK hacia StockItems
ALTER TABLE [Sales].[OrderLines] WITH CHECK ADD CONSTRAINT [FK_OrderLines_StockItems]
FOREIGN KEY ([StockItemID]) REFERENCES [Warehouse].[StockItems] ([StockItemID]);


-- >> Orders
-- FK autoreferencial (BackorderOrderID)
ALTER TABLE [Sales].[Orders] WITH CHECK ADD CONSTRAINT [FK_Orders_BackorderOrder]
FOREIGN KEY ([BackorderOrderID]) REFERENCES [Sales].[Orders] ([OrderID]);

-- FK hacia People (LastEditedBy)
ALTER TABLE [Sales].[Orders] WITH CHECK ADD CONSTRAINT [FK_Orders_LastEditedBy]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia People (ContactPersonID)
ALTER TABLE [Sales].[Orders] WITH CHECK ADD CONSTRAINT [FK_Orders_ContactPerson]
FOREIGN KEY ([ContactPersonID]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia Customers
ALTER TABLE [Sales].[Orders] WITH CHECK ADD CONSTRAINT [FK_Orders_Customers]
FOREIGN KEY ([CustomerID]) REFERENCES [Sales].[Customers] ([CustomerID]);

-- FK hacia People (PickedByPersonID)
ALTER TABLE [Sales].[Orders] WITH CHECK ADD CONSTRAINT [FK_Orders_PickedByPerson]
FOREIGN KEY ([PickedByPersonID]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia People (SalespersonPersonID)
ALTER TABLE [Sales].[Orders] WITH CHECK ADD CONSTRAINT [FK_Orders_SalespersonPerson]
FOREIGN KEY ([SalespersonPersonID]) REFERENCES [Application].[People] ([PersonID]);



-- >> SpecialDeals
-- FK hacia People (LastEditedBy)
ALTER TABLE [Sales].[SpecialDeals] WITH CHECK ADD CONSTRAINT [FK_SpecialDeals_LastEditedBy]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia BuyingGroups
ALTER TABLE [Sales].[SpecialDeals] WITH CHECK ADD CONSTRAINT [FK_SpecialDeals_BuyingGroups]
FOREIGN KEY ([BuyingGroupID]) REFERENCES [Sales].[BuyingGroups] ([BuyingGroupID]);

-- FK hacia CustomerCategories
ALTER TABLE [Sales].[SpecialDeals] WITH CHECK ADD CONSTRAINT [FK_SpecialDeals_CustomerCategories]
FOREIGN KEY ([CustomerCategoryID]) REFERENCES [Sales].[CustomerCategories] ([CustomerCategoryID]);

-- FK hacia Customers
ALTER TABLE [Sales].[SpecialDeals] WITH CHECK ADD CONSTRAINT [FK_SpecialDeals_Customers]
FOREIGN KEY ([CustomerID]) REFERENCES [Sales].[Customers] ([CustomerID]);

-- FK hacia StockGroups
ALTER TABLE [Sales].[SpecialDeals] WITH CHECK ADD CONSTRAINT [FK_SpecialDeals_StockGroups]
FOREIGN KEY ([StockGroupID]) REFERENCES [Warehouse].[StockGroups] ([StockGroupID]);

-- FK hacia StockItems
ALTER TABLE [Sales].[SpecialDeals] WITH CHECK ADD CONSTRAINT [FK_SpecialDeals_StockItems]
FOREIGN KEY ([StockItemID]) REFERENCES [Warehouse].[StockItems] ([StockItemID]);

-- >> Colors
ALTER TABLE [Warehouse].[Colors] WITH CHECK ADD CONSTRAINT [FK_Colors_LastEditedBy]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);

-- >> PackageTypes
ALTER TABLE [Warehouse].[PackageTypes] WITH CHECK ADD CONSTRAINT [FK_PackageTypes_LastEditedBy]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);


-- >> StockGroups
ALTER TABLE [Warehouse].[StockGroups] WITH CHECK ADD CONSTRAINT [FK_StockGroups_LastEditedBy]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);


-- >> StockItemHoldings
-- FK hacia People (LastEditedBy)
ALTER TABLE [Warehouse].[StockItemHoldings] WITH CHECK ADD CONSTRAINT [FK_StockItemHoldings_LastEditedBy]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia StockItems (StockItemID)
ALTER TABLE [Warehouse].[StockItemHoldings] WITH CHECK ADD CONSTRAINT [FK_StockItemHoldings_StockItems]
FOREIGN KEY ([StockItemID]) REFERENCES [Warehouse].[StockItems] ([StockItemID]);


-- >> StockItems
-- FK hacia People (LastEditedBy)
ALTER TABLE [Warehouse].[StockItems] WITH CHECK ADD CONSTRAINT [FK_StockItems_LastEditedBy]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia Colors
ALTER TABLE [Warehouse].[StockItems] WITH CHECK ADD CONSTRAINT [FK_StockItems_Colors]
FOREIGN KEY ([ColorID]) REFERENCES [Warehouse].[Colors] ([ColorID]);

-- FK hacia PackageTypes (OuterPackageID)
ALTER TABLE [Warehouse].[StockItems] WITH CHECK ADD CONSTRAINT [FK_StockItems_OuterPackage]
FOREIGN KEY ([OuterPackageID]) REFERENCES [Warehouse].[PackageTypes] ([PackageTypeID]);

-- FK hacia Suppliers
ALTER TABLE [Warehouse].[StockItems] WITH CHECK ADD CONSTRAINT [FK_StockItems_Suppliers]
FOREIGN KEY ([SupplierID]) REFERENCES [Purchasing].[Suppliers] ([SupplierID]);

-- FK hacia PackageTypes (UnitPackageID)
ALTER TABLE [Warehouse].[StockItems] WITH CHECK ADD CONSTRAINT [FK_StockItems_UnitPackage]
FOREIGN KEY ([UnitPackageID]) REFERENCES [Warehouse].[PackageTypes] ([PackageTypeID]);


-- >> StockItemStockGroups
-- FK hacia People (LastEditedBy)
ALTER TABLE [Warehouse].[StockItemStockGroups] WITH CHECK ADD CONSTRAINT [FK_StockItemStockGroups_LastEditedBy]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia StockGroups
ALTER TABLE [Warehouse].[StockItemStockGroups] WITH CHECK ADD CONSTRAINT [FK_StockItemStockGroups_StockGroups]
FOREIGN KEY ([StockGroupID]) REFERENCES [Warehouse].[StockGroups] ([StockGroupID]);

-- FK hacia StockItems
ALTER TABLE [Warehouse].[StockItemStockGroups] WITH CHECK ADD CONSTRAINT [FK_StockItemStockGroups_StockItems]
FOREIGN KEY ([StockItemID]) REFERENCES [Warehouse].[StockItems] ([StockItemID]);


-->> StockItemTransactions
-- FK hacia People (LastEditedBy)
ALTER TABLE [Warehouse].[StockItemTransactions] WITH CHECK ADD CONSTRAINT [FK_StockItemTransactions_LastEditedBy]
FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]);

-- FK hacia Customers
ALTER TABLE [Warehouse].[StockItemTransactions] WITH CHECK ADD CONSTRAINT [FK_StockItemTransactions_Customers]
FOREIGN KEY ([CustomerID]) REFERENCES [Sales].[Customers] ([CustomerID]);

-- FK hacia Invoices
ALTER TABLE [Warehouse].[StockItemTransactions] WITH CHECK ADD CONSTRAINT [FK_StockItemTransactions_Invoices]
FOREIGN KEY ([InvoiceID]) REFERENCES [Sales].[Invoices] ([InvoiceID]);

-- FK hacia PurchaseOrders
ALTER TABLE [Warehouse].[StockItemTransactions] WITH CHECK ADD CONSTRAINT [FK_StockItemTransactions_PurchaseOrders]
FOREIGN KEY ([PurchaseOrderID]) REFERENCES [Purchasing].[PurchaseOrders] ([PurchaseOrderID]);

-- FK hacia StockItems
ALTER TABLE [Warehouse].[StockItemTransactions] WITH CHECK ADD CONSTRAINT [FK_StockItemTransactions_StockItems]
FOREIGN KEY ([StockItemID]) REFERENCES [Warehouse].[StockItems] ([StockItemID]);

-- FK hacia Suppliers
ALTER TABLE [Warehouse].[StockItemTransactions] WITH CHECK ADD CONSTRAINT [FK_StockItemTransactions_Suppliers]
FOREIGN KEY ([SupplierID]) REFERENCES [Purchasing].[Suppliers] ([SupplierID]);

-- FK hacia TransactionTypes
ALTER TABLE [Warehouse].[StockItemTransactions] WITH CHECK ADD CONSTRAINT [FK_StockItemTransactions_TransactionTypes]
FOREIGN KEY ([TransactionTypeID]) REFERENCES [Application].[TransactionTypes] ([TransactionTypeID]);
