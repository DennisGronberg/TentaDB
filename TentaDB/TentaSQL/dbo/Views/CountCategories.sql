﻿CREATE VIEW [dbo].[CountCategories]
	AS
	SELECT COUNT(*) AS NumberOfCategories
	FROM [dbo].[Categories]