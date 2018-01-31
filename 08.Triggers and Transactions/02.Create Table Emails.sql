CREATE TABLE NotificationEmails(
    Id INT IDENTITY NOT NULL,
    Recipient INT NOT NULL,
    Subject VARCHAR(200) NOT NULL,
    Body VARCHAR(200) NOT NULL
    CONSTRAINT PK_NotificationEmails PRIMARY KEY (Id)
    CONSTRAINT FK_NotificationEmails_Recipent FOREIGN KEY (Recipient) REFERENCES Accounts(Id)
)
GO

--trigger
CREATE TRIGGER tr_LogsNotificationEmails ON Logs AFTER INSERT
AS
BEGIN 
    DECLARE @Recipient INT;
    DECLARE @OldBalance MONEY;
    DECLARE @NewBalance MONEY;
    DECLARE @Subject VARCHAR(200);
    DECLARE @Body VARCHAR(200);

    SET @Recipient = (SELECT AccountId FROM inserted)
    SET @OldBalance = (SELECT OldSum FROM inserted)
    SET @NewBalance = (SELECT NewSum FROM inserted)
    SET @Subject = CONCAT('Balance change for account: ', @Recipient)
    SET @Body = CONCAT('On ', GETDATE(), ' your balance was changed from ', @OldBalance, ' to ', @NewBalance)

    INSERT INTO NotificationEmails (Recipient, Subject, Body) VALUES
    (@Recipient, @Subject, @Body)
END

--testing
UPDATE Accounts
SET Balance += 1000
WHERE Id = 1