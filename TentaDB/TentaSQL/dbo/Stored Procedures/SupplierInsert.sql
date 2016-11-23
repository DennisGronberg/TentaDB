
CREATE PROCEDURE SupplierInsert (@CompanyName NVARCHAR(40),
								 @ContactName NVARCHAR(30),
								 @ContactTitle NVARCHAR(30),
								 @Address NVARCHAR(60), 
								 @City NVARCHAR(15), 
								 @Region NVARCHAR(15), 
								 @PostalCode NVARCHAR(10), 
								 @Country NVARCHAR(15),
								 @Phone NVARCHAR(24),
								 @Fax NVARCHAR(24),
								 @HomePage NTEXT)
AS
INSERT INTO [dbo].[Suppliers]
           ([CompanyName]
           ,[ContactName]
           ,[ContactTitle]
           ,[Address]
           ,[City]
           ,[Region]
           ,[PostalCode]
           ,[Country]
           ,[Phone]
           ,[Fax]
           ,[HomePage])
VALUES (
		   @CompanyName,
           @ContactName,
           @ContactTitle,
           @Address,
           @City,
           @Region,
           @PostalCode,
           @Country,
           @Phone,
           @Fax,
           @HomePage
	)
SELECT TOP 1 s.SupplierID
FROM Suppliers s 
ORDER BY s.SupplierID DESC