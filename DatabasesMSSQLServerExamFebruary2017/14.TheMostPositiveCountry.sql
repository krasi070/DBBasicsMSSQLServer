WITH cte_AverageFeedbackRatePerCountry(CountryName, FeedbackRate)
AS
(
	SELECT c.Name, AVG(f.Rate) AS [FeedbackRate]
	FROM Countries AS c
	INNER JOIN Customers AS cu
	ON c.Id = cu.CountryId
	INNER JOIN Feedbacks AS f
	ON cu.Id = f.CustomerId
	GROUP BY c.Name
)

SELECT CountryName, FeedbackRate
FROM cte_AverageFeedbackRatePerCountry
WHERE FeedbackRate = 
	(SELECT MAX(FeedbackRate) 
	FROM cte_AverageFeedbackRatePerCountry)