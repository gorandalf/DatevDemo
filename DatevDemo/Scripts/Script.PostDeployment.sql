/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
DECLARE @NewVersion int
SET @NewVersion = 3

DECLARE @CurrentVersion int
SELECT @CurrentVersion = CAST (Value as int)
FROM dbo.Settings
WHERE Name = 'Version'

--IF (@CurrentVersion < 2)
--BEGIN
--  UPDATE dbo.[Users]
--  SET FirstName = LEFT(n.Name, CHARINDEX(' ', n.Name) - 1),
--	  LastName = RIGHT(n.Name, LEN(n.Name) - CHARINDEX(' ', n.Name))
--  FROM dbo.[Users] u
--  INNER JOIN dbo.tmp_UserNames n ON n.ID = u.id 
--  DROP TABLE dbo.tmp_UserNames
--END


IF (@CurrentVersion < 3)
BEGIN
  UPDATE dbo.[Users]
  SET DateRegistered = CAST(d.DateReg as DATETIME)
  FROM dbo.[Users] u
  INNER JOIN dbo.tmp_UserDates d ON d.ID = u.ID
  WHERE ISDATE(d.DateReg)>0

  DROP TABLE dbo.tmp_UserDates
END



--:r ReferenceData.sql

IF (EXISTS (SELECT TOP 1 1 FROM dbo.Settings WHERE Name = 'Version'))
BEGIN
	UPDATE dbo.Settings
	SET Value = @NewVersion
	WHERE Name = 'Version'
END
ELSE
BEGIN
	INSERT dbo.Settings (Name, Value)
	VALUES ('Version', @NewVersion)
END
