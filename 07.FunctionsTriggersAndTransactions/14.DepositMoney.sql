CREATE PROCEDURE usp_DepositMoney(@AccountId int, @MoneyAmount money)
AS
BEGIN
	BEGIN TRANSACTION
	IF (@MoneyAmount < 0)
	BEGIN
		RAISERROR('Money amount must be higher thann 0!', 16, 1);
		ROLLBACK
	END

	IF ((SELECT Balance FROM Accounts WHERE Id = @AccountId) IS NULL)
	BEGIN
		RAISERROR('Invalid account ID!', 16, 1);
		ROLLBACK
	END

	UPDATE Accounts
	SET Balance = Balance + @MoneyAmount
	WHERE Id = @AccountId

	COMMIT
END