USE Geography

SELECT TOP (5)
	CountryName,
	PeakName AS [HighestPeakName],
	Elevation AS [HighestPeakElevation],
	Mountain 
FROM (SELECT 
		c.CountryName,
		CASE
			WHEN p.PeakName IS NULL THEN '(no highest peak)'
			ELSE p.PeakName
		END AS [PeakName],
		CASE
			WHEN p.Elevation IS NULL THEN 0
			ELSE p.Elevation
		END AS [Elevation],
		CASE
			WHEN m.MountainRange IS NULL THEN '(no mountain)'
			ELSE m.MountainRange
		END AS [Mountain],
		RANK() OVER (PARTITION BY c.CountryName ORDER BY p.Elevation DESC) AS [Ranking]
	FROM Countries AS c
	LEFT OUTER JOIN MountainsCountries AS mc
	ON c.CountryCode = mc.CountryCode
	LEFT OUTER JOIN Peaks AS p
	ON mc.MountainId = p.MountainId
	LEFT OUTER JOIN Mountains AS m
	ON mc.MountainId = m.Id) AS computed
WHERE Ranking = 1
ORDER BY CountryName, PeakName