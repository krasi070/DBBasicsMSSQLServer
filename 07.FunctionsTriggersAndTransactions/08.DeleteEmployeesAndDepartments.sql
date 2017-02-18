DELETE EmployeesProjects
WHERE EmployeeID IN 
	(SELECT EmployeeID FROM Employees AS e
	INNER JOIN Departments AS d
	ON e.DepartmentID = d.DepartmentID
	WHERE d.Name = 'Production' OR d.Name = 'Production Control')

ALTER TABLE Employees
DROP CONSTRAINT FK_Employees_Employees

ALTER TABLE Employees
DROP CONSTRAINT FK_Employees_Departments

ALTER TABLE Departments
DROP CONSTRAINT FK_Departments_Employees

DELETE Employees
WHERE DepartmentID IN 
	(SELECT DepartmentID FROM Departments
	WHERE Name IN ('Production', 'Production Control')) 

DELETE Employees
WHERE EmployeeID IN 
	(SELECT ManagerID FROM Departments
	WHERE Name IN ('Production', 'Production Control')) 

DELETE Departments
WHERE Name IN ('Production', 'Production Control')