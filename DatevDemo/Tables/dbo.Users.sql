CREATE TABLE [dbo].[Users] (
	[id] [bigint] NULL,
	[Status] [nchar](10) NULL,
	[DateRegistered] DATETIME NULL, 
    [FirstName] NVARCHAR(50) NOT NULL DEFAULT '', 
    [LastName] NVARCHAR(50) NOT NULL DEFAULT '' 
);

