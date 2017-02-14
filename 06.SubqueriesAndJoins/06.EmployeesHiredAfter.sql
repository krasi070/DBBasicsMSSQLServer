USE SoftUni

SELECT e.FirstName, e.LastName, e.HireDate, d.Name AS DeptName
FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
WHERE e.HireDate > '19990101' AND (d.Name = 'Sales' OR d.Name = 'Finance')
ORDER BY HireDate