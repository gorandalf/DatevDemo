USE [DatevDemo]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 14.12.2016 00:55:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [dbo].[Users] ;

CREATE TABLE [dbo].[Users](
	[id] [bigint] NULL,
	[Status] [nchar](10) NULL,
	[FullName] [nvarchar](50) NULL,
	[DateRegistered] [nvarchar](50) NULL
) ;
GO

INSERT INTO dbo.Users(id, Status, FullName, DateRegistered)
VALUES(1,'Active','Tom Jones', '1/1/2011')
,(2, 'Inactive', 'Michael Jackson', '2/2/2012')
,(3, 'Superstar', 'Helene Fischer', '20/20/2020')


DROP TABLE IF EXISTS [dbo].[Settings];
GO

CREATE TABLE [dbo].[Settings](
	[Name] [nvarchar](200) NOT NULL,
	[Value] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)) ;

INSERT INTO dbo.Settings([Name], [Value])
VALUES('Version', 0);

GO

SELECT * FROM dbo.Users;
SELECT * FROM dbo.Settings;


