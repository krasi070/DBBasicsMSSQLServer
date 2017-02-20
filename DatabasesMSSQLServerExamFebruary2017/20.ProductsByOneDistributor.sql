-- not very well writte
-- zero test doesn't work
SELECT
	p.Name AS [ProductName],
	AVG(f.Rate) AS [ProductAverageRate],
	d.Name AS [DistributorName],
	c.Name AS [DistributorCountry]
FROM Products AS p
INNER JOIN Feedbacks AS f
ON p.Id = f.ProductId 
INNER JOIN ProductsIngredients AS pri
ON p.Id = pri.ProductId
INNER JOIN Ingredients AS i
ON pri.IngredientId = i.Id
INNER JOIN Distributors AS d
ON i.DistributorId = d.Id
INNER JOIN Countries AS c
ON d.CountryId = c.Id
GROUP BY p.Name, d.Name, c.Name, p.Id
HAVING p.Name IN (SELECT ProductName FROM
	(SELECT
		p.Id,
		p.Name AS [ProductName],
		AVG(f.Rate) AS [ProductAverageRate],
		d.Name AS [DistributorName],
		c.Name AS [DistributorCountry]
	FROM Products AS p
	INNER JOIN Feedbacks AS f
	ON p.Id = f.ProductId 
	INNER JOIN ProductsIngredients AS pri
	ON p.Id = pri.ProductId
	INNER JOIN Ingredients AS i
	ON pri.IngredientId = i.Id
	INNER JOIN Distributors AS d
	ON i.DistributorId = d.Id
	INNER JOIN Countries AS c
	ON d.CountryId = c.Id
	GROUP BY p.Name, d.Name, c.Name, p.Id) AS computed
GROUP BY ProductName, ProductAverageRate
HAVING COUNT(DistributorName) = 1)
ORDER BY p.Id