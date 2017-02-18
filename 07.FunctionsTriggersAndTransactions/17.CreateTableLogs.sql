CREATE TABLE Logs(
	LogId int IDENTITY PRIMARY KEY NOT NULL,
	AccountId int FOREIGN KEY REFERENCES Accounts(Id) NOT NULL,
	OldSum money NOT NULL,
	NewSum money NOT NULL
)

CREATE TRIGGER tr_SumAccountChange ON Accounts AFTER Update
AS
BEGIN
	DECLARE @AccountId int = (SELECT Id FROM inserted);
	DECLARE @OldSum money = (SELECT Balance FROM deleted);
	DECLARE @NewSum money = (SELECT Balance FROM inserted);

	IF (@OldSum != @NewSum)
	BEGIN
		INSERT INTO Logs(AccountId, OldSum, NewSum) VALUES
		(@AccountId, @OldSum, @NewSum)
	END
END