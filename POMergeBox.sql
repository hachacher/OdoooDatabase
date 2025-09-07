CREATE TABLE [dbo].[POMergeBox] (
    [MergeId] INT NOT NULL,
    [BoxId]   INT NOT NULL,
    PRIMARY KEY CLUSTERED ([MergeId] ASC, [BoxId] ASC),
    FOREIGN KEY ([BoxId]) REFERENCES [dbo].[POBox] ([BoxId]),
    FOREIGN KEY ([MergeId]) REFERENCES [dbo].[POMerge] ([MergeId])
);


GO

