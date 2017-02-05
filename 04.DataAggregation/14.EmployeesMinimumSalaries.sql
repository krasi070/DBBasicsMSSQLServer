USE SoftUni
SELECT DepartmentID, MIN(Salary) AS MiniumuSalary FROM Employees
WHERE HireDate > CAST('2000-01-01' AS smalldatetime)
GROUP BY DepartmentID
HAVING DepartmentID IN (2, 5, 7)