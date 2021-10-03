USE master;
GO
CREATE DATABASE BankingService
ON PRIMARY
(
	NAME = BankingService_dat1, --- Основной файл
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BankingService\banking_service_dat1.mdf',
	SIZE = 100MB,
	MAXSIZE = 200,
	FILEGROWTH = 20
),
(
	NAME = BankingService_dat2, --- Вторичный файл
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BankingService\banking_service_dat2.ndf',
	SIZE = 100MB,
	MAXSIZE = 200,
	FILEGROWTH = 20
)
LOG ON 
(
	NAME = BankingService_log, -- Файл транзакций
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BankingService\banking_service_log.ldf',
	SIZE = 50MB,
	MAXSIZE = 200,
	FILEGROWTH = 20
)
GO
USE BankingService;
GO
--- Создаем схему для БД, чтобы в контексте схемы создать необходимые таблицы
CREATE SCHEMA [BankingServiceSchema];
GO
CREATE TABLE [BankingServiceSchema].[Client]
(
	ClientId UNIQUEIDENTIFIER PRIMARY KEY NOT NULL DEFAULT NEWID(),
	ClientSurname NVARCHAR(50) NOT NULL,
	ClientName NVARCHAR(50) NOT NULL,
	ClientPatronymic NVARCHAR(50),
	ClientPhone NVARCHAR(12) NOT NULL,
	ClientAddress NVARCHAR(150) NOT NULL,
	UNIQUE(ClientPhone)
);
GO
CREATE TABLE [BankingServiceSchema].[Bank]
(
	BankId UNIQUEIDENTIFIER PRIMARY KEY NOT NULL DEFAULT NEWID(),
	BankName NVARCHAR(100) NOT NULL,
	BankPhone NVARCHAR(12) NOT NULL,
	BankAddress NVARCHAR(150) NOT NULL,
	BankChairman NVARCHAR(150) NOT NULL,
	BankClientId UNIQUEIDENTIFIER,
	CONSTRAINT FK_Bank_Client FOREIGN KEY (BankClientId)  REFERENCES [BankingServiceSchema].[Client] (ClientId),
	UNIQUE(BankPhone)
);
CREATE TABLE [BankingServiceSchema].[OperationType]
(
	OperationTypeId INT PRIMARY KEY IDENTITY,
	OperationTypeName NVARCHAR(100) NOT NULL
);
GO
CREATE TABLE [BankingServiceSchema].[Operation]
(
	OperationId UNIQUEIDENTIFIER PRIMARY KEY NOT NULL DEFAULT NEWID(),
	OperationName NVARCHAR(100) NOT NULL,
	OperationSum DECIMAL(19, 2) NOT NULL,
	OperationPercent DECIMAL(5, 2) CHECK (OperationPercent >= 0 AND OperationPercent < 100) DEFAULT 0,
	OperationTypeId INT,
	OperationBankId UNIQUEIDENTIFIER,
	CONSTRAINT FK_Operation_OperationType FOREIGN KEY (OperationTypeId)  REFERENCES [BankingServiceSchema].[OperationType] (OperationTypeId),
	CONSTRAINT FK_Client_Operation FOREIGN KEY (OperationBankId)  REFERENCES [BankingServiceSchema].[Bank] (BankId),
);
GO



