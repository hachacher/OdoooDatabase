CREATE TABLE [dbo].[POMergedItem] (
    [MergeItemId]   INT            IDENTITY (1, 1) NOT NULL,
    [MergeId]       INT            NOT NULL,
    [Barcode]       NVARCHAR (100) NOT NULL,
    [TotalQuantity] INT            NOT NULL,
    PRIMARY KEY CLUSTERED ([MergeItemId] ASC),
    FOREIGN KEY ([MergeId]) REFERENCES [dbo].[POMerge] ([MergeId])
);


GO

