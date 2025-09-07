CREATE TABLE [dbo].[InventoryMergeSession] (
    [MergeId]   INT NOT NULL,
    [SessionId] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([MergeId] ASC, [SessionId] ASC),
    FOREIGN KEY ([MergeId]) REFERENCES [dbo].[InventoryMerge] ([MergeId]),
    FOREIGN KEY ([SessionId]) REFERENCES [dbo].[InventorySession] ([SessionId])
);


GO

