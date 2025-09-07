CREATE TABLE [dbo].[User] (
    [UserId]       INT            IDENTITY (1, 1) NOT NULL,
    [UserName]     NVARCHAR (100) NOT NULL,
    [PasswordHash] NVARCHAR (200) NULL,
    [Role]         NVARCHAR (20)  NOT NULL,
    [LocationId]   INT            NOT NULL,
    [Inactive]     BIT            NULL,
    PRIMARY KEY CLUSTERED ([UserId] ASC),
    CHECK ([Role]='Employee' OR [Role]='Manager'),
    FOREIGN KEY ([LocationId]) REFERENCES [dbo].[Location] ([LocationId])
);


GO

