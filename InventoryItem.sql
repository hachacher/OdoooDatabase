CREATE TABLE [dbo].[InventoryItem] (
    [ItemId]    INT            IDENTITY (1, 1) NOT NULL,
    [SessionId] INT            NOT NULL,
    [Barcode]   NVARCHAR (100) NOT NULL,
    [Quantity]  INT            NOT NULL,
    [ScannedAt] DATETIME       DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ItemId] ASC),
    FOREIGN KEY ([SessionId]) REFERENCES [dbo].[InventorySession] ([SessionId])
);


GO

