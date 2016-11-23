
CREATE PROCEDURE ProductSearch (@produktnamn nvarchar(40), @maxpris money, @minpris money, @supplier nvarchar(40))
AS
SELECT p.ProductName, p.UnitPrice, s.CompanyName, s.Region, s.City, s.PostalCode
FROM Suppliers s
INNER JOIN Products p ON s.SupplierID = p.SupplierID
WHERE (p.UnitPrice BETWEEN @minpris AND @maxpris) AND (s.CompanyName = @supplier) AND (p.ProductName LIKE '%'+@produktnamn+'%')