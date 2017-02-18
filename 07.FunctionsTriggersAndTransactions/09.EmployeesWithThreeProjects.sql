CREATE PROCEDURE usp_AssignProject(@EmployeeID int, @ProjectID int)
AS
BEGIN
	BEGIN TRANSACTION

	INSERT INTO EmployeesProjects VALUES
	(@EmployeeID, @ProjectID)

	DECLARE @EmployeeProjectCount int = 
		(SELECT COUNT(*) FROM EmployeesProjects
		WHERE EmployeeID = @EmployeeID);
	IF (@EmployeeProjectCount > 3)
	BEGIN
		RAISERROR('The employee has too many projects!', 16, 1);
		ROLLBACK
	END

	COMMIT
END