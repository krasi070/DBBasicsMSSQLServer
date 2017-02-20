CREATE VIEW v_UserWithCountries AS
SELECT 
	CONCAT(c.FirstName, ' ', c.LastName) AS [CustomerName],
	c.Age,
	c.Gender,
	co.Name
FROM Customers AS c
INNER JOIN Countries AS co
ON c.CountryId = co.Id