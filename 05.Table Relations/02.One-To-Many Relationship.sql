CREATE TABLE Manufacturers(
    ManufacturerID INT IDENTITY NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    EstablishedOn DATE NOT NULL
    CONSTRAINT PK_Manufacturers PRIMARY KEY (ManufacturerID)
)

CREATE TABLE Models(
    ModelID INT NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    ManufacturerID INT NOT NULL
    CONSTRAINT PK_Models PRIMARY KEY (ModelID)
    CONSTRAINT FK_Models_ManufacturerID FOREIGN KEY (ManufacturerID) REFERENCES  Manufacturers (ManufacturerID)
)

INSERT INTO Manufacturers(Name, EstablishedOn) VALUES
('BMW', '07/03/1916'),
('Tesla', '01/01/2003'),
('Lada', '01/05/1966')

INSERT INTO Models(ModelID, Name, ManufacturerID) VALUES
('101', 'X1', 1),
('102', 'i6', 1),
('103', 'Model S', 2),
('104', 'Model X', 2),
('105', 'Model 3', 2),
('106', 'Nova', 3)