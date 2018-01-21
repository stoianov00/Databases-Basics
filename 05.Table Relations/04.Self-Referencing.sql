CREATE TABLE Teachers (
    TeacherID INT UNIQUE NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    ManagerID INT
    CONSTRAINT PK_TeacherID PRIMARY KEY(TeacherID),
    CONSTRAINT FK_Teachers_ManagerID FOREIGN KEY (ManagerID) REFERENCES Teachers (TeacherID)
)

INSERT INTO Teachers VALUES
(101, 'John', NULL),
(102, 'Maya', 106),
(103, 'Silvia', 106),
(104, 'Ted', 105),
(105, 'Mark', 101),
(106, 'Greta', 101)