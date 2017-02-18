CREATE TRIGGER tr_ArrivedFlights ON Flights AFTER UPDATE
AS
BEGIN
	INSERT INTO ArrivedFlights(FlightID, ArrivalTime, Origin, Destination, Passengers)
	(SELECT f.FlightID, f.ArrivalTime, ao.AirportName, ad.AirportName, COUNT(t.TicketID)
	FROM inserted AS f
	INNER JOIN Airports AS ao
	ON f.OriginAirportID = ao.AirportID
	INNER JOIN Airports AS ad
	ON f.DestinationAirportID = ad.AirportID
	LEFT JOIN Tickets AS t
	ON f.FlightID = t.FlightID
	WHERE f.Status = 'Arrived'
	GROUP BY f.FlightID, f.ArrivalTime, ao.AirportName, ad.AirportName
	)
END

UPDATE Flights
SET Status = 'Arrived'
WHERE FlightID = 3

SELECT * FROM ArrivedFlights