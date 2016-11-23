CREATE TABLE [dbo].[CustomerContactNameChanges] (
    [ContactNameChangesID] INT           IDENTITY (1, 1) NOT NULL,
    [Customer]             NVARCHAR (40) NOT NULL,
    [OldName]              NVARCHAR (30) NOT NULL,
    [NewName]              NVARCHAR (30) NOT NULL,
    [ChangedDate]          DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([ContactNameChangesID] ASC)
);

