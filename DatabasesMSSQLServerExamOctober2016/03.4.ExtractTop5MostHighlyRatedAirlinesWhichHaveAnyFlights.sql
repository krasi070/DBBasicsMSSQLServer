USE October2016Exam

SELECT DISTINCT TOP (5)
	a.AirlineID,
	a.AirlineName,
	a.Nationality,
	a.Rating
FROM Airlines AS a
INNER JOIN Flights AS f
ON a.AirlineID = f.AirlineID
ORDER BY Rating DESC, AirlineID