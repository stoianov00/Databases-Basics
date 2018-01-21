CREATE TABLE Majors(
  MajorID INT NOT NULL,
  Name NVARCHAR(50) NOT NULL,
  CONSTRAINT PK_MajorID PRIMARY KEY (MajorID)
)

CREATE TABLE Students(
    StudentID INT NOT NULL,
    StudentNumber INT UNIQUE NOT NULL,
    StudentName NVARCHAR(100) NOT NULL,
    MajorID INT,
    CONSTRAINT PK_StudentID PRIMARY KEY (StudentID),
    CONSTRAINT FK_Students_MajorID FOREIGN KEY (MajorID) REFERENCES Majors(MajorID)
)

CREATE TABLE Payments(
  PaymentID INT NOT NULL,
  PaymentDate DATE NOT NULL,
  PaymentAmount MONEY NOT NULL,
  StudentID INT NOT NULL,
  CONSTRAINT PK_PaymentID PRIMARY KEY (PaymentID),
  CONSTRAINT FK_Payments_StudentID FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
)

CREATE TABLE Subjects(
    SubjectID INT NOT NULL,
    SubjectName NVARCHAR(100)
    CONSTRAINT PK_SubjectID PRIMARY KEY (SubjectID)	
) 

CREATE TABLE Agenda(
    StudentID INT NOT NULL,
    SubjectID INT NOT NULL
    CONSTRAINT PK_Agenda PRIMARY KEY (StudentID, SubjectID)
    CONSTRAINT FK_Agenda_SubjectID FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID),
    CONSTRAINT FK_Agenda_StudentID FOREIGN KEY (StudentID) REFERENCES Students(StudentID) 
)