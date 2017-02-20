CREATE PROCEDURE usp_SendFeedback(
	@CustomerId int, 
	@ProductId int,
	@Rate decimal(4, 2),
	@Description nvarchar(255))
AS
BEGIN
	DECLARE @NumberOfFeedbacks int =
		(SELECT ISNULL(COUNT(*), 0)
		FROM Feedbacks
		WHERE ProductId = @ProductId AND CustomerId = @CustomerId);

	BEGIN TRANSACTION
	IF (@NumberOfFeedbacks >= 3)
	BEGIN
		RAISERROR('You are limited to only 3 feedbacks per product!', 16, 1);
		ROLLBACK	
	END

	INSERT INTO Feedbacks(Description, Rate, ProductId, CustomerId) VALUES
	(@Description, @Rate, @ProductId, @CustomerId)

	COMMIT
END

BEGIN TRANSACTION
EXEC usp_SendFeedback 1, 5, 7.50, 'Average experience';
SELECT COUNT(*) FROM Feedbacks WHERE CustomerId = 1 AND ProductId = 5;
ROLLBACK