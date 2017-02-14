USE Geography

SELECT TOP (5)
	c.CountryName,
	MAX(p.Elevation) AS [HighestPeakElevation], 
	MAX(r.Length) AS [LongestRiverLength]
FROM Countries AS c
FULL JOIN MountainsCountries AS mc
ON c.CountryCode = mc.CountryCode
FULL JOIN Peaks AS p
ON mc.MountainId = p.MountainId
FULL JOIN CountriesRivers AS cr
ON c.CountryCode = cr.CountryCode
FULL JOIN Rivers AS r
ON cr.RiverId = r.Id
GROUP BY c.CountryName
ORDER BY MAX(p.Elevation) DESC, MAX(r.Length) DESC, c.CountryName