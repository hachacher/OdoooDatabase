CREATE TABLE [dbo].[POItem] (
    [ItemId]    INT            IDENTITY (1, 1) NOT NULL,
    [BoxId]     INT            NOT NULL,
    [Barcode]   NVARCHAR (100) NOT NULL,
    [Quantity]  INT            NOT NULL,
    [ScannedAt] DATETIME       DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ItemId] ASC),
    FOREIGN KEY ([BoxId]) REFERENCES [dbo].[POBox] ([BoxId])
);


GO

