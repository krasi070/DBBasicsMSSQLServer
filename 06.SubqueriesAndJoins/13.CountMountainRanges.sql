USE Geography

SELECT c.CountryCode, COUNT(m.MountainRange)
FROM Countries AS c
INNER JOIN MountainsCountries AS mc
ON c.CountryCode = mc.CountryCode
INNER JOIN Mountains AS m
ON mc.MountainId = m.Id
GROUP BY c.CountryCode
HAVING c.CountryCode = 'BG' OR
	c.CountryCode = 'RU' OR
	c.CountryCode = 'US'