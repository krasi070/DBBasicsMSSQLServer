USE October2016Exam

SELECT DISTINCT
	c.CustomerID,
	c.FirstName + ' ' + c.LastName AS [FullName],
	DATEDIFF(YEAR, c.DateOfBirth, CAST('2016' AS date)) AS [Age]
FROM Customers AS c
INNER JOIN Tickets AS t
ON c.CustomerID = t.CustomerID
INNER JOIN Flights AS f
ON t.FlightID = f.FlightID
WHERE f.Status = 'Departing'
ORDER BY DATEDIFF(YEAR, c.DateOfBirth, CAST('2016' AS date)), c.CustomerID