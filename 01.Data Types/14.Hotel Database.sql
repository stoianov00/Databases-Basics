CREATE DATABASE Hotel

USE Hotel

CREATE TABLE Employees(
	Id INT IDENTITY NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Title NVARCHAR(100) NOT NULL,
	Notes NVARCHAR(MAX),
	CONSTRAINT PK_Employees PRIMARY KEY (Id)
) 

CREATE TABLE Customers(
	AccountNumber INT IDENTITY NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	PhoneNumber BIGINT NOT NULL,
	EmeregencyName NVARCHAR(50) NOT NULL,
	EmeregencyNumber BIGINT NOT NULL,
	Notes NVARCHAR(MAX),
	CONSTRAINT PK_Customers PRIMARY KEY (AccountNumber),
	CHECK (PhoneNumber > 0)
)

CREATE TABLE RoomStatus(
	RoomStatus NVARCHAR(200) NOT NULL,
	Notes NVARCHAR(MAX),
	CONSTRAINT PK_RoomStatus PRIMARY KEY (RoomStatus),
)

CREATE TABLE RoomTypes (
	RoomType NVARCHAR(50) NOT NULL, 
	Notes NVARCHAR(MAX),
	CONSTRAINT PK_RoomTypes PRIMARY KEY (RoomType)
)

CREATE TABLE BedTypes (
	BedType NVARCHAR(50) NOT NULL, 
	Notes NVARCHAR(MAX),
	CONSTRAINT PK_BedTypes PRIMARY KEY (BedType)
)

CREATE TABLE Rooms (
	RoomNumber INT IDENTITY NOT NULL,
	RoomType NVARCHAR(50) NOT NULL,
	BedType NVARCHAR(50) NOT NULL,
	Rate MONEY NOT NULL,
	RoomStatus NVARCHAR(200) NOT NULL,
	Note NVARCHAR(MAX),
	CONSTRAINT PK_Rooms PRIMARY KEY (RoomNumber),
	CONSTRAINT FK_Rooms_RoomType FOREIGN KEY (RoomType) REFERENCES RoomTypes (RoomType),
	CONSTRAINT FK_Rooms_BedType FOREIGN KEY (BedType) REFERENCES BedTypes (BedType),
	CONSTRAINT FK_Rooms_RoomStatus FOREIGN KEY (RoomStatus) REFERENCES RoomStatus (RoomStatus),
	CHECK (Rate >= 0)	
)


CREATE TABLE Payments(
	Id INT IDENTITY NOT NULL,
	EmployeeId INT NOT NULL,
	PaymentDate DATE NOT NULL,
	AccountNumber INT NOT NULL,
	FirstDateOccupied DATE NOT NULL,
	LastDateOccupied DATE NOT NULL,
	TotalDays INT NOT NULL,
	AmountCharged MONEY NOT NULL,
	TaxRate MONEY NOT NULL,
	TaxAmount MONEY NOT NULL,
	PaymentTotal MONEY NOT NULL,
	Notes NVARCHAR(MAX),
	CONSTRAINT PK_Payments PRIMARY KEY(Id),
	CONSTRAINT FK_Payments_EmployeeId FOREIGN KEY (EmployeeId) REFERENCES Employees (Id),
	CONSTRAINT FK_Payments_AccountNumber FOREIGN KEY (AccountNumber) REFERENCES Customers (AccountNumber),
	CHECK (TotalDays = DATEDIFF(day, FirstDateOccupied, LastDateOccupied)),
	--drop the next 2 TaxRate ralated constraints before a TaxRate update (Problem 23)
	CONSTRAINT CK_Payments_TaxAmount CHECK (TaxAmount = AmountCharged * TaxRate), 
	CONSTRAINT CK_Payments_PaymentTotal CHECK (PaymentTotal = AmountCharged + TaxAmount)
)

CREATE TABLE Occupancies(
	Id INT IDENTITY NOT NULL,
	EmployeeId INT NOT NULL, 
	DateOccupied DATE NOT NULL, 
	AccountNumber INT NOT NULL, 
	RoomNumber INT NOT NULL, 
	RateApplied MONEY NOT NULL, 
	PhoneCharge MONEY DEFAULT 0 NOT NULL, 
	Notes NVARCHAR(MAX),
	CONSTRAINT PK_Occupancies PRIMARY KEY (Id),
	CONSTRAINT FK_Occupancies_EmployeeId FOREIGN KEY (EmployeeId) REFERENCES Employees (Id),
	CONSTRAINT FK_Occupancies_AccountNumber FOREIGN KEY (AccountNumber) REFERENCES Customers (AccountNumber),
	CONSTRAINT FK_Occupancies_RoomNumber FOREIGN KEY (RoomNumber) REFERENCES Rooms (RoomNumber),
	CHECK (PhoneCharge >= 0)
)

INSERT INTO Employees (FirstName, LastName, Title, Notes) VALUES
('Tom', 'Barnes', 'Hotel Manager', NULL),
('David', 'Jones', 'CEO', NULL),
('Eva', 'Michado', 'Chambermaid', 'Late for work')
	
INSERT INTO Customers (FirstName, LastName, PhoneNumber, EmeregencyName, EmeregencyNumber) VALUES
('Angela','Merkel', 49123456789, 'Barroso', 32987654321),
('Barack','Obama', 1123456789, 'Barroso2', 339567746421),
('Margaret','Thacher', 41987654321, 'Barroso3', 4987694421)

INSERT INTO RoomStatus (RoomStatus) VALUES
('Reserved'), ('Occupied'), ('Available')

INSERT INTO RoomTypes (RoomType) VALUES
('Single'), ('Double'), ('Suite')

INSERT INTO BedTypes (BedType) VALUES
('Single'), ('Twin'), ('Double')

INSERT INTO Rooms (RoomType, BedType, Rate, RoomStatus) VALUES
('Single', 'Single', 70, 'Reserved'),
('Double', 'Twin', 100, 'Occupied'),
('Suite', 'Double', 110, 'Available')

INSERT INTO Payments (EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal) VALUES
(1, '2017-01-22', 1, '2017-01-21', '2017-01-22', 1, 100, 0.20, 20, 120),
(1, '2017-01-22', 2, '2017-01-20', '2017-01-22', 2, 200, 0.20, 40, 240),
(1, '2017-01-22', 3, '2017-01-19', '2017-01-22', 3, 300, 0.20, 60, 360)

INSERT INTO Occupancies (EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge) VALUES
(1, '2014-01-22', 1, 1, 70, 0),
(2, '2014-01-22', 2, 2, 100, 0),
(3, '2014-01-22', 3, 3, 110, 10)