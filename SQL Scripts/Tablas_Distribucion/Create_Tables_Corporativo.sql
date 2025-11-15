-- Tablas para distribución de Corporativo
USE master;
GO
-- Base de datos Corporativo
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Corporativo')
BEGIN
    CREATE DATABASE WWI_Corporativo;
END
GO

-- FIN CREACION DE BASES DE DATOS

USE WWI_Corporativo;
GO

-- Creación de tablas fragmentadas para Corporativo
-- Tabla de usuarios (completa)
CREATE TABLE Usuarios (
    iduser INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password_hash VARCHAR(255) NOT NULL, -- Pendiente a revisar
    fullname VARCHAR(100) NOT NULL,
    active BIT NOT NULL DEFAULT 1,
    rol VARCHAR(20) CHECK (rol IN ('Administrador', 'Corporativo')) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    hiredate DATETIME DEFAULT GETDATE(),
    sucursal VARCHAR(20) CHECK (sucursal IN ('SanJose', 'Limon', 'Corporativo')) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()
);
GO

-- Tabla de datos sensibles de clientes
CREATE TABLE ClientesDatosSensibles (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL,
    PhoneNumber NVARCHAR(20),
    FaxNumber NVARCHAR(20),
    WebsiteURL NVARCHAR(256),
    DeliveryAddressLine1 NVARCHAR(60),
    DeliveryAddressLine2 NVARCHAR(60),
    DeliveryPostalCode NVARCHAR(10),
    PostalAddressLine1 NVARCHAR(60),
    PostalAddressLine2 NVARCHAR(60),
    PostalPostalCode NVARCHAR(10),
    DeliveryLocation GEOGRAPHY
);
GO

-- Tabla de productos (Para publicacion)
CREATE TABLE ProductosMaestro (
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
    LastEditedBy INT NOT NULL DEFAULT 1,
    ValidFrom DATETIME2 NOT NULL DEFAULT GETDATE(),
    ValidTo DATETIME2 NOT NULL DEFAULT '9999-12-31 23:59:59.9999999',
    IsActive BIT DEFAULT 1,
);
GO

-- Tabla de proveedores (Para publicacion)
CREATE TABLE ProveedoresMaestro (
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
    LastEditedBy INT NOT NULL DEFAULT 1,
    ValidFrom DATETIME2 NOT NULL DEFAULT GETDATE(),
    ValidTo DATETIME2 NOT NULL DEFAULT '9999-12-31 23:59:59.9999999'
);
GO

-- Tablas de relaciones para productos (se traen datos de WWI en replicación)
CREATE TABLE Colores (
    ColorID INT PRIMARY KEY,
    ColorName NVARCHAR(20) NOT NULL,
    LastEditedBy INT NOT NULL DEFAULT 1,
    ValidFrom DATETIME2 NOT NULL DEFAULT GETDATE(),
    ValidTo DATETIME2 NOT NULL DEFAULT '9999-12-31 23:59:59.9999999'
);
GO

CREATE TABLE TiposEmpaque (
    PackageTypeID INT PRIMARY KEY,
    PackageTypeName NVARCHAR(50) NOT NULL,
    LastEditedBy INT NOT NULL DEFAULT 1,
    ValidFrom DATETIME2 NOT NULL DEFAULT GETDATE(),
    ValidTo DATETIME2 NOT NULL DEFAULT '9999-12-31 23:59:59.9999999'
);
GO

CREATE TABLE GruposProductos (
    StockGroupID INT PRIMARY KEY,
    StockGroupName NVARCHAR(50) NOT NULL,
    LastEditedBy INT NOT NULL DEFAULT 1,
    ValidFrom DATETIME2 NOT NULL DEFAULT GETDATE(),
    ValidTo DATETIME2 NOT NULL DEFAULT '9999-12-31 23:59:59.9999999'
);
GO

CREATE TABLE ProductosGrupos (
    StockItemStockGroupID INT PRIMARY KEY,
    StockItemID INT NOT NULL,
    StockGroupID INT NOT NULL,
    LastEditedBy INT NOT NULL DEFAULT 1,
    ValidFrom DATETIME2 NOT NULL DEFAULT GETDATE(),
    ValidTo DATETIME2 NOT NULL DEFAULT '9999-12-31 23:59:59.9999999',
    FOREIGN KEY (StockItemID) REFERENCES ProductosMaestro(StockItemID),
    FOREIGN KEY (StockGroupID) REFERENCES GruposProductosMaestro(StockGroupID)
);
GO

-- Tablas para estadisticas por sucursal (suscritas para obtener información de sucursales)
