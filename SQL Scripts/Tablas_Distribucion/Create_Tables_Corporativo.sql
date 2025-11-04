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
    active BIT NOT NULL DEFAULT 1
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
    
);