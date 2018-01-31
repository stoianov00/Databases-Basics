CREATE PROC usp_DepositMoney (@AccountId INT, @MoneyAmount DECIMAL(15, 4))
AS
BEGIN
    UPDATE Accounts
    SET Balance += @MoneyAmount
    WHERE Id = @AccountId
END
GO

--testing 
EXEC usp_DepositMoney 1, 10