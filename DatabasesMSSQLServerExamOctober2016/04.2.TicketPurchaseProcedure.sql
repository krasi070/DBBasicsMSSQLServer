CREATE PROCEDURE usp_PurchaseTicket(
	@CustomerID int, 
	@FlightID int,
	@TicketPrice decimal(8, 2),
	@Class varchar(6),
	@Seat varchar(5))
AS
BEGIN
	BEGIN TRANSACTION

	IF (@TicketPrice < 0)
	BEGIN;
		THROW 50000, 'Ticket price cannot be less than 0.', 1;
		ROLLBACK
	END

	DECLARE @CustomerBalance decimal(10, 2) = 
		(SELECT Balance
		FROM CustomerBankAccounts
		WHERE CustomerID = @CustomerID);

	IF (@TicketPrice > @CustomerBalance OR @CustomerBalance IS NULL)
	BEGIN;
		THROW 50000, 'Insufficient bank account balance for ticket purchase.', 1;
		ROLLBACK
	END

	DECLARE @TicketID int = (SELECT COUNT(*) FROM Tickets); 
	INSERT INTO Tickets VALUES 
	(@TicketID + 1, @TicketPrice, @Class, @Seat, @CustomerID, @FlightID);

	UPDATE CustomerBankAccounts
	SET Balance = Balance - @TicketPrice
	WHERE CustomerID = @CustomerID

	COMMIT
END