CREATE TABLE Students(
    StudentID INT IDENTITY NOT NULL,
    Name NVARCHAR(50) NOT NULL
    CONSTRAINT PK_StudentID PRIMARY KEY (StudentID)
)

CREATE TABLE Exams(
    ExamID INT NOT NULL,
    Name NVARCHAR(50) NOT NULL
    CONSTRAINT PK_ExamID PRIMARY KEY (ExamID)
)

CREATE TABLE StudentsExams(
    StudentID INT NOT NULL,
    ExamID INT NOT NULL,
    CONSTRAINT PK_StudentsExams PRIMARY KEY(StudentID, ExamID),
    CONSTRAINT FK_StudentsExams_StudentID FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    CONSTRAINT FK_StudentsExams_ExamID FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
)

INSERT INTO Students(Name) VALUES
('Mila'), 
('Toni'), 
('Ron')

INSERT INTO Exams(ExamID, Name) VALUES
(101, 'SpringMVC'), 
(102, 'Neo4j'), 
(103, 'Oracle 11g')

INSERT INTO StudentsExams(StudentID, ExamID) VALUES
(1, 101), 
(1, 102), 
(2, 101), 
(3, 103), 
(2, 102), 
(2, 103)