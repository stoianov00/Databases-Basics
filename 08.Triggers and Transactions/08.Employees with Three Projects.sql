USE SoftUni
GO 

CREATE PROC usp_AssignProject (@EmployeeId INT, @ProjectId INT)
AS 
BEGIN 
    BEGIN TRANSACTION 
	   INSERT INTO EmployeesProjects (EmployeeID, ProjectID) VALUES
	   (@EmployeeId, @ProjectId)

	   DECLARE @ProjectCount INT;
	   SET @ProjectCount = 
	   (
	      SELECT COUNT(*) FROM EmployeesProjects
	      WHERE EmployeeID = @EmployeeId
	   )

	   IF(@ProjectCount > 3)
	   BEGIN 
		  ROLLBACK
		  RAISERROR('The employee has too many projects!', 16, 1)
		  RETURN
	   END
COMMIT
END

--testing
SELECT * FROM EmployeesProjects ORDER BY EmployeeID
EXEC usp_AssignProject 1, 2