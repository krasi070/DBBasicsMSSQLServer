CREATE PROCEDURE usp_TransferMoney(@SenderId int, @ReceiverId int, @MoneyAmount money)
AS
BEGIN
	BEGIN TRANSACTION
	IF (@MoneyAmount < 0)
	BEGIN
		RAISERROR('Money amount must be higher thann 0!', 16, 1);
		ROLLBACK
	END

	EXEC usp_WithdrawMoney @SenderId, @MoneyAmount;
	EXEC usp_DepositMoney @ReceiverID, @MoneyAmount;

	COMMIT
END