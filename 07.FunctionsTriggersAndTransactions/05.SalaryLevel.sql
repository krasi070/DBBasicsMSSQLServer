CREATE FUNCTION ufn_GetSalaryLevel(@Salary money)
RETURNS varchar(7)
AS
BEGIN
	DECLARE @Level varchar(7) = 'Low';

	IF (@Salary BETWEEN 30000 AND 50000)
	BEGIN
		SET @Level = 'Average';
	END

	IF (@Salary > 50000)
	BEGIN
		SET @Level = 'High';
	END

	RETURN @Level;
END

SELECT Salary, dbo.ufn_GetSalaryLevel(Salary) AS [Level] FROM Employees