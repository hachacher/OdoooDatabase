CREATE TABLE [dbo].[Device] (
    [DeviceId]   INT              IDENTITY (1, 1) NOT NULL,
    [DeviceName] NVARCHAR (100)   NOT NULL,
    [LocationId] INT              NOT NULL,
    [DeviceUUID] UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [CreatedAt]  DATETIME         DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([DeviceId] ASC),
    FOREIGN KEY ([LocationId]) REFERENCES [dbo].[Location] ([LocationId])
);


GO

