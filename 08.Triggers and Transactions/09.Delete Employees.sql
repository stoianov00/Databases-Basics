CREATE TABLE Deleted_Employees (
    EmployeeId INT IDENTITY NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    MiddleName VARCHAR(10),
    JobTitle VARCHAR(50) NOT NULL,
    DepartmentId INT NOT NULL,
    Salary MONEY NOT NULL
    CONSTRAINT PK_EmployeeId PRIMARY KEY (EmployeeId),
    CONSTRAINT FK_Deleted_Employees_DepartmentId FOREIGN KEY (DepartmentId) REFERENCES Departments (DepartmentID)
)
GO 

CREATE TRIGGER tr_FiredEmployees ON Employees AFTER DELETE
AS
BEGIN
    INSERT INTO Deleted_Employees (FirstName, LastName, MiddleName, JobTitle, DepartmentId, Salary)
    SELECT FirstName, LastName, MiddleName, JobTitle, DepartmentID, Salary FROM deleted
END       