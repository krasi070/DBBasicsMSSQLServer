USE SoftUni

SELECT TOP (3) e.EmployeeID, e.FirstName
FROM Employees AS e
LEFT OUTER JOIN EmployeesProjects AS ep
ON e.EmployeeID = ep.EmployeeID
WHERE ProjectID IS NULL
ORDER BY e.EmployeeID