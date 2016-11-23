CREATE PROCEDURE InsertRegionAndTerritory (@TerritoryID NVARCHAR(20), @TerritoryDescription NCHAR(50), @RegionDescription NCHAR(50))
AS
DECLARE @RegionID INT;
SET @RegionID = (SELECT MAX(r.RegionID) FROM Region r) + 1;
INSERT INTO [dbo].[Region] ([RegionDescription], [RegionID])
VALUES (@RegionDescription,@RegionID)

INSERT INTO [dbo].[Territories] ([RegionID],[TerritoryDescription],[TerritoryID])
VALUES (@RegionID, @TerritoryDescription, @TerritoryID)

SELECT MAX(r.RegionID)
FROM Region r