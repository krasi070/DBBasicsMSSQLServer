USE SoftUni
SELECT DepartmentID, SUM(Salary) AS TotallSalary FROM Employees
GROUP BY DepartmentID
ORDER BY DepartmentID