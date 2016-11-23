CREATE PROCEDURE [dbo].[SaySomething](@message NVARCHAR(5), @counter INT)
AS

WHILE(@counter > 0)
BEGIN
PRINT @message + ' ' + CAST(@counter AS NVARCHAR(2))
SET @counter = @counter - 1
END