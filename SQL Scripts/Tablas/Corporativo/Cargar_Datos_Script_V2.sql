-- Aqui se van a hacer la carga de datos desde la WideWorldImporters orginal, hacia las bases de datos nuevas que se crearon, de corporatvo y las sucrusales.

USE WWI_Corporativo_V1;
GO


-- ======  ======:
-- SET IDENTITY_INSERT Warehouse. ON;

-- INSERT INTO Warehouse.
--     ()
-- SELECT

-- FROM WideWorldImporters.Warehouse.;

-- SET IDENTITY_INSERT Warehouse. OFF;





-- ====== Cities ======:

SET IDENTITY_INSERT Application.Cities ON; -- Pagar el indetity.

INSERT INTO Application.Cities (CityID, CityName, StateProvinceID, Location, LatestRecordedPopulation, LastEditedBy)
SELECT 
    CityID,
    CityName, 
    StateProvinceID, 
    Location, 
    LatestRecordedPopulation, 
    LastEditedBy
FROM WideWorldImporters.Application.Cities_Stage;

SET IDENTITY_INSERT Application.Cities OFF; -- Activar el identity.



-- ====== Countries ======:
SET IDENTITY_INSERT Application.Countries ON;

INSERT INTO Application.Countries
    (CountryID, CountryName, FormalName, IsoAlpha3Code, IsoNumericCode, CountryType, LatestRecordedPopulation, Continent, Region, Subregion, Border, LastEditedBy)
SELECT
    CountryID,
    CountryName,
    FormalName,
    IsoAlpha3Code,
    IsoNumericCode,
    CountryType,
    LatestRecordedPopulation,
    Continent,
    Region,
    Subregion,
    Border,
    LastEditedBy
FROM WideWorldImporters.Application.Countries_Stage;

SET IDENTITY_INSERT Application.Countries OFF;



-- ====== DeliveryMethods ======:
SET IDENTITY_INSERT Application.DeliveryMethods ON;

INSERT INTO Application.DeliveryMethods
    (DeliveryMethodID, DeliveryMethodName, LastEditedBy)
SELECT
    DeliveryMethodID,
    DeliveryMethodName,
    LastEditedBy
FROM WideWorldImporters.Application.DeliveryMethods_Stage;

SET IDENTITY_INSERT Application.DeliveryMethods OFF;


-- ====== PaymentMethods ======:
SET IDENTITY_INSERT Application.PaymentMethods ON;

INSERT INTO Application.PaymentMethods
    (PaymentMethodID, PaymentMethodName, LastEditedBy)
SELECT
    PaymentMethodID,
    PaymentMethodName,
    LastEditedBy
FROM WideWorldImporters.Application.PaymentMethods_Stage;

SET IDENTITY_INSERT Application.PaymentMethods OFF;


-- ====== People ======:
-- Activar IDENTITY_INSERT para poder insertar PersonID manualmente
SET IDENTITY_INSERT Application.People ON;

INSERT INTO Application.People
    (PersonID, FullName, PreferredName, IsPermittedToLogon, LogonName, IsExternalLogonProvider,
    HashedPassword, IsSystemUser, IsEmployee, IsSalesperson, UserPreferences, PhoneNumber,
    FaxNumber, EmailAddress, Photo, CustomFields, LastEditedBy)
SELECT
    PersonID,
    FullName,
    PreferredName,
    IsPermittedToLogon,
    LogonName,
    IsExternalLogonProvider,
    HashedPassword,
    IsSystemUser,
    IsEmployee,
    IsSalesperson,
    UserPreferences,
    PhoneNumber,
    FaxNumber,
    EmailAddress,
    Photo,
    CustomFields,
    LastEditedBy
FROM WideWorldImporters.Application.People_Stage;

SET IDENTITY_INSERT Application.People OFF;



-- ====== StateProvinces ======:
SET IDENTITY_INSERT Application.StateProvinces ON;

INSERT INTO Application.StateProvinces
    (StateProvinceID, StateProvinceCode, StateProvinceName, CountryID,
    SalesTerritory, Border, LatestRecordedPopulation, LastEditedBy)
SELECT
    StateProvinceID,
    StateProvinceCode,
    StateProvinceName,
    CountryID,
    SalesTerritory,
    Border,
    LatestRecordedPopulation,
    LastEditedBy
FROM WideWorldImporters.Application.StateProvinces_Stage;

SET IDENTITY_INSERT Application.StateProvinces OFF;


-- ====== SystemParameters ======:
SET IDENTITY_INSERT Application.SystemParameters ON;

INSERT INTO Application.SystemParameters
    (SystemParameterID, DeliveryAddressLine1, DeliveryAddressLine2, DeliveryCityID,
    DeliveryPostalCode, DeliveryLocation, PostalAddressLine1, PostalAddressLine2,
    PostalCityID, PostalPostalCode, ApplicationSettings, LastEditedBy)
SELECT
    SystemParameterID,
    DeliveryAddressLine1,
    DeliveryAddressLine2,
    DeliveryCityID,
    DeliveryPostalCode,
    DeliveryLocation,
    PostalAddressLine1,
    PostalAddressLine2,
    PostalCityID,
    PostalPostalCode,
    ApplicationSettings,
    LastEditedBy
FROM WideWorldImporters.Application.SystemParameters_Stage;

SET IDENTITY_INSERT Application.SystemParameters OFF;


-- ====== TransactionTypes ======:
SET IDENTITY_INSERT Application.TransactionTypes ON;

INSERT INTO Application.TransactionTypes
    (TransactionTypeID, TransactionTypeName, LastEditedBy)
SELECT
    TransactionTypeID,
    TransactionTypeName,
    LastEditedBy
FROM WideWorldImporters.Application.TransactionTypes_Stage;

SET IDENTITY_INSERT Application.TransactionTypes OFF;



-- ====== PurchaseOrderLines ======:
SET IDENTITY_INSERT Purchasing.PurchaseOrderLines ON;

INSERT INTO Purchasing.PurchaseOrderLines
    (PurchaseOrderLineID, PurchaseOrderID, StockItemID, OrderedOuters, Description,
    ReceivedOuters, PackageTypeID, ExpectedUnitPricePerOuter, LastReceiptDate,
    IsOrderLineFinalized, LastEditedBy)
SELECT
    PurchaseOrderLineID,
    PurchaseOrderID,
    StockItemID,
    OrderedOuters,
    Description,
    ReceivedOuters,
    PackageTypeID,
    ExpectedUnitPricePerOuter,
    LastReceiptDate,
    IsOrderLineFinalized,
    LastEditedBy
FROM WideWorldImporters.Purchasing.PurchaseOrderLines_Stage;

SET IDENTITY_INSERT Purchasing.PurchaseOrderLines OFF;



-- ====== PurchaseOrders ======:
SET IDENTITY_INSERT Purchasing.PurchaseOrders ON;

INSERT INTO Purchasing.PurchaseOrders
    (PurchaseOrderID, SupplierID, OrderDate, DeliveryMethodID, ContactPersonID,
    ExpectedDeliveryDate, SupplierReference, IsOrderFinalized,
    Comments, InternalComments, LastEditedBy)
SELECT
    PurchaseOrderID,
    SupplierID,
    OrderDate,
    DeliveryMethodID,
    ContactPersonID,
    ExpectedDeliveryDate,
    SupplierReference,
    IsOrderFinalized,
    Comments,
    InternalComments,
    LastEditedBy
FROM WideWorldImporters.Purchasing.PurchaseOrders_Stage;

SET IDENTITY_INSERT Purchasing.PurchaseOrderLines OFF;



-- ====== SupplierCategories ======:
SET IDENTITY_INSERT Purchasing.SupplierCategories ON;

INSERT INTO Purchasing.SupplierCategories
    (SupplierCategoryID, SupplierCategoryName, LastEditedBy)
SELECT
    SupplierCategoryID,
    SupplierCategoryName,
    LastEditedBy
FROM WideWorldImporters.Purchasing.SupplierCategories_Stage;

SET IDENTITY_INSERT Purchasing.SupplierCategories OFF;



-- ====== Suppliers ======:
SET IDENTITY_INSERT Purchasing.Suppliers ON;

INSERT INTO Purchasing.Suppliers
    (SupplierID, SupplierName, SupplierCategoryID, PrimaryContactPersonID, AlternateContactPersonID,
    DeliveryMethodID, DeliveryCityID, PostalCityID, SupplierReference, BankAccountName,
    BankAccountBranch, BankAccountCode, BankAccountNumber, BankInternationalCode, PaymentDays,
    InternalComments, PhoneNumber, FaxNumber, WebsiteURL, DeliveryAddressLine1, DeliveryAddressLine2,
    DeliveryPostalCode, DeliveryLocation, PostalAddressLine1, PostalAddressLine2, PostalPostalCode, LastEditedBy)
SELECT
    SupplierID,
    SupplierName,
    SupplierCategoryID,
    PrimaryContactPersonID,
    AlternateContactPersonID,
    DeliveryMethodID,
    DeliveryCityID,
    PostalCityID,
    SupplierReference,
    BankAccountName,
    BankAccountBranch,
    BankAccountCode,
    BankAccountNumber,
    BankInternationalCode,
    PaymentDays,
    InternalComments,
    PhoneNumber,
    FaxNumber,
    WebsiteURL,
    DeliveryAddressLine1,
    DeliveryAddressLine2,
    DeliveryPostalCode,
    DeliveryLocation,
    PostalAddressLine1,
    PostalAddressLine2,
    PostalPostalCode,
    LastEditedBy
FROM WideWorldImporters.Purchasing.Suppliers_Stage;

SET IDENTITY_INSERT Purchasing.Suppliers OFF;



-- ====== SupplierTransactions ======:
SET IDENTITY_INSERT Purchasing.SupplierTransactions ON;

INSERT INTO Purchasing.SupplierTransactions
    (SupplierTransactionID, SupplierID, TransactionTypeID, PurchaseOrderID, PaymentMethodID,
    SupplierInvoiceNumber, TransactionDate, AmountExcludingTax, TaxAmount, TransactionAmount,
    OutstandingBalance, FinalizationDate, LastEditedBy)
SELECT
    SupplierTransactionID,
    SupplierID,
    TransactionTypeID,
    PurchaseOrderID,
    PaymentMethodID,
    SupplierInvoiceNumber,
    TransactionDate,
    AmountExcludingTax,
    TaxAmount,
    TransactionAmount,
    OutstandingBalance,
    FinalizationDate,
    LastEditedBy
FROM WideWorldImporters.Purchasing.SupplierTransactions_Stage;

SET IDENTITY_INSERT Purchasing.SupplierTransactions OFF;



-- ====== BuyingGroups ======:
SET IDENTITY_INSERT Sales.BuyingGroups ON;

INSERT INTO Sales.BuyingGroups
    (BuyingGroupID, BuyingGroupName, LastEditedBy)
SELECT
    BuyingGroupID,
    BuyingGroupName,
    LastEditedBy
FROM WideWorldImporters.Sales.BuyingGroups_Stage;

SET IDENTITY_INSERT Sales.BuyingGroups OFF;


-- ====== CustomerCategories ======:
SET IDENTITY_INSERT Sales.CustomerCategories ON;

INSERT INTO Sales.CustomerCategories
    (CustomerCategoryID, CustomerCategoryName, LastEditedBy)
SELECT
    CustomerCategoryID,
    CustomerCategoryName,
    LastEditedBy
FROM WideWorldImporters.Sales.CustomerCategories_Stage;

SET IDENTITY_INSERT Sales.CustomerCategories OFF;



-- ====== Customers ======:
SET IDENTITY_INSERT Sales.Customers ON;

INSERT INTO Sales.Customers
    (CustomerID, CustomerName, BillToCustomerID, CustomerCategoryID, BuyingGroupID,
    PrimaryContactPersonID, AlternateContactPersonID, DeliveryMethodID, DeliveryCityID,
    PostalCityID, CreditLimit, AccountOpenedDate, StandardDiscountPercentage,
    IsStatementSent, IsOnCreditHold, PaymentDays, PhoneNumber, FaxNumber,
    DeliveryRun, RunPosition, WebsiteURL, DeliveryAddressLine1, DeliveryAddressLine2,
    DeliveryPostalCode, DeliveryLocation, PostalAddressLine1, PostalAddressLine2,
    PostalPostalCode, LastEditedBy)
SELECT
    CustomerID,
    CustomerName,
    BillToCustomerID,
    CustomerCategoryID,
    BuyingGroupID,
    PrimaryContactPersonID,
    AlternateContactPersonID,
    DeliveryMethodID,
    DeliveryCityID,
    PostalCityID,
    CreditLimit,
    AccountOpenedDate,
    StandardDiscountPercentage,
    IsStatementSent,
    IsOnCreditHold,
    PaymentDays,
    PhoneNumber,
    FaxNumber,
    DeliveryRun,
    RunPosition,
    WebsiteURL,
    DeliveryAddressLine1,
    DeliveryAddressLine2,
    DeliveryPostalCode,
    DeliveryLocation,
    PostalAddressLine1,
    PostalAddressLine2,
    PostalPostalCode,
    LastEditedBy
FROM WideWorldImporters.Sales.Customers_Stage;

SET IDENTITY_INSERT Sales.Customers OFF;



-- ====== CustomerTransactions ======:
SET IDENTITY_INSERT Sales.CustomerTransactions ON;

INSERT INTO Sales.CustomerTransactions
    (CustomerTransactionID, CustomerID, TransactionTypeID, InvoiceID, PaymentMethodID,
    TransactionDate, AmountExcludingTax, TaxAmount, TransactionAmount, OutstandingBalance, FinalizationDate, LastEditedBy)
SELECT
    CustomerTransactionID,
    CustomerID,
    TransactionTypeID,
    InvoiceID,
    PaymentMethodID,
    TransactionDate,
    AmountExcludingTax,
    TaxAmount,
    TransactionAmount,
    OutstandingBalance,
    FinalizationDate,
    LastEditedBy
FROM WideWorldImporters.Sales.CustomerTransactions_Stage;

SET IDENTITY_INSERT Sales.CustomerTransactions OFF;


-- ====== InvoicesLines ======:
SET IDENTITY_INSERT Sales.InvoiceLines ON;

INSERT INTO Sales.InvoiceLines
    (InvoiceLineID, InvoiceID, StockItemID, Description, PackageTypeID,
    Quantity, UnitPrice, TaxRate, TaxAmount, LineProfit, ExtendedPrice, LastEditedBy)
SELECT
    InvoiceLineID,
    InvoiceID,
    StockItemID,
    Description,
    PackageTypeID,
    Quantity,
    UnitPrice,
    TaxRate,
    TaxAmount,
    LineProfit,
    ExtendedPrice,
    LastEditedBy
FROM WideWorldImporters.Sales.InvoiceLines_Stage;

SET IDENTITY_INSERT Sales.InvoiceLines OFF;



-- ====== Invoices ======:
SET IDENTITY_INSERT Sales.Invoices ON;

INSERT INTO Sales.Invoices
    (InvoiceID, CustomerID, BillToCustomerID, OrderID, DeliveryMethodID,
    ContactPersonID, AccountsPersonID, SalespersonPersonID, PackedByPersonID,
    InvoiceDate, CustomerPurchaseOrderNumber, IsCreditNote, CreditNoteReason,
    Comments, DeliveryInstructions, InternalComments, TotalDryItems,
    TotalChillerItems, DeliveryRun, RunPosition, ReturnedDeliveryData, LastEditedBy)
SELECT
    InvoiceID,
    CustomerID,
    BillToCustomerID,
    OrderID,
    DeliveryMethodID,
    ContactPersonID,
    AccountsPersonID,
    SalespersonPersonID,
    PackedByPersonID,
    InvoiceDate,
    CustomerPurchaseOrderNumber,
    IsCreditNote,
    CreditNoteReason,
    Comments,
    DeliveryInstructions,
    InternalComments,
    TotalDryItems,
    TotalChillerItems,
    DeliveryRun,
    RunPosition,
    ReturnedDeliveryData,
    LastEditedBy
FROM WideWorldImporters.Sales.Invoices_Stage;

SET IDENTITY_INSERT Sales.Invoices OFF;



-- ====== OrderLines ======:
SET IDENTITY_INSERT Sales.OrderLines ON;

INSERT INTO Sales.OrderLines
    (OrderLineID, OrderID, StockItemID, Description, PackageTypeID,
    Quantity, UnitPrice, TaxRate, PickedQuantity, PickingCompletedWhen, LastEditedBy)
SELECT
    OrderLineID,
    OrderID,
    StockItemID,
    Description,
    PackageTypeID,
    Quantity,
    UnitPrice,
    TaxRate,
    PickedQuantity,
    PickingCompletedWhen,
    LastEditedBy
FROM WideWorldImporters.Sales.OrderLines_Stage;

SET IDENTITY_INSERT Sales.OrderLines OFF;



-- ====== Orders ======:
SET IDENTITY_INSERT Sales.Orders ON;

INSERT INTO Sales.Orders
    (OrderID, CustomerID, SalespersonPersonID, PickedByPersonID, ContactPersonID,
    BackorderOrderID, OrderDate, ExpectedDeliveryDate, CustomerPurchaseOrderNumber,
    IsUndersupplyBackordered, Comments, DeliveryInstructions, InternalComments,
    PickingCompletedWhen, LastEditedBy)
SELECT
    OrderID,
    CustomerID,
    SalespersonPersonID,
    PickedByPersonID,
    ContactPersonID,
    BackorderOrderID,
    OrderDate,
    ExpectedDeliveryDate,
    CustomerPurchaseOrderNumber,
    IsUndersupplyBackordered,
    Comments,
    DeliveryInstructions,
    InternalComments,
    PickingCompletedWhen,
    LastEditedBy
FROM WideWorldImporters.Sales.Orders_Stage; --where O.Sucursal = 'Limon';

SET IDENTITY_INSERT Sales.Orders OFF;


-- ====== SpecialDeals ======:
SET IDENTITY_INSERT Sales.SpecialDeals ON;

INSERT INTO Sales.SpecialDeals
    (SpecialDealID, StockItemID, CustomerID, BuyingGroupID, CustomerCategoryID,
    StockGroupID, DealDescription, StartDate, EndDate,
    DiscountAmount, DiscountPercentage, UnitPrice, LastEditedBy)
SELECT
    SpecialDealID,
    StockItemID,
    CustomerID,
    BuyingGroupID,
    CustomerCategoryID,
    StockGroupID,
    DealDescription,
    StartDate,
    EndDate,
    DiscountAmount,
    DiscountPercentage,
    UnitPrice,
    LastEditedBy
FROM WideWorldImporters.Sales.SpecialDeals_Stage;

SET IDENTITY_INSERT Sales.SpecialDeals OFF;


-- ====== ColdRoomTemperatures ======:
SET IDENTITY_INSERT Warehouse.ColdRoomTemperatures ON;

INSERT INTO Warehouse.ColdRoomTemperatures
    (ColdRoomTemperatureID, ColdRoomSensorNumber, RecordedWhen, Temperature)
SELECT
    ColdRoomTemperatureID,
    ColdRoomSensorNumber,
    RecordedWhen,
    Temperature
FROM WideWorldImporters.Warehouse.ColdRoomTemperatures_Stage;

SET IDENTITY_INSERT Warehouse.ColdRoomTemperatures OFF;


-- ======  ======:
SET IDENTITY_INSERT Warehouse.Colors ON;

INSERT INTO Warehouse.Colors
    (ColorID, ColorName, LastEditedBy)
SELECT
    ColorID,
    ColorName,
    LastEditedBy
FROM WideWorldImporters.Warehouse.Colors_Stage;

SET IDENTITY_INSERT Warehouse.Colors OFF;



-- ====== PackageTypes ======:
SET IDENTITY_INSERT Warehouse.PackageTypes ON;

INSERT INTO Warehouse.PackageTypes
    (PackageTypeID, PackageTypeName, LastEditedBy)
SELECT
    PackageTypeID,
    PackageTypeName,
    LastEditedBy
FROM WideWorldImporters.Warehouse.PackageTypes_Stage;

SET IDENTITY_INSERT Warehouse.PackageTypes OFF;



-- ====== StockGroups ======:
SET IDENTITY_INSERT Warehouse.StockGroups ON;

INSERT INTO Warehouse.StockGroups
    (StockGroupID, StockGroupName, LastEditedBy)
SELECT
    StockGroupID,
    StockGroupName,
    LastEditedBy
FROM WideWorldImporters.Warehouse.StockGroups_Stage;

SET IDENTITY_INSERT Warehouse.StockGroups OFF;


-- ====== StockItemHoldings ======:
-- INSERT INTO Warehouse.StockItemHoldings
--     (StockItemID, QuantityOnHand, BinLocation, LastStocktakeQuantity,
--     LastCostPrice, ReorderLevel, TargetStockLevel, LastEditedBy)
-- SELECT
--     StockItemID,
--     QuantityOnHand,
--     BinLocation,
--     LastStocktakeQuantity,
--     LastCostPrice,
--     ReorderLevel,
--     TargetStockLevel,
--     LastEditedBy
-- FROM WideWorldImporters.Warehouse.StockItemHoldings_Stage;



-- ====== StockItems ======:
SET IDENTITY_INSERT Warehouse.StockItems ON;

INSERT INTO Warehouse.StockItems
    (StockItemID, StockItemName, SupplierID, ColorID, UnitPackageID, OuterPackageID,
    Brand, Size, LeadTimeDays, QuantityPerOuter, IsChillerStock, Barcode,
    TaxRate, UnitPrice, RecommendedRetailPrice, TypicalWeightPerUnit,
    MarketingComments, InternalComments, Photo, CustomFields)
SELECT
    StockItemID,
    StockItemName,
    SupplierID,
    ColorID,
    UnitPackageID,
    OuterPackageID,
    Brand,
    Size,
    LeadTimeDays,
    QuantityPerOuter,
    IsChillerStock,
    Barcode,
    TaxRate,
    UnitPrice,
    RecommendedRetailPrice,
    TypicalWeightPerUnit,
    MarketingComments,
    InternalComments,
    Photo,
    CustomFields
FROM WideWorldImporters.Warehouse.StockItems_Stage;

SET IDENTITY_INSERT Warehouse.StockItems OFF;



-- ====== StockItemStockGroups ======:
SET IDENTITY_INSERT Warehouse.StockItemStockGroups ON;

INSERT INTO Warehouse.StockItemStockGroups
    (StockItemStockGroupID, StockItemID, StockGroupID, LastEditedBy)
SELECT
    StockItemStockGroupID,
    StockItemID,
    StockGroupID,
    LastEditedBy
FROM WideWorldImporters.Warehouse.StockItemStockGroups_Stage;

SET IDENTITY_INSERT Warehouse.StockItemStockGroups OFF;


-- ====== StockItemTransactions ======:
SET IDENTITY_INSERT Warehouse.StockItemTransactions ON;

INSERT INTO Warehouse.StockItemTransactions
    (StockItemTransactionID, StockItemID, TransactionTypeID, CustomerID, InvoiceID,
    SupplierID, PurchaseOrderID, TransactionOccurredWhen, Quantity, LastEditedBy)
SELECT
    StockItemTransactionID,
    StockItemID,
    TransactionTypeID,
    CustomerID,
    InvoiceID,
    SupplierID,
    PurchaseOrderID,
    TransactionOccurredWhen,
    Quantity,
    LastEditedBy
FROM WideWorldImporters.Warehouse.StockItemTransactions_Stage;

SET IDENTITY_INSERT Warehouse.StockItemTransactions OFF


-- ====== VehicleTemperatures ======:
SET IDENTITY_INSERT Warehouse.VehicleTemperatures ON;

INSERT INTO Warehouse.VehicleTemperatures
    (VehicleTemperatureID, VehicleRegistration, ChillerSensorNumber, RecordedWhen, 
    Temperature, FullSensorData, IsCompressed, CompressedSensorData)
SELECT
    VehicleTemperatureID,
    VehicleRegistration,
    ChillerSensorNumber,
    RecordedWhen,
    Temperature,
    FullSensorData,
    IsCompressed,
    CompressedSensorData
FROM WideWorldImporters.Warehouse.VehicleTemperatures_Stage;

SET IDENTITY_INSERT Warehouse.VehicleTemperatures OFF;



-- ======  ======:


