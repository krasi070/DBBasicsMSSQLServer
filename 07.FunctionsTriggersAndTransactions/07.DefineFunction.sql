CREATE FUNCTION ufn_IsWordComprised(@SetOfLetters varchar(max), @Word varchar(max))
RETURNS bit 
AS
BEGIN
	DECLARE @IsWordComprised bit = 0;
	DECLARE @Count int = 0;
	DECLARE @LikeExpression varchar(max) = '';

	WHILE (@Count < LEN(@Word))
	BEGIN
		SET @LikeExpression += '[' + LOWER(@SetOfLetters) + ']';
		SET @Count += 1;
	END

	IF (LOWER(@Word) LIKE @LikeExpression)
	BEGIN
		SET @IsWordComprised = 1;
	END

	RETURN @IsWordComprised;
END

print dbo.ufn_IsWordComprised('oistmiahf', 'halves');