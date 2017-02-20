SELECT CountryName, DistributorName
FROM
	(SELECT 
		c.Name AS [CountryName], 
		d.Name AS [DistributorName],
		COUNT(i.Id) AS [IngredientsDistributed],
		RANK() OVER (PARTITION BY c.Name ORDER BY COUNT(i.Id) DESC) AS Ranking
	FROM Countries AS c
	INNER JOIN Distributors AS d
	ON c.Id = d.CountryId
	LEFT OUTER JOIN Ingredients AS i
	ON d.Id = i.DistributorId
	GROUP BY c.Name, d.Name) AS DistributorRankings
WHERE Ranking = 1
ORDER BY CountryName, DistributorName