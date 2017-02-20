SELECT
	f.ProductId,
	c.FirstName + ' ' + c.LastName AS [CustomerName],
	f.Description AS [Feedback Description]
FROM Feedbacks AS f
INNER JOIN Customers AS c
ON f.CustomerId = c.Id
WHERE 
	(SELECT COUNT(*) 
	FROM Feedbacks 
	WHERE CustomerId = f.CustomerId) >= 3
ORDER BY f.ProductId, CustomerName, f.Id