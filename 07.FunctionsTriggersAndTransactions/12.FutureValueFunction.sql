CREATE FUNCTION ufn_CalculateFutureValue(
	@Sum money,	
	@YearlyInterestRate float,
	@NumberOfYears int)
RETURNS money
AS
BEGIN
	RETURN @Sum * POWER(1 + @YearlyInterestRate, @NumberOfYears);
END