CREATE PROCEDURE usp_GetEmployeesSalaryAboveNumber(@Number money)
AS
BEGIN
	SELECT FirstName, LastName FROM Employees
	WHERE Salary >= @Number
END

EXEC usp_GetEmployeesSalaryAboveNumber 48100