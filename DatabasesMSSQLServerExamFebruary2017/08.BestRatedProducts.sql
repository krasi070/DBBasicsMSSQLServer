SELECT TOP (10)
	p.Name,
	p.Description,
	AVG(f.Rate) AS [AverageRate],
	COUNT(f.Id) AS [FeedbackAmount]
FROM Products AS p
INNER JOIN Feedbacks AS f
ON p.Id = f.ProductId
GROUP BY p.Name, p.Description
ORDER BY AVG(f.Rate) DESC, COUNT(f.Id) DESC