CREATE DATABASE CarRental

USE CarRental

CREATE TABLE Categories(
	Id INT IDENTITY NOT NULL,
	CategoryName NVARCHAR(50) NOT NULL,
	DailyRate MONEY CHECK (DailyRate > 0),
	WeeklyRate MONEY CHECK (WeeklyRate > 0),
	MonthlyRate MONEY CHECK(MonthlyRate > 0),
	WeekendRate MONEY CHECK (WeekendRate > 0),
	CONSTRAINT PK_Categories PRIMARY KEY(Id) 
)

CREATE TABLE Cars(
	Id INT IDENTITY NOT NULL,
	PlateNumber VARCHAR(20) UNIQUE NOT NULL,
	Manufacturer NVARCHAR(50) NOT NULL,
	Model NVARCHAR(50) NOT NULL,
	CarYear INT CHECK (CarYear >= 1886) NOT NULL,
	CategoryId INT NOT NULL,
	Doors INT NOT NULL,
	Picture VARBINARY(MAX),
	Condition NVARCHAR(200),
	CONSTRAINT PK_Cars PRIMARY KEY(Id),
	CONSTRAINT FK_Cars_Category FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
)

CREATE TABLE Employees(
	Id INT IDENTITY NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Title NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(MAX),
	CONSTRAINT PK_Employees PRIMARY KEY(Id)
)

CREATE TABLE Customers(
	Id INT IDENTITY NOT NULL,
	DriverLicenseNumber VARCHAR(50) NOT NULL,
	FullName NVARCHAR(100) NOT NULL,
	Address NVARCHAR(MAX) NOT NULL,
	City NVARCHAR(200) NOT NULL,
	ZIPCode VARCHAR(50) NOT NULL,
	Notes NVARCHAR(MAX),
	CONSTRAINT PK_Customers PRIMARY KEY(Id)
)

CREATE TABLE RentalOrders(
	Id INT IDENTITY NOT NULL,
	EmployeeId INT NOT NULL,
	CustomerId INT NOT NULL,
	CarId INT NOT NULL,
	TankLevel FLOAT NOT NULL,
	KilometrageStart FLOAT NOT NULL,
	KilometrageEnd FLOAT NOT NULL,
	TotalKilometrage FLOAT NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	TotalDays INT NOT NULL,
	RateApplied MONEY NOT NULL,
	TaxRate MONEY NOT NULL,
	OrderStatus VARCHAR(80) NOT NULL,
	Notes NVARCHAR(MAX),
	CONSTRAINT PK_RentalOrders PRIMARY KEY(Id),
	CONSTRAINT FK_RentalOrders_EmployeeId FOREIGN KEY (EmployeeId) REFERENCES Employees (Id),
	CONSTRAINT FK_RentalOrders_CustomerId FOREIGN KEY (CustomerId) REFERENCES Customers (Id),
	CONSTRAINT FK_RentalOrders_CarId FOREIGN KEY (CarId) REFERENCES Cars (Id),
	CHECK (TotalKilometrage = KilometrageEnd - KilometrageStart),
	CHECK (TotalDays = DATEDIFF(day, StartDate, EndDate) + 1)
)

INSERT INTO Categories (CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate) VALUES
('Economy', 15, 50, 1000, 40),
('Standard', 80, 500, 2000, 200),
('Premium', 100, NULL, NULL, NULL)

INSERT INTO Cars (PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition) VALUES
('CA12345XB', 'Sedan', 'Renault', 2016, 1, 4, 0101010, 'Excellent'),
('TT4444TT', 'SUV', 'VW', 2016, 1, 4, 111000, 'Outstanding'),
('VV5555HH', 'Sedan', 'Mercedes', 2016, 3, 4, 01111, 'Excellent')

INSERT INTO Employees (FirstName, LastName, Title) VALUES
('Tom', 'Barnes', 'Sales Representative'),
('David', 'Jones', 'CEO'),
('Eva', 'Michado', 'Software developer')

INSERT INTO Customers (DriverLicenseNumber, FullName, Address, City, ZIPCode, Notes) VALUES
('A111111', 'Angela MErkel', 'Willy-Brandt-Strasse 1', 'Berlin', '10557', 'New leader of the free world'),
('B222222', 'Barack Obama', '1600 Pennsylvania Ave NW', 'Washington', 'DC 20500', 'Previous leader of the free world'),
('C333333', 'Bill Clinton', '555 Bloomberg Avenue', 'New York', 'NY 1000', NULL)

INSERT INTO RentalOrders (EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes) VALUES
(1, 1, 1, 100, 30100, 30200.5, 100.5, '2017-01-22', '2017-01-22', 1, 15, 0.20, 'Rented', NULL),
(2, 2, 2, 100, 30100, 30250.5, 150.5, '2017-01-20', '2017-01-22', 3, 80, 0.20, 'Pending', 'TBD'),
(3, 3, 3, 100, 30000, 30200.5, 200.5, '2017-01-21', '2017-01-22', 2, 110, 0.20, 'Closed', NULL)