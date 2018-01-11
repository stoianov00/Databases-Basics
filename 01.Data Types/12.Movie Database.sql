CREATE DATABASE Movie

USE Movie

CREATE TABLE Directors(
	Id INT IDENTITY NOT NULL,
	DirectorName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(MAX),
	CONSTRAINT PK_Directors PRIMARY KEY(Id)
)

CREATE TABLE Genres(
	Id INT IDENTITY NOT NULL,
	GenreName NVARCHAR(50) UNIQUE NOT NULL,
	Notes NVARCHAR(MAX),
	CONSTRAINT PK_Genres PRIMARY KEY(Id)
)

CREATE TABLE Categories(
	Id INT IDENTITY NOT NULL,
	CategoryName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(MAX),
	CONSTRAINT PK_Categories PRIMARY KEY(Id)
)

CREATE TABLE Movies(
	Id INT IDENTITY NOT NULL,
	Title NVARCHAR(200) UNIQUE NOT NULL,
	DirectorId INT NOT NULL,
	CopyrightYear INT NOT NULL,
	Length INT NOT NULL,
	GenreId INT NOT NULL, 
	CategoryId INT NOT NULL, 
	Rating NUMERIC(2, 1), 
	Notes NVARCHAR(MAX),  
	CONSTRAINT PK_Movies PRIMARY KEY(Id),
	CONSTRAINT FK_Movies_Directors FOREIGN KEY (DirectorId) REFERENCES Directors(Id),
	CONSTRAINT FK_Movies_Genres FOREIGN KEY (GenreId) REFERENCES Genres(Id),
	CONSTRAINT FK_Movies_Categories FOREIGN KEY (CategoryId) REFERENCES Categories(Id),
	CONSTRAINT CK_Movies_CopyrightYear CHECK (CopyrightYear >= 1900),
	CONSTRAINT CK_Movies_Length CHECK (Length > 0),
	CONSTRAINT CK_Movies_Rating CHECK (Rating > 0 AND Rating <= 10)
)

INSERT INTO Directors(DirectorName, Notes) VALUES
('David Lynch', 'Thriller Director'),
('Christopher Nolan', 'Best known for his cerebral, often nonlinear story-telling'),
('Susanne Bier', 'Known for In a Better World (2010), After the Wedding (2006) and Brothers (2004).'),
('Kathryn Bigelow', 'Director of The Hurt Locker'),
('Ridley Scott', 'His reputation remains solidly intact.')

INSERT INTO Genres (GenreName) VALUES
('Drama'),('History'),('Thriller'),('Romance'),('Sci-Fi')

INSERT INTO Categories (CategoryName) VALUES
('R'),('PG-13'),('PG-18'),('Avoid at all cost'),('Hmmmm')

INSERT INTO Movies (Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes) VALUES
('Gladiator', 5, 2000, 155, 1, 1, 8.5, NULL),
('The Prestige', 2, 2006, 130, 5, 2, 8.5, 'One of my favourite movies'),
('The Hurt Locker', 4, 2008, 131, 3, 1, 7.6, NULL),
('After the Wedding', 3, 2006, 155, 1, 1, 7.8, 'Amazing performance from everyone'),
('Lost Highway', 1, 1997, 120, 1, 1, 7.4, NULL)