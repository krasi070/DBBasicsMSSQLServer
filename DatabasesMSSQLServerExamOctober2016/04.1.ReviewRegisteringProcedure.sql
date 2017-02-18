CREATE PROCEDURE usp_SubmitReview(@CustomerID int, 
	@ReviewContent varchar(255),
	@ReviewGrade tinyint,
	@AirlineName varchar(30))
AS
BEGIN
	BEGIN TRANSACTION

		DECLARE @AirlineID int = 
		(SELECT TOP 1 AirlineID 
		FROM Airlines
		WHERE AirlineName = @AirlineName);

		IF (@AirlineID IS NULL)
		BEGIN;
			THROW 50000, 'Airline does not exist.', 1;
			ROLLBACK
		END

	DECLARE @NumberOfReviews int = (SELECT COUNT(*) FROM CustomerReviews);

	INSERT INTO CustomerReviews VALUES
	(@NumberOfReviews + 1, @ReviewContent, @ReviewGrade, @AirlineID, @CustomerID)

	COMMIT
END