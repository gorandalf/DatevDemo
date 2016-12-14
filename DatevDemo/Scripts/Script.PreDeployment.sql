/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

DECLARE @CurrentVersion int
SELECT @CurrentVersion = CAST (Value as int)
FROM dbo.Settings
WHERE Name = 'Version'

--IF (ISNULL(@CurrentVersion,0) = 1)
--BEGIN
--  CREATE TABLE dbo.tmp_UserNames (ID bigint, Name nvarchar(200))

--  INSERT dbo.tmp_UserNames (ID, Name)
--  SELECT u.id, u.FullName
--  FROM dbo.[Users] u
--END

IF (ISNULL(@CurrentVersion,0) < 3)
BEGIN
  CREATE TABLE dbo.tmp_UserDates (ID bigint, DateReg nvarchar(50))

  INSERT dbo.tmp_UserDates (ID, DateReg)
  SELECT u.ID, u.DateRegistered
  FROM dbo.[Users] u
  
  UPDATE dbo.[Users] SET  DateRegistered=NULL
END


/*
New pre-deployment scripts go here
*/

