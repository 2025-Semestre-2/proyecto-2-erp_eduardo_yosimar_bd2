-- ========================== Para la tabla de StockItemHolding :

-- Insertar un nuevo registro en StockItemHoldings
CREATE PROCEDURE sp_AgregarStockItemHolding
    @StockItemID INT,
    @QuantityOnHand INT,
    @BinLocation NVARCHAR(20),
    @LastStocktakeQuantity INT,
    @LastCostPrice DECIMAL(18,2),
    @ReorderLevel INT,
    @TargetStockLevel INT,
    @LastEditedBy INT,
    @Resultado SMALLINT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Verificar que el StockItemID no exista ya
        IF NOT EXISTS (SELECT 1 FROM Warehouse.StockItemHoldings WHERE StockItemID = @StockItemID)
        BEGIN
            INSERT INTO Warehouse.StockItemHoldings
            (StockItemID, QuantityOnHand, BinLocation, LastStocktakeQuantity, LastCostPrice, ReorderLevel, TargetStockLevel, LastEditedBy)
            VALUES
            (@StockItemID, @QuantityOnHand, @BinLocation, @LastStocktakeQuantity, @LastCostPrice, @ReorderLevel, @TargetStockLevel, @LastEditedBy);

            SET @Resultado = 1; -- Exito
        END
        ELSE
        BEGIN
            --PRINT 'Error en sp_AgregarListaServiciosHospedaje: ' + ERROR_MESSAGE();
            SET @Resultado = -1; -- StockItemID ya existe
        END
    END TRY
    BEGIN CATCH
        SET @Resultado = -99; -- Error inesperado
    END CATCH
END;
GO


-- Actualizar un registro existente en StockItemHoldings
CREATE PROCEDURE sp_ActualizarStockItemHolding
    @StockItemID INT,
    @QuantityOnHand INT,
    @BinLocation NVARCHAR(20),
    @LastStocktakeQuantity INT,
    @LastCostPrice DECIMAL(18,2),
    @ReorderLevel INT,
    @TargetStockLevel INT,
    @LastEditedBy INT,
    @Resultado SMALLINT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Verificar que el StockItemID exista
        IF EXISTS (SELECT 1 FROM Warehouse.StockItemHoldings WHERE StockItemID = @StockItemID)
        BEGIN
            UPDATE Warehouse.StockItemHoldings
            SET QuantityOnHand = @QuantityOnHand,
                BinLocation = @BinLocation,
                LastStocktakeQuantity = @LastStocktakeQuantity,
                LastCostPrice = @LastCostPrice,
                ReorderLevel = @ReorderLevel,
                TargetStockLevel = @TargetStockLevel,
                LastEditedBy = @LastEditedBy
            WHERE StockItemID = @StockItemID;

            SET @Resultado = 1; -- Exito
        END
        ELSE
        BEGIN
            SET @Resultado = -1; -- StockItemID no existe
        END
    END TRY
    BEGIN CATCH
        --PRINT 'Error en sp_ActualizarListaServiciosHospedaje: ' + ERROR_MESSAGE();
        SET @Resultado = -99; -- Error inesperado
    END CATCH
END;
GO


-- Eliminar un registro de StockItemHoldings
CREATE PROCEDURE sp_EliminarStockItemHolding
    @StockItemID INT,
    @Resultado SMALLINT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Verificar que el StockItemID exista
        IF EXISTS (SELECT 1 FROM Warehouse.StockItemHoldings WHERE StockItemID = @StockItemID)
        BEGIN
            DELETE FROM Warehouse.StockItemHoldings WHERE StockItemID = @StockItemID;
            SET @Resultado = 1; -- Exito
        END
        ELSE
        BEGIN
            SET @Resultado = -1; -- StockItemID no existe
        END
    END TRY
    BEGIN CATCH
        SET @Resultado = -99; -- Error inesperado
    END CATCH
END;
GO




-- ========================== Para la tabla de StockItem :

-- Insertar un nuevo registro en StockItems
CREATE PROCEDURE sp_AgregarStockItem
    @StockItemName NVARCHAR(100),
    @SupplierID INT,
    @ColorID INT = NULL,
    @UnitPackageID INT,
    @OuterPackageID INT,
    @Brand NVARCHAR(50) = NULL,
    @Size NVARCHAR(20) = NULL,
    @LeadTimeDays INT,
    @QuantityPerOuter INT,
    @IsChillerStock BIT,
    @Barcode NVARCHAR(50) = NULL,
    @TaxRate DECIMAL(18,3),
    @UnitPrice DECIMAL(18,2),
    @RecommendedRetailPrice DECIMAL(18,2) = NULL,
    @TypicalWeightPerUnit DECIMAL(18,3),
    @MarketingComments NVARCHAR(MAX) = NULL,
    @InternalComments NVARCHAR(MAX) = NULL,
    @Photo VARBINARY(MAX) = NULL,
    @CustomFields NVARCHAR(MAX) = NULL,
    @Resultado SMALLINT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Verificar que el nombre del item sea unico
        IF NOT EXISTS (SELECT 1 FROM Warehouse.StockItems WHERE StockItemName = @StockItemName)
        BEGIN
            INSERT INTO Warehouse.StockItems(StockItemName, SupplierID, ColorID, UnitPackageID, OuterPackageID, Brand, Size, LeadTimeDays,
                QuantityPerOuter, IsChillerStock, Barcode, TaxRate, UnitPrice, RecommendedRetailPrice,
                TypicalWeightPerUnit, MarketingComments, InternalComments, Photo, CustomFields)

            VALUES (@StockItemName, @SupplierID, @ColorID, @UnitPackageID, @OuterPackageID, @Brand, @Size, @LeadTimeDays,
                @QuantityPerOuter, @IsChillerStock, @Barcode, @TaxRate, @UnitPrice, @RecommendedRetailPrice,
                @TypicalWeightPerUnit, @MarketingComments, @InternalComments, @Photo, @CustomFields);

            SET @Resultado = 1; -- Exito
        END
        ELSE
        BEGIN
            SET @Resultado = -1; -- Nombre duplicado del producto
        END
    END TRY
    BEGIN CATCH
        SET @Resultado = -99; -- Error inesperado
    END CATCH
END;
GO


-- Actualizar un registro existente en StockItems
CREATE PROCEDURE sp_ActualizarStockItem
    @StockItemID INT,
    @StockItemName NVARCHAR(100),
    @SupplierID INT,
    @ColorID INT = NULL,
    @UnitPackageID INT,
    @OuterPackageID INT,
    @Brand NVARCHAR(50) = NULL,
    @Size NVARCHAR(20) = NULL,
    @LeadTimeDays INT,
    @QuantityPerOuter INT,
    @IsChillerStock BIT,
    @Barcode NVARCHAR(50) = NULL,
    @TaxRate DECIMAL(18,3),
    @UnitPrice DECIMAL(18,2),
    @RecommendedRetailPrice DECIMAL(18,2) = NULL,
    @TypicalWeightPerUnit DECIMAL(18,3),
    @MarketingComments NVARCHAR(MAX) = NULL,
    @InternalComments NVARCHAR(MAX) = NULL,
    @Photo VARBINARY(MAX) = NULL,
    @CustomFields NVARCHAR(MAX) = NULL,
    @Resultado SMALLINT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Verificar que el item exista
        IF EXISTS (SELECT 1 FROM Warehouse.StockItems WHERE StockItemID = @StockItemID)
        BEGIN
            -- Verificar que el nombre no este duplicado en otro item
            IF NOT EXISTS (SELECT 1 FROM Warehouse.StockItems WHERE StockItemName = @StockItemName AND StockItemID <> @StockItemID)
            BEGIN
                UPDATE Warehouse.StockItems
                SET StockItemName = @StockItemName,
                    SupplierID = @SupplierID,
                    ColorID = @ColorID,
                    UnitPackageID = @UnitPackageID,
                    OuterPackageID = @OuterPackageID,
                    Brand = @Brand,
                    Size = @Size,
                    LeadTimeDays = @LeadTimeDays,
                    QuantityPerOuter = @QuantityPerOuter,
                    IsChillerStock = @IsChillerStock,
                    Barcode = @Barcode,
                    TaxRate = @TaxRate,
                    UnitPrice = @UnitPrice,
                    RecommendedRetailPrice = @RecommendedRetailPrice,
                    TypicalWeightPerUnit = @TypicalWeightPerUnit,
                    MarketingComments = @MarketingComments,
                    InternalComments = @InternalComments,
                    Photo = @Photo,
                    CustomFields = @CustomFields
                WHERE StockItemID = @StockItemID;

                SET @Resultado = 1; -- Exito
            END
            ELSE
            BEGIN
                SET @Resultado = -2; -- Nombre duplicado
            END
        END
        ELSE
        BEGIN
            SET @Resultado = -1; -- Item no existe
        END
    END TRY
    BEGIN CATCH
        SET @Resultado = -99; -- Error inesperado
    END CATCH
END;
GO


-- Eliminar un registro de StockItems
CREATE PROCEDURE sp_EliminarStockItem
    @StockItemID INT,
    @Resultado SMALLINT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Verificar que el item no tenga transacciones asociadas, eso y creo que falta verificar que no esten facturados, pero no me acuerdo si esta tenia las dos.
        IF NOT EXISTS (SELECT 1 FROM Warehouse.StockItemTransactions WHERE StockItemID = @StockItemID)
        BEGIN
            DELETE FROM Warehouse.StockItems WHERE StockItemID = @StockItemID;
            SET @Resultado = 1; -- Exito
        END
        ELSE
        BEGIN
            SET @Resultado = -1; -- Item con transacciones asociadas
        END
    END TRY
    BEGIN CATCH
        SET @Resultado = -99; -- Error inesperado
    END CATCH
END;
GO



-- ========================== Para la tabla de StockItemTransactions : <- Este era el importante que hay que revisar.

-- Insertar un nuevo registro en StockItemTransactions
CREATE PROCEDURE sp_AgregarStockItemTransaction
    @StockItemID INT,
    @TransactionTypeID INT,
    @CustomerID INT = NULL,
    @InvoiceID INT = NULL,
    @SupplierID INT = NULL,
    @PurchaseOrderID INT = NULL,
    @TransactionOccurredWhen DATETIME2(7),
    @Quantity DECIMAL(18,3),
    @LastEditedBy INT,
    @Resultado SMALLINT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Insertar siempre que el StockItemID exista en la tabla de StockItems
        IF EXISTS (SELECT 1 FROM Warehouse.StockItems WHERE StockItemID = @StockItemID)
        BEGIN
            INSERT INTO Warehouse.StockItemTransactions
            (StockItemID, TransactionTypeID, CustomerID, InvoiceID, SupplierID, PurchaseOrderID,
             TransactionOccurredWhen, Quantity, LastEditedBy)
            VALUES
            (@StockItemID, @TransactionTypeID, @CustomerID, @InvoiceID, @SupplierID, @PurchaseOrderID,
             @TransactionOccurredWhen, @Quantity, @LastEditedBy);

            SET @Resultado = 1; -- Exito
        END
        ELSE
        BEGIN
            SET @Resultado = -1; -- StockItemID no existe
        END
    END TRY
    BEGIN CATCH
        SET @Resultado = -99; -- Error inesperado
    END CATCH
END;
GO


-- Actualizar un registro existente en StockItemTransactions
CREATE PROCEDURE sp_ActualizarStockItemTransaction
    @StockItemTransactionID INT,
    @StockItemID INT,
    @TransactionTypeID INT,
    @CustomerID INT = NULL,
    @InvoiceID INT = NULL,
    @SupplierID INT = NULL,
    @PurchaseOrderID INT = NULL,
    @TransactionOccurredWhen DATETIME2(7),
    @Quantity DECIMAL(18,3),
    @LastEditedBy INT,
    @Resultado SMALLINT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Verificar que la transaccion exista
        IF EXISTS (SELECT 1 FROM Warehouse.StockItemTransactions WHERE StockItemTransactionID = @StockItemTransactionID)
        BEGIN
            UPDATE Warehouse.StockItemTransactions
            SET StockItemID = @StockItemID,
                TransactionTypeID = @TransactionTypeID,
                CustomerID = @CustomerID,
                InvoiceID = @InvoiceID,
                SupplierID = @SupplierID,
                PurchaseOrderID = @PurchaseOrderID,
                TransactionOccurredWhen = @TransactionOccurredWhen,
                Quantity = @Quantity,
                LastEditedBy = @LastEditedBy
            WHERE StockItemTransactionID = @StockItemTransactionID;

            SET @Resultado = 1; -- Exito
        END
        ELSE
        BEGIN
            SET @Resultado = -1; -- Transaccion no existe
        END
    END TRY
    BEGIN CATCH
        SET @Resultado = -99; -- Error inesperado
    END CATCH
END;
GO


-- Eliminar un registro de StockItemTransactions
CREATE PROCEDURE sp_EliminarStockItemTransaction
    @StockItemTransactionID INT,
    @Resultado SMALLINT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        -- Verificar que la transaccion exista
        IF EXISTS (SELECT 1 FROM Warehouse.StockItemTransactions WHERE StockItemTransactionID = @StockItemTransactionID)
        BEGIN
            DELETE FROM Warehouse.StockItemTransactions WHERE StockItemTransactionID = @StockItemTransactionID;
            SET @Resultado = 1; -- Exito
        END
        ELSE
        BEGIN
            SET @Resultado = -1; -- Transaccion no existe
        END
    END TRY
    BEGIN CATCH
        SET @Resultado = -99; -- Error inesperado
    END CATCH
END;
GO

