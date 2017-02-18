USE October2016Exam

SELECT DISTINCT
	c.CustomerID,
	c.FirstName + ' ' + c.LastName AS [FullName],
	t.TownName AS [HomeTown]
FROM Customers  AS c
INNER JOIN Towns AS t
ON c.HomeTownID = t.TownID
INNER JOIN Tickets AS ti
ON c.CustomerID = ti.CustomerID
INNER JOIN Flights AS f
ON ti.FlightID = f.FlightID
INNER JOIN Airports AS a
ON f.OriginAirportID = a.AirportID
WHERE t.TownID = a.TownID AND t.TownID = c.HomeTownID AND f.Status = 'Departing'
ORDER BY c.CustomerID