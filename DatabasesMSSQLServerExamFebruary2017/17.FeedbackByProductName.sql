CREATE FUNCTION udf_GetRating(@ProductName nvarchar(25))
RETURNS nvarchar(10)
AS
BEGIN
	DECLARE @WordRating nvarchar(10) = 'Bad';
	DECLARE @ProductRate decimal(4, 2) =
		(SELECT AVG(f.Rate)
		FROM Feedbacks AS f
		INNER JOIN Products AS p
		ON f.ProductId = p.Id
		WHERE p.Name = @ProductName
		GROUP BY p.Id);

	IF (@ProductRate IS NULL)
	BEGIN
		RETURN 'No rating';
	END

	IF (@ProductRate >= 5 AND @ProductRate < 8)
	BEGIN
		SET @WordRating = 'Average';
	END

	IF (@ProductRate >= 8)
	BEGIN
		SET @WordRating = 'Good';
	END

	RETURN @WordRating;
END