CREATE PROCEDURE usp_SendFeedback (@CustomerId INT, @ProductId INT, @Rate DECIMAL(4,2), @Description NVARCHAR(255))
AS
BEGIN
  BEGIN TRANSACTION
  INSERT INTO Feedbacks (Description, Rate, ProductId, CustomerId)
  VALUES (@Description, @Rate, @ProductId, @CustomerId)

  IF((SELECT COUNT(Id) FROM Feedbacks WHERE CustomerId = @customerId) >= 3)
  BEGIN
     ROLLBACK
     RAISERROR('You are limited to only 3 feedbacks per product!', 16, 1)
  END
  ELSE COMMIT
END

--testing
EXEC usp_SendFeedback 1, 5, 7.50, 'Average experience'
SELECT COUNT(*) FROM Feedbacks WHERE CustomerId = 1 AND ProductId = 5