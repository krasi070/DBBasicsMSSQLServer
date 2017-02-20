SELECT
	d.Name AS [DistributorName],
	i.Name AS [IngredientName],
	p.Name AS [ProductName],
	AVG(f.Rate) AS [AverageRate]
FROM Distributors AS d
INNER JOIN Ingredients AS i
ON d.Id = i.DistributorId
INNER JOIN ProductsIngredients AS pri
ON i.Id = pri.IngredientId
INNER JOIN Products AS p
ON pri.ProductId = p.Id
INNER JOIN Feedbacks AS f
ON p.Id = f.ProductId
GROUP BY d.Name, i.Name, p.Name
HAVING AVG(f.Rate) BETWEEN 5 AND 8
ORDER BY d.Name, i.Name, p.Name