USE Bank
GO
CREATE PROC usp_GetHoldersFullName
AS 
BEGIN
    SELECT FirstName +' '+ LastName AS [Full Name] FROM AccountHolders
END

--testing
EXEC usp_GetHoldersFullName