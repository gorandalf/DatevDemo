﻿CREATE PROCEDURE usp_ListUsers
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM dbo.Users;

END