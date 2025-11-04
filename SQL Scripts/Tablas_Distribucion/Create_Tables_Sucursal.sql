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