CREATE TABLE [dbo].[Users] (
    [Id]       INT            IDENTITY (1, 1) NOT NULL,
    [UserName] NVARCHAR (100) NOT NULL,
    [Location] NVARCHAR (100) NOT NULL,
    [Type]     INT            NULL,
    [Password] NVARCHAR (MAX) NULL,
    [Inactive] BIT            CONSTRAINT [DEFAULT_Users_Inactive] DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UQ_Users_UserName_Location] UNIQUE NONCLUSTERED ([UserName] ASC, [Location] ASC)
);


GO

CREATE TABLE [dbo].[InventoryEntries] (
    [Id]        BIGINT         IDENTITY (1, 1) NOT NULL,
    [SessionId] BIGINT         NOT NULL,
    [Barcode]   NVARCHAR (MAX) NOT NULL,
    [Quantity]  INT            DEFAULT ((1)) NOT NULL,
    [ScannedAt] DATETIME       DEFAULT (getdate()) NOT NULL,
    [Comment]   NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_InventoryEntries_Sessions] FOREIGN KEY ([SessionId]) REFERENCES [dbo].[InventorySessions] ([Id]) ON DELETE CASCADE
);


GO

CREATE TABLE [dbo].[Locations] (
    [Id]       INT            IDENTITY (1, 1) NOT NULL,
    [Location] NVARCHAR (MAX) NOT NULL,
    [active]   BIT            NOT NULL,
    CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

CREATE TABLE [dbo].[InventoryMergeSessions] (
    [MergeId]   BIGINT NOT NULL,
    [SessionId] BIGINT NOT NULL,
    CONSTRAINT [PK_InventoryMergeSessions] PRIMARY KEY CLUSTERED ([MergeId] ASC, [SessionId] ASC),
    CONSTRAINT [FK_InventoryMergeSessions_Merges] FOREIGN KEY ([MergeId]) REFERENCES [dbo].[InventoryMerges] ([MergeId]) ON DELETE CASCADE,
    CONSTRAINT [FK_InventoryMergeSessions_Sessions] FOREIGN KEY ([SessionId]) REFERENCES [dbo].[InventorySessions] ([Id]) ON DELETE CASCADE
);


GO

CREATE TABLE [dbo].[InventorySessions] (
    [Id]          BIGINT         IDENTITY (1, 1) NOT NULL,
    [UserId]      INT            NOT NULL,
    [Location]    NVARCHAR (MAX) NULL,
    [StartDate]   DATETIME       DEFAULT (getdate()) NOT NULL,
    [EndDate]     DATETIME       NULL,
    [IsPosted]    BIT            DEFAULT ((0)) NOT NULL,
    [SessionName] NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_InventorySessions_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE CASCADE
);


GO

CREATE TABLE [dbo].[InventoryMerges] (
    [MergeId]     BIGINT         IDENTITY (1, 1) NOT NULL,
    [MergeName]   NVARCHAR (200) NOT NULL,
    [Location]    NVARCHAR (MAX) NULL,
    [MergedAt]    DATETIME       CONSTRAINT [DF_InventoryMerges_MergedAt] DEFAULT (getdate()) NOT NULL,
    [PerformedBy] INT            NOT NULL,
    [IsPosted]    BIT            CONSTRAINT [DF_InventoryMerges_IsPosted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_InventoryMerges] PRIMARY KEY CLUSTERED ([MergeId] ASC),
    CONSTRAINT [FK_InventoryMerges_Users] FOREIGN KEY ([PerformedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO

