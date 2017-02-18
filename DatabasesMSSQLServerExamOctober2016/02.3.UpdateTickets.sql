USE October2016Exam

UPDATE Tickets
SET Price = Price * 1.5
WHERE FlightID IN 
	(SELECT Flights.FlightID FROM Flights
	INNER JOIN Airlines
	ON Flights.AirlineID = Airlines.AirlineID
	WHERE Airlines.Rating = (SELECT MAX(Airlines.Rating) FROM Airlines))