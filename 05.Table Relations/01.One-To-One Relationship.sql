CREATE TABLE Passports(
    PassportID INT NOT NULL,
    PassportNumber VARCHAR(15) NOT NULL
)

CREATE TABLE Persons(
    PersonID INT IDENTITY NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    Salary MONEY NOT NULL,
    PassportID INT NOT NULL
)

INSERT INTO Passports(PassportID, PassportNumber) VALUES 
(101, 'N34FG21B'), 
(102, 'K65LO4R7'), 
(103, 'ZE657QP2')

INSERT INTO Persons(FirstName, Salary, PassportID) VALUES 
('Roberto', 43330.00, 102),
('Tom', 56100.00, 103),
('Yana', 60200.00, 101)

ALTER TABLE Persons
ADD CONSTRAINT PK_Persons PRIMARY KEY (PersonID)

ALTER TABLE Passports
ADD CONSTRAINT PK_Passports PRIMARY KEY (PassportID)

ALTER TABLE Persons
ADD CONSTRAINT FK_Persons_Passports FOREIGN KEY (PassportID) REFERENCES Passports(PassportID)