CREATE PROCEDURE ShipperOrders (@ShippedAfter datetime ,@CompanyName nvarchar(40))
AS
SELECT *
FROM Orders o
INNER JOIN Shippers s ON o.ShipVia = s.ShipperID
WHERE (s.CompanyName = @CompanyName) AND (o.ShippedDate > @ShippedAfter)