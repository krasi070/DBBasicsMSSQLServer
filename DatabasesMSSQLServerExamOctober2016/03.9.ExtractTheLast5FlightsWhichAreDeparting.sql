USE October2016Exam

SELECT TOP (5)
	f.FlightID,
	f.DepartureTime,
	f.ArrivalTime,
	a1.AirportName AS [Origin],
	a2.AirportName AS [Destination]
FROM 
	(SELECT TOP 5 FlightID FROM Flights
	WHERE Status = 'Departing'	
	ORDER BY DepartureTime DESC) AS f5
INNER JOIN Flights AS f
ON f5.FlightID = f.FlightID 
INNER JOIN Airports AS a1
ON f.OriginAirportID = a1.AirportID
INNER JOIN Airports AS a2
ON f.DestinationAirportID = a2.AirportID
WHERE f.Status = 'Departing'
ORDER BY f.DepartureTime, f.FlightID