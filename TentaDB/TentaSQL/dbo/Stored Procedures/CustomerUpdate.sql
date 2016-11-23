CREATE PROCEDURE CustomerUpdate (@CustomerID NVARCHAR(5),@CompanyName NVARCHAR(40),@ContactName NVARCHAR(30),@ContactTitle NVARCHAR(30),@Address NVARCHAR(60), 
								 @City NVARCHAR(15),@Region NVARCHAR(15),@PostalCode NVARCHAR(10),@Country NVARCHAR(15),@Phone NVARCHAR(24),
								 @Fax NVARCHAR(24))
AS
UPDATE [dbo].[Customers]
SET	[CompanyName] = @CompanyName,
    [ContactName] = @ContactName,
    [ContactTitle] = @ContactTitle,
	[Address] = @Address,
    [City] = @City,
    [Region] = @Region,
    [PostalCode] = @PostalCode,
    [Country] = @Country,
    [Phone] = @Phone,
    [Fax] = @Fax
WHERE [CustomerID]=@CustomerID