CREATE PROC usp_GetHoldersWithBalanceHigherThan (@MinBalance MONEY)
AS
BEGIN
    WITH CTE_MinBalanceAccountHolders (HolderId) AS 
    (
	   SELECT AccountHolderId FROM Accounts
	   GROUP BY AccountHolderId
	   HAVING SUM(Balance) > @MinBalance
    )

    SELECT ah.FirstName AS [First Name], ah.LastName AS [Last Name]
    FROM CTE_MinBalanceAccountHolders AS minBalance
    INNER JOIN AccountHolders AS ah
    ON ah.Id = minBalance.HolderId
    ORDER BY ah.LastName, ah.FirstName 
END

--testing
EXEC usp_GetHoldersWithBalanceHigherThan 1000