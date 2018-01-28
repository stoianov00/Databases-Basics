CREATE FUNCTION ufn_CalculateFutureValue (@Sum MONEY, @InterestRate FLOAT, @NumberOfYears INT)
RETURNS MONEY 
AS 
BEGIN
    DECLARE @Result MONEY;
    SET @Result = @SUM * POWER(1 + @InterestRate, @NumberOfYears);  
    
    RETURN @Result
END

--testing
SELECT dbo.ufn_CalculateFutureValue (1000, 0.10, 5)