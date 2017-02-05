USE SoftUni
SELECT DepartmentID, (
	SELECT DISTINCT Salary FROM Employees
	WHERE DepartmentID = e.DepartmentID
	ORDER BY Salary DESC 
	OFFSET 2 ROWS
	FETCH NEXT 1 ROW ONLY 
) AS ThirdHighestSalary FROM Employees AS e
WHERE (
	SELECT DISTINCT Salary FROM Employees
	WHERE DepartmentID = e.DepartmentID
	ORDER BY Salary DESC 
	OFFSET 2 ROWS
	FETCH NEXT 1 ROW ONLY 
) IS NOT NULL
GROUP BY DepartmentID