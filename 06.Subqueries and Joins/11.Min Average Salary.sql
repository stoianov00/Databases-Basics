SELECT MIN(AveragySalary.MinAveragySalary) FROM
(
    SELECT DepartmentID, AVG(Salary) AS [MinAveragySalary] FROM Employees
    GROUP BY DepartmentID
) AS AveragySalary