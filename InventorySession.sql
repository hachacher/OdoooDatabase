CREATE TABLE [dbo].[InventorySession] (
    [SessionId]   INT            IDENTITY (1, 1) NOT NULL,
    [SessionName] NVARCHAR (200) NOT NULL,
    [ManagerId]   INT            NOT NULL,
    [EmployeeId]  INT            NOT NULL,
    [LocationId]  INT            NOT NULL,
    [DeviceId]    INT            NULL,
    [Status]      NVARCHAR (20)  NOT NULL,
    [StartDate]   DATETIME       DEFAULT (getdate()) NOT NULL,
    [EndDate]     DATETIME       NULL,
    [IsDeleted]   BIT            DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([SessionId] ASC),
    CHECK ([Status]='Posted' OR [Status]='Unposted'),
    FOREIGN KEY ([DeviceId]) REFERENCES [dbo].[Device] ([DeviceId]),
    FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[User] ([UserId]),
    FOREIGN KEY ([LocationId]) REFERENCES [dbo].[Location] ([LocationId]),
    FOREIGN KEY ([ManagerId]) REFERENCES [dbo].[User] ([UserId])
);


GO

