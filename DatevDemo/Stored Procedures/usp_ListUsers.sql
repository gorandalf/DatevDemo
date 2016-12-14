CREATE PROCEDURE usp_ListUsers
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
			[id], [Status]
	FROM dbo.Users



END