CREATE PROCEDURE usp_EmployeesBySalaryLevel(@SalaryLevel varchar(7))
AS
BEGIN
	SELECT FirstName, LastName FROM Employees
	WHERE dbo.ufn_GetSalaryLevel(Salary) = @SalaryLevel
END

EXEC usp_EmployeesBySalaryLevel 'High'