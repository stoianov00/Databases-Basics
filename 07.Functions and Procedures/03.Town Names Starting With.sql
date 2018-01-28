CREATE PROC usp_GetTownsStartingWith (@Town VARCHAR(MAX))
AS 
BEGIN
     SELECT Name FROM Towns
	WHERE Name LIKE @Town + '%'
END

--testing
EXEC usp_GetTownsStartingWith 'b'