USE Geography

SELECT ContinentCode, CurrencyCode, CurrencyUsage FROM 
	(SELECT	
		co.ContinentCode, 
		co.CurrencyCode, 
		COUNT(*) AS [CurrencyUsage],
		RANK() OVER (PARTITION BY co.ContinentCode ORDER BY COUNT(*) DESC) AS [Ranking]
	FROM Countries AS co
	GROUP BY co.ContinentCode, co.CurrencyCode
	HAVING COUNT(*) > 1) AS computed
WHERE Ranking = 1