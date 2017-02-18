CREATE PROCEDURE usp_GetHoldersWithBalanceHigherThan(@Balance money)
AS
BEGIN
	SELECT ah.FirstName AS [First Name], ah.LastName AS [Last Name]
	FROM AccountHolders AS ah
	INNER JOIN 
	(SELECT AccountHolderID, SUM(Balance) AS [TotalBalance]
	FROM Accounts
	GROUP BY AccountHolderId) AS a
	ON ah.Id = a.AccountHolderId
	WHERE a.TotalBalance > @Balance
	ORDER BY [Last Name], [First Name]
END