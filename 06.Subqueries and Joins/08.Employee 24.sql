SELECT e.EmployeeID, e.FirstName,  
IIF(p.StartDate >= '2005/01/01', NULL, p.Name) FROM Employees AS e
INNER JOIN EmployeesProjects AS ep
ON ep.EmployeeID = e.EmployeeID
INNER JOIN Projects AS p
ON p.ProjectID = ep.ProjectID
WHERE e.EmployeeID = 24