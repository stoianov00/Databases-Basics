USE Bank

CREATE TABLE Logs(
    LogId INT IDENTITY NOT NULL,
    AccountId INT NOT NULL,
    OldSum MONEY NOT NULL,
    NewSum MONEY NOT NULL
    CONSTRAINT PK_Logs PRIMARY KEY (LogId)
    CONSTRAINT FK_Logs_Accounts FOREIGN KEY (AccountId) REFERENCES Accounts(Id)
)

--trigger
CREATE TRIGGER tr_MoneysUpdate ON Accounts AFTER UPDATE
AS
BEGIN 
    DECLARE @AccountId INT;
    DECLARE @OldBalance MONEY;
    DECLARE @NewBalance MONEY;

    SET @AccountId = (SELECT Id FROM inserted)
    SET @OldBalance = (SELECT Balance FROM deleted)
    SET @NewBalance = (SELECT Balance FROM inserted)

    IF(@NewBalance <> @OldBalance)
	   INSERT INTO Logs VALUES
	   (@AccountId, @OldBalance, @NewBalance) 
END    

--testing
UPDATE Accounts
SET Balance += 1000
WHERE Id = 1