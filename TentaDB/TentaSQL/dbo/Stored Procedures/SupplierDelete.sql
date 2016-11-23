
CREATE PROCEDURE SupplierDelete (@SupplierID INT)
AS
DELETE
FROM [dbo].[Suppliers]
WHERE [SupplierID]=@SupplierID