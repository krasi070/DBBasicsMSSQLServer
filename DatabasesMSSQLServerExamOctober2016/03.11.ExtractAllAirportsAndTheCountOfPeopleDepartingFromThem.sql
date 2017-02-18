USE October2016Exam

SELECT DISTINCT
	a.AirportID,
	a.AirportName,
	COUNT(c.CustomerID) AS [Passengers]
FROM Airports AS a
INNER JOIN Flights AS f
ON a.AirportID = f.OriginAirportID
INNER JOIN Tickets AS t
ON f.FlightID = t.FlightID
INNER JOIN Customers AS c
ON t.CustomerID = c.CustomerID
WHERE f.Status = 'Departing'
GROUP BY a.AirportID, a.AirportName
HAVING COUNT(c.CustomerID) > 0
ORDER BY a.AirportID