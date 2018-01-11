USE Minions

CREATE TABLE Users(
	Id INT UNIQUE IDENTITY NOT NULL,
	Username VARCHAR(30) UNIQUE NOT NULL,
	Password VARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY(900),
	LastLoginTime DATETIME,
	IsDeleted BIT DEFAULT 0,
	CONSTRAINT PK_Users PRIMARY KEY(Id)	 
)

INSERT INTO Users(Username, Password, ProfilePicture, LastLoginTime, IsDeleted) VALUES
('tom', 'qwery', 01010, '2016/01/18 00:01:50', 0),
('maria', '123456789', 0000, '2016/01/17 16:50:50', 0),
('nia', 'abc123', 1111, '2016/01/17 08:45:45', 1),
('peter', 'default', 111, '2016/01/17 15:01:50', 0),
('eva', 'password', 011110, '2016/01/17 22:23:50', 1)