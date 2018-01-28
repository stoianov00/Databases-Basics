USE Diablo

CREATE FUNCTION ufn_CashInUsersGames (@GameName VARCHAR(MAX))
RETURNS TABLE
AS
RETURN (

  WITH CTE_CashInRows (Cash, RowNumber) AS (
    SELECT ug.Cash, ROW_NUMBER() OVER (ORDER BY ug.Cash DESC)
    FROM UsersGames AS ug
    JOIN Games AS g ON ug.GameId = g.Id
    WHERE g.Name = @GameName
  )

  SELECT SUM(Cash) AS SumCash
  FROM CTE_CashInRows
  WHERE RowNumber % 2 = 1
)

-- testing
SELECT * FROM dbo.ufn_CashInUsersGames ('Lily Stargazer')