CREATE TABLE [dbo].[InventoryMergedItem] (
    [MergeItemId]   INT            IDENTITY (1, 1) NOT NULL,
    [MergeId]       INT            NOT NULL,
    [Barcode]       NVARCHAR (100) NOT NULL,
    [TotalQuantity] INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([MergeItemId] ASC),
    FOREIGN KEY ([MergeId]) REFERENCES [dbo].[InventoryMerge] ([MergeId])
);


GO

