DECLARE @UserId INT;
DECLARE @GameId INT;
DECLARE @UserGameId INT;

SET @UserId = (SELECT Id FROM Users WHERE Username = 'Stamat')
SET @GameId = (SELECT Id FROM Games WHERE Name = 'Safflower')
SET @UserGameId = 
(
    SELECT Id FROM UsersGames
    WHERE UserId = @UserId 
    AND GameId = @GameId
)

BEGIN TRY
BEGIN TRANSACTION 
BEGIN
    UPDATE UsersGames
    SET Cash -= (SELECT SUM(Price) FROM Items WHERE MinLevel IN (11, 12)) 
    WHERE Id = @UserGameId

    DECLARE @UserBalance MONEY;
    SET @UserBalance = (SELECT Cash FROM UsersGames WHERE Id = @UserGameId) 

    IF(@UserBalance < 0)
    BEGIN
	   ROLLBACK
	   RETURN 
    END

    INSERT INTO UserGameItems
    SELECT Id, @UserGameId FROM Items WHERE MinLevel IN (11, 12)
COMMIT
END
END TRY
BEGIN CATCH
    ROLLBACK
END CATCH

--the second transaction
BEGIN TRY
BEGIN TRANSACTION 
BEGIN
    UPDATE UsersGames
    SET Cash -= (SELECT SUM(Price) FROM Items WHERE MinLevel IN (19, 20, 21)) 
    WHERE Id = @UserGameId

    SET @UserBalance = (SELECT Cash FROM UsersGames WHERE Id = @UserGameId) 

    IF(@UserBalance < 0)
    BEGIN
	   ROLLBACK
	   RETURN 
    END

    INSERT INTO UserGameItems
    SELECT Id, @UserGameId FROM Items WHERE MinLevel IN (19, 20, 21)
COMMIT
END
END TRY
BEGIN CATCH
    ROLLBACK
END CATCH

--extract data for user 'Stamat'
SELECT i.Name AS [Item Name] FROM Items AS i
INNER JOIN UserGameItems AS ugi
ON ugi.ItemId = i.Id
WHERE ugi.UserGameId = @UserGameId
ORDER BY [Item Name]