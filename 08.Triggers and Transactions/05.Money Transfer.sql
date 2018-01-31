CREATE PROC usp_TransferMoney (@SenderId INT, @RecieverId INT, @Amount MONEY)
AS 
    BEGIN TRANSACTION TransferMoney    
	   EXEC usp_WithdrawMoney @SenderId, @Amount

	   DECLARE @SenderBalance MONEY = (SELECT Balance FROM Accounts
		  WHERE Id = @SenderId
	   )
		  
	   IF(@SenderBalance < @Amount)
	   BEGIN
		  ROLLBACK
	   END

	   EXEC usp_DepositMoney @RecieverId, @Amount
COMMIT

--testing
EXEC usp_TransferMoney 5, 1, 5000