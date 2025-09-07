CREATE TABLE [dbo].[InventoryMerge] (
    [MergeId]    INT      IDENTITY (1, 1) NOT NULL,
    [MergeDate]  DATETIME DEFAULT (getdate()) NOT NULL,
    [LocationId] INT      NOT NULL,
    PRIMARY KEY CLUSTERED ([MergeId] ASC),
    FOREIGN KEY ([LocationId]) REFERENCES [dbo].[Location] ([LocationId])
);


GO

