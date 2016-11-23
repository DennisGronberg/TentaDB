--CREATE PROCEDURE InsertRegion (@RegionID int, @RegionDescription nchar(50))
--AS
--INSERT INTO [dbo].[Region]
--([RegionID],[RegionDescription])
--VALUSE (@RegionID,@RegionDescription)
--GO

---------------------------------------------------------------

--DECLARE @counter INT
--SET @counter = 5
--WHILE (@counter < 10)
--BEGIN
--	EXEC InsertRegion @counter, 'test region'
--	SET @counter = @counter + 1
--END

------------------------------------------------------------------

--CREATE PROCEDURE UpdateRegion (@RegionID int, @RegionDescription nchar(50))
--AS
--UPDATE [dbo].[Region]
--SET [RegionDescription]=@RegionDescription
--WHERE [RegionID]=@RegionID
--GO

--------------------------------------------

--EXEC UpdateRegion 5, 'Simsalabim'


CREATE PROCEDURE EmployeeTotalSales (@EmployeeID INT)
AS

	SELECT SUM(od.UnitPrice*od.Quantity*(1-od.Discount)) AS Expr1, e.EmployeeID
	FROM Employees e INNER JOIN
                         Orders o ON e.EmployeeID = o.EmployeeID INNER JOIN
                         [Order Details]  od ON o.OrderID = od.OrderID
	WHERE e.EmployeeID = @EmployeeID
	GROUP BY e.EmployeeID

EXEC EmployeeTotalSales 3