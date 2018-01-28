CREATE FUNCTION ufn_GetSalaryLevel (@Salary MONEY)
RETURNS VARCHAR(10)
AS
BEGIN
    DECLARE @SalaryLevel VARCHAR(10);

    IF(@Salary < 30000)
    BEGIN
	   SET @SalaryLevel = 'Low'
    END
    ELSE IF(@Salary BETWEEN 30000 AND 50000)
    BEGIN
	   SET @SalaryLevel = 'Average'
    END

    ELSE IF(@Salary > 50000)
    BEGIN
	   SET @SalaryLevel = 'High'
    END
     
    RETURN @SalaryLevel   	     
END
GO

--testing
SELECT Salary, dbo.ufn_GetSalaryLevel(Salary) AS SalaryLevel FROM Employees