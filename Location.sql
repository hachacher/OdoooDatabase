CREATE TABLE [dbo].[Location] (
    [LocationId] INT            IDENTITY (1, 1) NOT NULL,
    [Name]       NVARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([LocationId] ASC),
    CONSTRAINT [UQ_Location_Name] UNIQUE NONCLUSTERED ([Name] ASC)
);


GO

