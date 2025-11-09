-- Tablas para distribución de Sucursal
USE master;
GO

-- Base de datos Sucursal San Jose
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'WWI_San_Jose')
BEGIN
    CREATE DATABASE WWI_San_Jose;
END
GO

-- Base de datos Sucursal Limon
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'WWI_Limon')
BEGIN
    CREATE DATABASE WWI_Limon;
END
GO

-- FIN CREACION DE BASES DE DATOS
USE WWI_San_Jose;
GO

-- Clientes Sanjose Datos publicos
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
    LastEditedBy INT NOT NULL DEFAULT 1,
    ValidFrom DATETIME2 NOT NULL DEFAULT GETDATE(),
    ValidTo DATETIME2 NOT NULL DEFAULT '9999-12-31 23:59:59.9999999',
    Sucursal NVARCHAR(20) DEFAULT 'SanJose',
);

-- Productos y proveedores: Solo lectura por suscripcion
CREATE TABLE Productos (
    StockItemID INT PRIMARY KEY,
    StockItemName NVARCHAR(100) NOT NULL,
    SupplierID INT NOT NULL,
    ColorID INT,
    UnitPackageID INT NOT NULL,
    OuterPackageID INT NOT NULL,
    Brand NVARCHAR(50),
    Size NVARCHAR(20),
    LeadTimeDays INT NOT NULL,
    QuantityPerOuter INT NOT NULL,
    IsChillerStock BIT NOT NULL,
    Barcode NVARCHAR(50),
    TaxRate DECIMAL(18,3) NOT NULL,
    UnitPrice DECIMAL(18,2) NOT NULL,
    RecommendedRetailPrice DECIMAL(18,2),
    TypicalWeightPerUnit DECIMAL(18,3) NOT NULL,
    MarketingComments NVARCHAR(MAX),
    InternalComments NVARCHAR(MAX),
    Photo VARBINARY(MAX),
    CustomFields NVARCHAR(MAX),
    Tags NVARCHAR(MAX),
    SearchDetails NVARCHAR(MAX),
    LastEditedBy INT NOT NULL,
    ValidFrom DATETIME2 NOT NULL,
    ValidTo DATETIME2 NOT NULL
);
GO

CREATE TABLE Proveedores (
    SupplierID INT PRIMARY KEY,
    SupplierName NVARCHAR(100) NOT NULL,
    SupplierCategoryID INT NOT NULL,
    PrimaryContactPersonID INT NOT NULL,
    AlternateContactPersonID INT,
    DeliveryMethodID INT,
    DeliveryCityID INT NOT NULL,
    PostalCityID INT NOT NULL,
    SupplierReference NVARCHAR(20),
    BankAccountName NVARCHAR(50),
    BankAccountBranch NVARCHAR(50),
    BankAccountCode NVARCHAR(20),
    BankAccountNumber NVARCHAR(20),
    BankInternationalCode NVARCHAR(20),
    PaymentDays INT NOT NULL,
    InternalComments NVARCHAR(MAX),
    PhoneNumber NVARCHAR(20) NOT NULL,
    FaxNumber NVARCHAR(20) NOT NULL,
    WebsiteURL NVARCHAR(256) NOT NULL,
    DeliveryAddressLine1 NVARCHAR(60) NOT NULL,
    DeliveryAddressLine2 NVARCHAR(60),
    DeliveryPostalCode NVARCHAR(10) NOT NULL,
    PostalAddressLine1 NVARCHAR(60) NOT NULL,
    PostalAddressLine2 NVARCHAR(60),
    PostalPostalCode NVARCHAR(10) NOT NULL,
    DeliveryLocation GEOGRAPHY,
    LastEditedBy INT NOT NULL,
    ValidFrom DATETIME2 NOT NULL,
    ValidTo DATETIME2 NOT NULL
);
GO

CREATE TABLE Colores (
    ColorID INT PRIMARY KEY,
    ColorName NVARCHAR(20) NOT NULL,
    LastEditedBy INT NOT NULL,
    ValidFrom DATETIME2 NOT NULL,
    ValidTo DATETIME2 NOT NULL
);
GO

CREATE TABLE TiposEmpaque (
    PackageTypeID INT PRIMARY KEY,
    PackageTypeName NVARCHAR(50) NOT NULL,
    LastEditedBy INT NOT NULL,
    ValidFrom DATETIME2 NOT NULL,
    ValidTo DATETIME2 NOT NULL
);
GO

CREATE TABLE GruposProductos (
    StockGroupID INT PRIMARY KEY,
    StockGroupName NVARCHAR(50) NOT NULL,
    LastEditedBy INT NOT NULL,
    ValidFrom DATETIME2 NOT NULL,
    ValidTo DATETIME2 NOT NULL
);
GO

CREATE TABLE ProductosGrupos (
    StockItemStockGroupID INT PRIMARY KEY,
    StockItemID INT NOT NULL,
    StockGroupID INT NOT NULL,
    LastEditedBy INT NOT NULL,
    ValidFrom DATETIME2 NOT NULL,
    ValidTo DATETIME2 NOT NULL
    FOREIGN KEY (StockItemID) REFERENCES Productos(StockItemID),
    FOREIGN KEY (StockGroupID) REFERENCES GruposProductos(StockGroupID)
);
GO

-- Datos de unicamente La sucursal
CREATE TABLE InventarioSanJose (
    StockItemID INT NOT NULL,
    QuantityOnHand INT NOT NULL,
    BinLocation NVARCHAR(20),
    LastStocktakeQuantity INT NOT NULL,
    LastCostPrice DECIMAL(18,2) NOT NULL,
    ReorderLevel INT NOT NULL,
    TargetStockLevel INT NOT NULL,
    LastEditedBy INT NOT NULL DEFAULT 1,
    LastEditedWhen DATETIME2 NOT NULL DEFAULT GETDATE(),
    Sucursal NVARCHAR(20) DEFAULT 'SanJose',
    CONSTRAINT PK_InventarioSanJose PRIMARY KEY (StockItemID),
    CONSTRAINT FK_InventarioSanJose_Productos FOREIGN KEY (StockItemID) REFERENCES Productos(StockItemID)
);
GO

-- Facturas San José
CREATE TABLE FacturasSanJose (
    InvoiceID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    BillToCustomerID INT NOT NULL,
    OrderID INT,
    DeliveryMethodID INT NOT NULL,
    ContactPersonID INT NOT NULL,
    AccountsPersonID INT NOT NULL,
    SalespersonPersonID INT NOT NULL,
    PackedByPersonID INT,
    InvoiceDate DATE NOT NULL,
    CustomerPurchaseOrderNumber NVARCHAR(20),
    IsCreditNote BIT NOT NULL,
    CreditNoteReason NVARCHAR(MAX),
    Comments NVARCHAR(MAX),
    DeliveryInstructions NVARCHAR(MAX),
    InternalComments NVARCHAR(MAX),
    TotalDryItems INT NOT NULL,
    TotalChillerItems INT NOT NULL,
    DeliveryRun NVARCHAR(5),
    RunPosition NVARCHAR(5),
    ReturnedDeliveryData NVARCHAR(MAX),
    ConfirmedDeliveryTime DATETIME2,
    ConfirmedReceivedBy NVARCHAR(4000),
    LastEditedBy INT NOT NULL DEFAULT 1,
    LastEditedWhen DATETIME2 NOT NULL DEFAULT GETDATE(),
    Sucursal NVARCHAR(20) DEFAULT 'SanJose'
    CONSTRAINT FK_FacturasSanJose_Clientes FOREIGN KEY (CustomerID) REFERENCES ClientesSanJose(CustomerID)
);
GO

-- Líneas de facturas San José
CREATE TABLE FacturasLineasSanJose (
    InvoiceLineID INT IDENTITY(1,1) PRIMARY KEY,
    InvoiceID INT NOT NULL,
    StockItemID INT NOT NULL,
    Description NVARCHAR(100) NOT NULL,
    PackageTypeID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(18,2),
    TaxRate DECIMAL(18,3) NOT NULL,
    TaxAmount DECIMAL(18,2) NOT NULL,
    LineProfit DECIMAL(18,2) NOT NULL,
    ExtendedPrice DECIMAL(18,2) NOT NULL,
    LastEditedBy INT NOT NULL DEFAULT 1,
    LastEditedWhen DATETIME2 NOT NULL DEFAULT GETDATE(),
    Sucursal NVARCHAR(20) DEFAULT 'SanJose',
    CONSTRAINT FK_FacturasLineasSanJose_Facturas FOREIGN KEY (InvoiceID) REFERENCES FacturasSanJose(InvoiceID),
    CONSTRAINT FK_FacturasLineasSanJose_Productos FOREIGN KEY (StockItemID) REFERENCES Productos(StockItemID)
);
GO

-- Aqui van las vistas para "alimentar" al corporativo con estadisticas y llenar las tablas de estadisticas en corporativo


-- ========== SUCURSAL LIMON ==========
USE WWI_Limon;
GO

-- Es igual que Sucursal Sanjose con otros nombres y en sucursal por defecto Limon

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
    LastEditedBy INT NOT NULL DEFAULT 1,
    ValidFrom DATETIME2 NOT NULL DEFAULT GETDATE(),
    ValidTo DATETIME2 NOT NULL DEFAULT '9999-12-31 23:59:59.9999999',
    Sucursal NVARCHAR(20) DEFAULT 'Limon',
    created_date DATETIME2 DEFAULT GETDATE()
);
GO

-- Productos y proveedores: Solo lectura por suscripcion
CREATE TABLE Productos (
    StockItemID INT PRIMARY KEY,
    StockItemName NVARCHAR(100) NOT NULL,
    SupplierID INT NOT NULL,
    ColorID INT,
    UnitPackageID INT NOT NULL,
    OuterPackageID INT NOT NULL,
    Brand NVARCHAR(50),
    Size NVARCHAR(20),
    LeadTimeDays INT NOT NULL,
    QuantityPerOuter INT NOT NULL,
    IsChillerStock BIT NOT NULL,
    Barcode NVARCHAR(50),
    TaxRate DECIMAL(18,3) NOT NULL,
    UnitPrice DECIMAL(18,2) NOT NULL,
    RecommendedRetailPrice DECIMAL(18,2),
    TypicalWeightPerUnit DECIMAL(18,3) NOT NULL,
    MarketingComments NVARCHAR(MAX),
    InternalComments NVARCHAR(MAX),
    Photo VARBINARY(MAX),
    CustomFields NVARCHAR(MAX),
    Tags NVARCHAR(MAX),
    SearchDetails NVARCHAR(MAX),
    LastEditedBy INT NOT NULL,
    ValidFrom DATETIME2 NOT NULL,
    ValidTo DATETIME2 NOT NULL
);
GO

CREATE TABLE Proveedores (
    SupplierID INT PRIMARY KEY,
    SupplierName NVARCHAR(100) NOT NULL,
    SupplierCategoryID INT NOT NULL,
    PrimaryContactPersonID INT NOT NULL,
    AlternateContactPersonID INT,
    DeliveryMethodID INT,
    DeliveryCityID INT NOT NULL,
    PostalCityID INT NOT NULL,
    SupplierReference NVARCHAR(20),
    BankAccountName NVARCHAR(50),
    BankAccountBranch NVARCHAR(50),
    BankAccountCode NVARCHAR(20),
    BankAccountNumber NVARCHAR(20),
    BankInternationalCode NVARCHAR(20),
    PaymentDays INT NOT NULL,
    InternalComments NVARCHAR(MAX),
    PhoneNumber NVARCHAR(20) NOT NULL,
    FaxNumber NVARCHAR(20) NOT NULL,
    WebsiteURL NVARCHAR(256) NOT NULL,
    DeliveryAddressLine1 NVARCHAR(60) NOT NULL,
    DeliveryAddressLine2 NVARCHAR(60),
    DeliveryPostalCode NVARCHAR(10) NOT NULL,
    PostalAddressLine1 NVARCHAR(60) NOT NULL,
    PostalAddressLine2 NVARCHAR(60),
    PostalPostalCode NVARCHAR(10) NOT NULL,
    DeliveryLocation GEOGRAPHY,
    LastEditedBy INT NOT NULL,
    ValidFrom DATETIME2 NOT NULL,
    ValidTo DATETIME2 NOT NULL
);
GO

CREATE TABLE Colores (
    ColorID INT PRIMARY KEY,
    ColorName NVARCHAR(20) NOT NULL,
    LastEditedBy INT NOT NULL,
    ValidFrom DATETIME2 NOT NULL,
    ValidTo DATETIME2 NOT NULL
);
GO

CREATE TABLE TiposEmpaque (
    PackageTypeID INT PRIMARY KEY,
    PackageTypeName NVARCHAR(50) NOT NULL,
    LastEditedBy INT NOT NULL,
    ValidFrom DATETIME2 NOT NULL,
    ValidTo DATETIME2 NOT NULL
);
GO

CREATE TABLE GruposProductos (
    StockGroupID INT PRIMARY KEY,
    StockGroupName NVARCHAR(50) NOT NULL,
    LastEditedBy INT NOT NULL,
    ValidFrom DATETIME2 NOT NULL,
    ValidTo DATETIME2 NOT NULL
);
GO

CREATE TABLE ProductosGrupos (
    StockItemStockGroupID INT PRIMARY KEY,
    StockItemID INT NOT NULL,
    StockGroupID INT NOT NULL,
    LastEditedBy INT NOT NULL,
    ValidFrom DATETIME2 NOT NULL,
    ValidTo DATETIME2 NOT NULL
    FOREIGN KEY (StockItemID) REFERENCES Productos(StockItemID),
    FOREIGN KEY (StockGroupID) REFERENCES GruposProductos(StockGroupID)
);
GO

-- Datos de unicamente La sucursal
CREATE TABLE InventarioLimon (
    StockItemID INT NOT NULL,
    QuantityOnHand INT NOT NULL,
    BinLocation NVARCHAR(20),
    LastStocktakeQuantity INT NOT NULL,
    LastCostPrice DECIMAL(18,2) NOT NULL,
    ReorderLevel INT NOT NULL,
    TargetStockLevel INT NOT NULL,
    LastEditedBy INT NOT NULL DEFAULT 1,
    LastEditedWhen DATETIME2 NOT NULL DEFAULT GETDATE(),
    Sucursal NVARCHAR(20) DEFAULT 'Limon',
    CONSTRAINT PK_InventarioLimon PRIMARY KEY (StockItemID),
    CONSTRAINT FK_InventarioLimon_Productos FOREIGN KEY (StockItemID) REFERENCES Productos(StockItemID)
);
GO

CREATE TABLE FacturasLimon (
    InvoiceID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    BillToCustomerID INT NOT NULL,
    OrderID INT,
    DeliveryMethodID INT NOT NULL,
    ContactPersonID INT NOT NULL,
    AccountsPersonID INT NOT NULL,
    SalespersonPersonID INT NOT NULL,
    PackedByPersonID INT,
    InvoiceDate DATE NOT NULL,
    CustomerPurchaseOrderNumber NVARCHAR(20),
    IsCreditNote BIT NOT NULL,
    CreditNoteReason NVARCHAR(MAX),
    Comments NVARCHAR(MAX),
    DeliveryInstructions NVARCHAR(MAX),
    InternalComments NVARCHAR(MAX),
    TotalDryItems INT NOT NULL,
    TotalChillerItems INT NOT NULL,
    DeliveryRun NVARCHAR(5),
    RunPosition NVARCHAR(5),
    ReturnedDeliveryData NVARCHAR(MAX),
    ConfirmedDeliveryTime DATETIME2,
    ConfirmedReceivedBy NVARCHAR(4000),
    LastEditedBy INT NOT NULL DEFAULT 1,
    LastEditedWhen DATETIME2 NOT NULL DEFAULT GETDATE(),
    Sucursal NVARCHAR(20) DEFAULT 'Limon',
    CONSTRAINT FK_FacturasLimon_Clientes FOREIGN KEY (CustomerID) REFERENCES ClientesLimon(CustomerID)
);
GO

CREATE TABLE FacturasLineasLimon (
    InvoiceLineID INT IDENTITY(1,1) PRIMARY KEY,
    InvoiceID INT NOT NULL,
    StockItemID INT NOT NULL,
    Description NVARCHAR(100) NOT NULL,
    PackageTypeID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(18,2),
    TaxRate DECIMAL(18,3) NOT NULL,
    TaxAmount DECIMAL(18,2) NOT NULL,
    LineProfit DECIMAL(18,2) NOT NULL,
    ExtendedPrice DECIMAL(18,2) NOT NULL,
    LastEditedBy INT NOT NULL DEFAULT 1,
    LastEditedWhen DATETIME2 NOT NULL DEFAULT GETDATE(),
    Sucursal NVARCHAR(20) DEFAULT 'Limon',
    CONSTRAINT FK_FacturasLineasLimon_Facturas FOREIGN KEY (InvoiceID) REFERENCES FacturasLimon(InvoiceID),
    CONSTRAINT FK_FacturasLineasLimon_Productos FOREIGN KEY (StockItemID) REFERENCES Productos(StockItemID)
);
GO

-- Visras para alimentar al corporativo con estadisticas y llenar las tablas de estadisticas en corporativo