CREATE PROC usp_WithdrawMoney(@AccountId INT, @MoneyAmount MONEY)
AS
BEGIN
    UPDATE Accounts
    SET Balance -= @MoneyAmount
    WHERE Id = @AccountId
END

--testing
EXEC usp_WithdrawMoney 5, 25