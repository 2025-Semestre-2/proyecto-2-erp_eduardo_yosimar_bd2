-- Aqui van a ir la creacion base de las tablas 

create database WWI_Sucursal_Limon;
go 

-- create database WWI_Sucursal_San_Jose;
-- go 

use WWI_Sucursal_Limon;
go

-- use WWI_Sucursal_San_Jose;
-- go


-- Tabla de usuarios para los del sistema 
CREATE TABLE Usuarios (
  iduser INT IDENTITY(1,1) PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  password_hash VARCHAR(255) NOT NULL, -- Pendiente a revisar
  fullname VARCHAR(100) NOT NULL,
  active BIT NOT NULL DEFAULT 1,
  rol VARCHAR(20) CHECK (rol IN ('Administrador', 'Corporativo')) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  hiredate DATETIME DEFAULT GETDATE(),
  sucursal VARCHAR(20) CHECK (sucursal IN ('SanJose', 'Limon', 'Corporativo')) NOT NULL
);
GO


-- Tabla de Cities.
CREATE TABLE [Application].[Cities] (
  [CityID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [CityName] NVARCHAR(50) NOT NULL,
  [StateProvinceID] INT NOT NULL,
  [Location] GEOGRAPHY NULL,
  [LatestRecordedPopulation] BIGINT NULL,
  [LastEditedBy] INT NOT NULL
);


-- Tabla Countries:
CREATE TABLE [Application].[Countries] (
  [CountryID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [CountryName] NVARCHAR(60) NOT NULL,
  [FormalName] NVARCHAR(60) NOT NULL,
  [IsoAlpha3Code] NVARCHAR(3) NULL,
  [IsoNumericCode] INT NULL,
  [CountryType] NVARCHAR(20) NULL,
  [LatestRecordedPopulation] BIGINT NULL,
  [Continent] NVARCHAR(30) NOT NULL,
  [Region] NVARCHAR(30) NOT NULL,
  [Subregion] NVARCHAR(30) NOT NULL,
  [Border] GEOGRAPHY NULL,
  [LastEditedBy] INT NOT NULL
);

-- DeliveryMethods:

CREATE TABLE [Application].[DeliveryMethods] (
  [DeliveryMethodID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [DeliveryMethodName] NVARCHAR(50) NOT NULL,
  [LastEditedBy] INT NOT NULL
);

-- PaymentMethods:
CREATE TABLE [Application].[PaymentMethods] (
  [PaymentMethodID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [PaymentMethodName] NVARCHAR(50) NOT NULL,
  [LastEditedBy] INT NOT NULL
);

-- People:
CREATE TABLE [Application].[People] (
  [PersonID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [FullName] NVARCHAR(50) NOT NULL,
  [PreferredName] NVARCHAR(50) NOT NULL,
  -- Aqui borramos varias columnas.
  [IsPermittedToLogon] BIT NOT NULL,
  [LogonName] NVARCHAR(50) NULL,
  [IsExternalLogonProvider] BIT NOT NULL,
  [HashedPassword] VARBINARY(MAX) NULL,
  [IsSystemUser] BIT NOT NULL,
  [IsEmployee] BIT NOT NULL,
  [IsSalesperson] BIT NOT NULL,
  [UserPreferences] NVARCHAR(MAX) NULL,
  [PhoneNumber] NVARCHAR(20) NULL,
  [FaxNumber] NVARCHAR(20) NULL,
  [EmailAddress] NVARCHAR(256) NULL,
  [Photo] VARBINARY(MAX) NULL,
  [CustomFields] NVARCHAR(MAX) NULL,
  [LastEditedBy] INT NOT NULL
);


-- StateProvinces:
CREATE TABLE [Application].[StateProvinces] (
  [StateProvinceID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [StateProvinceCode] NVARCHAR(5) NOT NULL,
  [StateProvinceName] NVARCHAR(50) NOT NULL,
  [CountryID] INT NOT NULL,
  [SalesTerritory] NVARCHAR(50) NOT NULL,
  [Border] GEOGRAPHY NULL,
  [LatestRecordedPopulation] BIGINT NULL,
  [LastEditedBy] INT NOT NULL
);


-- SystemParameters:
CREATE TABLE [Application].[SystemParameters] (
  [SystemParameterID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [DeliveryAddressLine1] NVARCHAR(60) NOT NULL,
  [DeliveryAddressLine2] NVARCHAR(60) NULL,
  [DeliveryCityID] INT NOT NULL,
  [DeliveryPostalCode] NVARCHAR(10) NOT NULL,
  [DeliveryLocation] GEOGRAPHY NOT NULL,
  [PostalAddressLine1] NVARCHAR(60) NOT NULL,
  [PostalAddressLine2] NVARCHAR(60) NULL,
  [PostalCityID] INT NOT NULL,
  [PostalPostalCode] NVARCHAR(10) NOT NULL,
  [ApplicationSettings] NVARCHAR(MAX) NOT NULL,
  [LastEditedBy] INT NOT NULL
  -- ,  [LastEditedWhen] DATETIME2(7) NOT NULL DEFAULT (sysdatetime())
);

-- TransactionTypes
CREATE TABLE [Application].[TransactionTypes] (
  [TransactionTypeID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [TransactionTypeName] NVARCHAR(50) NOT NULL,
  [LastEditedBy] INT NOT NULL
);

-- PurchaseOrderLines
CREATE TABLE [Purchasing].[PurchaseOrderLines] (
  [PurchaseOrderLineID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [PurchaseOrderID] INT NOT NULL,
  [StockItemID] INT NOT NULL,
  [OrderedOuters] INT NOT NULL,
  [Description] NVARCHAR(100) NOT NULL,
  [ReceivedOuters] INT NOT NULL,
  [PackageTypeID] INT NOT NULL,
  [ExpectedUnitPricePerOuter] DECIMAL(18,2) NULL,
  [LastReceiptDate] DATE NULL,
  [IsOrderLineFinalized] BIT NOT NULL,
  [LastEditedBy] INT NOT NULL
  -- ,  [LastEditedWhen] DATETIME2(7) NOT NULL DEFAULT (sysdatetime())
);


CREATE TABLE [Purchasing].[PurchaseOrders] (
  [PurchaseOrderID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [SupplierID] INT NOT NULL,
  [OrderDate] DATE NOT NULL,
  [DeliveryMethodID] INT NOT NULL,
  [ContactPersonID] INT NOT NULL,
  [ExpectedDeliveryDate] DATE NULL,
  [SupplierReference] NVARCHAR(20) NULL,
  [IsOrderFinalized] BIT NOT NULL,
  [Comments] NVARCHAR(MAX) NULL,
  [InternalComments] NVARCHAR(MAX) NULL,
  [LastEditedBy] INT NOT NULL
  -- ,  [LastEditedWhen] DATETIME2(7) NOT NULL DEFAULT (sysdatetime())
);


-- SupplierCategories
CREATE TABLE [Purchasing].[SupplierCategories] (
  [SupplierCategoryID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [SupplierCategoryName] NVARCHAR(50) NOT NULL,
  [LastEditedBy] INT NOT NULL,
  CONSTRAINT [UQ_Purchasing_SupplierCategories_SupplierCategoryName] UNIQUE ([SupplierCategoryName])
);

-- Suppliers
CREATE TABLE [Purchasing].[Suppliers] (
  [SupplierID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [SupplierName] NVARCHAR(100) NOT NULL,
  [SupplierCategoryID] INT NOT NULL,
  [PrimaryContactPersonID] INT NOT NULL,
  [AlternateContactPersonID] INT NOT NULL,
  [DeliveryMethodID] INT NULL,
  [DeliveryCityID] INT NOT NULL,
  [PostalCityID] INT NOT NULL,
  [SupplierReference] NVARCHAR(20) NULL,
  [BankAccountName] NVARCHAR(50) NULL,
  [BankAccountBranch] NVARCHAR(50) NULL,
  [BankAccountCode] NVARCHAR(20) NULL,
  [BankAccountNumber] NVARCHAR(20) NULL,
  [BankInternationalCode] NVARCHAR(20) NULL,
  [PaymentDays] INT NOT NULL,
  [InternalComments] NVARCHAR(MAX) NULL,
  [PhoneNumber] NVARCHAR(20) NOT NULL,
  [FaxNumber] NVARCHAR(20) NOT NULL,
  [WebsiteURL] NVARCHAR(256) NOT NULL,
  [DeliveryAddressLine1] NVARCHAR(60) NOT NULL,
  [DeliveryAddressLine2] NVARCHAR(60) NULL,
  [DeliveryPostalCode] NVARCHAR(10) NOT NULL,
  [DeliveryLocation] GEOGRAPHY NULL,
  [PostalAddressLine1] NVARCHAR(60) NOT NULL,
  [PostalAddressLine2] NVARCHAR(60) NULL,
  [PostalPostalCode] NVARCHAR(10) NOT NULL,
  [LastEditedBy] INT NOT NULL
);

-- SupplierTransactions
CREATE TABLE [Purchasing].[SupplierTransactions] (
  [SupplierTransactionID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [SupplierID] INT NOT NULL,
  [TransactionTypeID] INT NOT NULL,
  [PurchaseOrderID] INT NULL,
  [PaymentMethodID] INT NULL,
  [SupplierInvoiceNumber] NVARCHAR(20) NULL,
  [TransactionDate] DATE NOT NULL,
  [AmountExcludingTax] DECIMAL(18,2) NOT NULL,
  [TaxAmount] DECIMAL(18,2) NOT NULL,
  [TransactionAmount] DECIMAL(18,2) NOT NULL,
  [OutstandingBalance] DECIMAL(18,2) NOT NULL,
  [FinalizationDate] DATE NULL,
  -- [IsFinalized] -- Eliminado por la compatibilidad de la replicacion.
  [LastEditedBy] INT NOT NULL
  -- ,  [LastEditedWhen] DATETIME2(7) NOT NULL DEFAULT (sysdatetime())
);


-- BuyingGroups
CREATE TABLE [Sales].[BuyingGroups] (
  [BuyingGroupID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [BuyingGroupName] NVARCHAR(50) NOT NULL,
  [LastEditedBy] INT NOT NULL
);



-- >>> De la parte de clientes. ##########################


-- CustomerCategories
CREATE TABLE [Sales].[CustomerCategories] (
  [CustomerCategoryID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [CustomerCategoryName] NVARCHAR(50) NOT NULL,
  [LastEditedBy] INT NOT NULL
);

-- Customers -> Esta es la que tenemos que separar, es la info completa de los clientes.
-- CREATE TABLE [Sales].[Customers] (
--   [CustomerID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
--   [CustomerName] NVARCHAR(100) NOT NULL,
--   [BillToCustomerID] INT NOT NULL,
--   [CustomerCategoryID] INT NOT NULL,
--   [BuyingGroupID] INT NULL,
--   [PrimaryContactPersonID] INT NOT NULL,
--   [AlternateContactPersonID] INT NULL,
--   [DeliveryMethodID] INT NOT NULL,
--   [DeliveryCityID] INT NOT NULL,
--   [PostalCityID] INT NOT NULL,
--   [CreditLimit] DECIMAL(18,2) NULL,
--   [AccountOpenedDate] DATE NOT NULL,
--   [StandardDiscountPercentage] DECIMAL(18,3) NOT NULL,
--   [IsStatementSent] BIT NOT NULL,
--   [IsOnCreditHold] BIT NOT NULL,
--   [PaymentDays] INT NOT NULL,
--   [PhoneNumber] NVARCHAR(20) NOT NULL,
--   [FaxNumber] NVARCHAR(20) NOT NULL,
--   [DeliveryRun] NVARCHAR(5) NULL,
--   [RunPosition] NVARCHAR(5) NULL,
--   [WebsiteURL] NVARCHAR(256) NOT NULL,
--   [DeliveryAddressLine1] NVARCHAR(60) NOT NULL,
--   [DeliveryAddressLine2] NVARCHAR(60) NULL,
--   [DeliveryPostalCode] NVARCHAR(10) NOT NULL,
--   [DeliveryLocation] GEOGRAPHY NULL,
--   [PostalAddressLine1] NVARCHAR(60) NOT NULL,
--   [PostalAddressLine2] NVARCHAR(60) NULL,
--   [PostalPostalCode] NVARCHAR(10) NOT NULL,
--   [LastEditedBy] INT NOT NULL
-- );

CREATE TABLE ClientesSanJose (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL,
    BillToCustomerID INT NOT NULL,
    CustomerCategoryID INT NOT NULL,
    BuyingGroupID INT,
    PrimaryContactPersonID INT NOT NULL,
    AlternateContactPersonID INT,
    DeliveryMethodID INT NOT NULL,
    DeliveryCityID INT NOT NULL,
    PostalCityID INT NOT NULL,
    CreditLimit DECIMAL(18,2),
    AccountOpenedDate DATE NOT NULL,
    StandardDiscountPercentage DECIMAL(18,3) NOT NULL,
    IsStatementSent BIT NOT NULL,
    IsOnCreditHold BIT NOT NULL,
    PaymentDays INT NOT NULL,
    LastEditedBy INT NOT NULL DEFAULT 1
    -- ,
    -- Sucursal NVARCHAR(20) DEFAULT 'SanJose',
);


CREATE TABLE ClientesLimon (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL,
    BillToCustomerID INT NOT NULL,
    CustomerCategoryID INT NOT NULL,
    BuyingGroupID INT,
    PrimaryContactPersonID INT NOT NULL,
    AlternateContactPersonID INT,
    DeliveryMethodID INT NOT NULL,
    DeliveryCityID INT NOT NULL,
    PostalCityID INT NOT NULL,
    CreditLimit DECIMAL(18,2),
    AccountOpenedDate DATE NOT NULL,
    StandardDiscountPercentage DECIMAL(18,3) NOT NULL,
    IsStatementSent BIT NOT NULL,
    IsOnCreditHold BIT NOT NULL,
    PaymentDays INT NOT NULL,
    LastEditedBy INT NOT NULL DEFAULT 1
    -- ,
    -- Sucursal NVARCHAR(20) DEFAULT 'Limon'
);
GO


-- CustomerTransactions
CREATE TABLE [Sales].[CustomerTransactions] (
  [CustomerTransactionID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [CustomerID] INT NOT NULL,
  [TransactionTypeID] INT NOT NULL,
  [InvoiceID] INT NULL,
  [PaymentMethodID] INT NULL,
  [TransactionDate] DATE NOT NULL,
  [AmountExcludingTax] DECIMAL(18,2) NOT NULL,
  [TaxAmount] DECIMAL(18,2) NOT NULL,
  [TransactionAmount] DECIMAL(18,2) NOT NULL,
  [OutstandingBalance] DECIMAL(18,2) NOT NULL,
  [FinalizationDate] DATE NULL,
  -- Este se eleimina por la replicacion.
  [LastEditedBy] INT NOT NULL
  -- ,  [LastEditedWhen] DATETIME2(7) NOT NULL DEFAULT (sysdatetime())
);

-- InvoiceLines
CREATE TABLE [Sales].[InvoiceLines] (
  [InvoiceLineID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [InvoiceID] INT NOT NULL,
  [StockItemID] INT NOT NULL,
  [Description] NVARCHAR(100) NOT NULL,
  [PackageTypeID] INT NOT NULL,
  [Quantity] INT NOT NULL,
  [UnitPrice] DECIMAL(18,2) NULL,
  [TaxRate] DECIMAL(18,3) NOT NULL,
  [TaxAmount] DECIMAL(18,2) NOT NULL,
  [LineProfit] DECIMAL(18,2) NOT NULL,
  [ExtendedPrice] DECIMAL(18,2) NOT NULL,
  [LastEditedBy] INT NOT NULL
);


-- Invoices
CREATE TABLE [Sales].[Invoices] (
  [InvoiceID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [CustomerID] INT NOT NULL,
  [BillToCustomerID] INT NOT NULL,
  [OrderID] INT NULL,
  [DeliveryMethodID] INT NOT NULL,
  [ContactPersonID] INT NOT NULL,
  [AccountsPersonID] INT NOT NULL,
  [SalespersonPersonID] INT NOT NULL,
  [PackedByPersonID] INT NOT NULL,
  [InvoiceDate] DATE NOT NULL,
  [CustomerPurchaseOrderNumber] NVARCHAR(20) NULL,
  [IsCreditNote] BIT NOT NULL,
  [CreditNoteReason] NVARCHAR(MAX) NULL,
  [Comments] NVARCHAR(MAX) NULL,
  [DeliveryInstructions] NVARCHAR(MAX) NULL,
  [InternalComments] NVARCHAR(MAX) NULL,
  [TotalDryItems] INT NOT NULL,
  [TotalChillerItems] INT NOT NULL,
  [DeliveryRun] NVARCHAR(5) NULL,
  [RunPosition] NVARCHAR(5) NULL,
  [ReturnedDeliveryData] NVARCHAR(MAX) NULL,
  -- Computed columns ConfirmedDeliveryTime y ConfirmedReceivedBy eliminados para compatibilidad
  [LastEditedBy] INT NOT NULL
  -- ,  [LastEditedWhen] DATETIME2(7) NOT NULL DEFAULT (sysdatetime())
);

-- OrderLines
CREATE TABLE [Sales].[OrderLines] (
  [OrderLineID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [OrderID] INT NOT NULL,
  [StockItemID] INT NOT NULL,
  [Description] NVARCHAR(100) NOT NULL,
  [PackageTypeID] INT NOT NULL,
  [Quantity] INT NOT NULL,
  [UnitPrice] DECIMAL(18,2) NULL,
  [TaxRate] DECIMAL(18,3) NOT NULL,
  [PickedQuantity] INT NOT NULL,
  [PickingCompletedWhen] DATETIME2(7) NULL,
  [LastEditedBy] INT NOT NULL
  -- ,  [LastEditedWhen] DATETIME2(7) NOT NULL DEFAULT (sysdatetime())
);



CREATE TABLE [Sales].[Orders] (
  [OrderID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [CustomerID] INT NOT NULL,
  [SalespersonPersonID] INT NOT NULL,
  [PickedByPersonID] INT NULL,
  [ContactPersonID] INT NOT NULL,
  [BackorderOrderID] INT NULL,
  [OrderDate] DATE NOT NULL,
  [ExpectedDeliveryDate] DATE NOT NULL,
  [CustomerPurchaseOrderNumber] NVARCHAR(20) NULL,
  [IsUndersupplyBackordered] BIT NOT NULL,
  [Comments] NVARCHAR(MAX) NULL,
  [DeliveryInstructions] NVARCHAR(MAX) NULL,
  [InternalComments] NVARCHAR(MAX) NULL,
  [PickingCompletedWhen] DATETIME2(7) NULL,
  [LastEditedBy] INT NOT NULL,
  [Suculsal] NVARCHAR(50) NULL
  -- ,[LastEditedWhen] DATETIME2(7) NOT NULL DEFAULT (sysdatetime())
);



CREATE TABLE [Sales].[SpecialDeals] (
  [SpecialDealID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [StockItemID] INT NULL,
  [CustomerID] INT NULL,
  [BuyingGroupID] INT NULL,
  [CustomerCategoryID] INT NULL,
  [StockGroupID] INT NULL,
  [DealDescription] NVARCHAR(30) NOT NULL,
  [StartDate] DATE NOT NULL,
  [EndDate] DATE NOT NULL,
  [DiscountAmount] DECIMAL(18,2) NULL,
  [DiscountPercentage] DECIMAL(18,3) NULL,
  [UnitPrice] DECIMAL(18,2) NULL,
  [LastEditedBy] INT NOT NULL,
  -- [LastEditedWhen] DATETIME2(7) NOT NULL DEFAULT (sysdatetime()),
  CONSTRAINT [CK_Sales_SpecialDeals_Exactly_One_NOT_NULL_Pricing_Option_Is_Required] 
    CHECK (((CASE WHEN [DiscountAmount] IS NULL THEN 0 ELSE 1 END
           + CASE WHEN [DiscountPercentage] IS NULL THEN 0 ELSE 1 END
           + CASE WHEN [UnitPrice] IS NULL THEN 0 ELSE 1 END) = 1)),
  CONSTRAINT [CK_Sales_SpecialDeals_Unit_Price_Deal_Requires_Special_StockItem] 
    CHECK (([StockItemID] IS NOT NULL AND [UnitPrice] IS NOT NULL OR [UnitPrice] IS NULL))
);

-- ALTER TABLE [Sales].[SpecialDeals]  WITH CHECK ADD  CONSTRAINT [CK_Sales_SpecialDeals_Exactly_One_NOT_NULL_Pricing_Option_Is_Required] CHECK  ((((case when [DiscountAmount] IS NULL then (0) else (1) end+case when [DiscountPercentage] IS NULL then (0) else (1) end)+case when [UnitPrice] IS NULL then (0) else (1) end)=(1)))
-- GO

-- ColdRoomTemperatures
CREATE TABLE [Warehouse].[ColdRoomTemperatures] (
  [ColdRoomTemperatureID] BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [ColdRoomSensorNumber] INT NOT NULL,
  [RecordedWhen] DATETIME2(7) NOT NULL,
  [Temperature] DECIMAL(10,2) NOT NULL
);

-- Colors
CREATE TABLE [Warehouse].[Colors] (
  [ColorID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [ColorName] NVARCHAR(20) NOT NULL,
  [LastEditedBy] INT NOT NULL,
  CONSTRAINT [UQ_Warehouse_Colors_ColorName] UNIQUE ([ColorName])
);

-- PackageTypes
CREATE TABLE [Warehouse].[PackageTypes] (
  [PackageTypeID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [PackageTypeName] NVARCHAR(50) NOT NULL,
  [LastEditedBy] INT NOT NULL,
  CONSTRAINT [UQ_Warehouse_PackageTypes_PackageTypeName] UNIQUE ([PackageTypeName])
);


-- StockGroups
CREATE TABLE [Warehouse].[StockGroups] (
  [StockGroupID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [StockGroupName] NVARCHAR(50) NOT NULL,
  [LastEditedBy] INT NOT NULL,
  CONSTRAINT [UQ_Warehouse_StockGroups_StockGroupName] UNIQUE ([StockGroupName])
);

--  StockItemHoldings
CREATE TABLE [Warehouse].[StockItemHoldings] (
  [StockItemID] INT NOT NULL PRIMARY KEY, -- <- Esta esta directamente relacionada con la de productos, asi que no llevamos el identity.
  [QuantityOnHand] INT NOT NULL,
  [BinLocation] NVARCHAR(20) NOT NULL,
  [LastStocktakeQuantity] INT NOT NULL,
  [LastCostPrice] DECIMAL(18,2) NOT NULL,
  [ReorderLevel] INT NOT NULL,
  [TargetStockLevel] INT NOT NULL,
  [LastEditedBy] INT NOT NULL
  -- ,  [LastEditedWhen] DATETIME2(7) NOT NULL DEFAULT (sysdatetime())
);

-- StockItems
CREATE TABLE [Warehouse].[StockItems] (
  [StockItemID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [StockItemName] NVARCHAR(100) NOT NULL,
  [SupplierID] INT NOT NULL,
  [ColorID] INT NULL,
  [UnitPackageID] INT NOT NULL,
  [OuterPackageID] INT NOT NULL,
  [Brand] NVARCHAR(50) NULL,
  [Size] NVARCHAR(20) NULL,
  [LeadTimeDays] INT NOT NULL,
  [QuantityPerOuter] INT NOT NULL,
  [IsChillerStock] BIT NOT NULL,
  [Barcode] NVARCHAR(50) NULL,
  [TaxRate] DECIMAL(18,3) NOT NULL,
  [UnitPrice] DECIMAL(18,2) NOT NULL,
  [RecommendedRetailPrice] DECIMAL(18,2) NULL,
  [TypicalWeightPerUnit] DECIMAL(18,3) NOT NULL,
  [MarketingComments] NVARCHAR(MAX) NULL,
  [InternalComments] NVARCHAR(MAX) NULL,
  [Photo] VARBINARY(MAX) NULL,
  [CustomFields] NVARCHAR(MAX) NULL
  -- ,  CONSTRAINT [UQ_Warehouse_StockItems_StockItemName] UNIQUE ([StockItemName])
);


-- StockItemStockGroups
CREATE TABLE [Warehouse].[StockItemStockGroups] (
  [StockItemStockGroupID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [StockItemID] INT NOT NULL,
  [StockGroupID] INT NOT NULL,
  [LastEditedBy] INT NOT NULL
  -- ,
  -- CONSTRAINT [UQ_StockItemStockGroups_StockGroupID_Lookup] UNIQUE ([StockGroupID], [StockItemID]),
  -- CONSTRAINT [UQ_StockItemStockGroups_StockItemID_Lookup] UNIQUE ([StockItemID], [StockGroupID])
);


-- StockItemTransactions
CREATE TABLE [Warehouse].[StockItemTransactions] (
  [StockItemTransactionID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [StockItemID] INT NOT NULL,
  [TransactionTypeID] INT NOT NULL,
  [CustomerID] INT NULL,
  [InvoiceID] INT NULL,
  [SupplierID] INT NULL,
  [PurchaseOrderID] INT NULL,
  [TransactionOccurredWhen] DATETIME2(7) NOT NULL,
  [Quantity] DECIMAL(18,3) NOT NULL,
  [LastEditedBy] INT NOT NULL
  -- ,  [LastEditedWhen] DATETIME2(7) NOT NULL DEFAULT (sysdatetime())
);


CREATE TABLE [Warehouse].[VehicleTemperatures] (
  [VehicleTemperatureID] BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
  [VehicleRegistration] NVARCHAR(20) NOT NULL,
  [ChillerSensorNumber] INT NOT NULL,
  [RecordedWhen] DATETIME2(7) NOT NULL,
  [Temperature] DECIMAL(10,2) NOT NULL,
  [FullSensorData] NVARCHAR(1000) NULL,
  [IsCompressed] BIT NOT NULL,
  [CompressedSensorData] VARBINARY(MAX) NULL
);

