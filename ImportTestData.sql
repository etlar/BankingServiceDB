USE master;
GO
USE BankingService;
GO
BULK INSERT [BankingServiceSchema].[Bank]
FROM 'C:\Users\egor\Desktop\SQL Projects\BanksTestData - Sheet1.csv'
WITH 
	(
	FORMAT = 'CSV',
	FIRSTROW=2,
	FIELDTERMINATOR = ',', 
	ROWTERMINATOR = '\n'
	);
GO
BULK INSERT [BankingServiceSchema].[OperationType]
FROM 'C:\Users\egor\Desktop\SQL Projects\OperationTypeTestData - Sheet1.csv'
WITH 
	(
	FORMAT = 'CSV',
	FIRSTROW=2,
	FIELDTERMINATOR = ',', 
	ROWTERMINATOR = '\n'
	);
GO
BULK INSERT [BankingServiceSchema].[Operation]
FROM 'C:\Users\egor\Desktop\SQL Projects\OperationsTestData - Sheet1.csv'
WITH 
	(
	FORMAT = 'CSV',
	FIRSTROW=2,
	FIELDTERMINATOR = ',', 
	ROWTERMINATOR = '\n'
	);
GO
BULK INSERT [BankingServiceSchema].[Client]
FROM 'C:\Users\egor\Desktop\SQL Projects\ClientsTestData - Sheet1.csv'
WITH 
	(
	FORMAT = 'CSV',
	FIRSTROW=2,
	FIELDTERMINATOR = ',', 
	ROWTERMINATOR = '\n'
	);