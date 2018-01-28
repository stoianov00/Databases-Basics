CREATE PROC usp_GetEmployeesSalaryAboveNumber (@minSalary MONEY)
AS
BEGIN
  SELECT FirstName, LastName
  FROM Employees
  WHERE Salary >= @minSalary
END

--testing
EXEC usp_GetEmployeesSalaryAboveNumber 48100