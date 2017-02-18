CREATE PROCEDURE usp_CalculateFutureValueForAccount(@AccountID int, @Interest float)
AS
BEGIN
	SELECT 
		a.Id AS [Account Id], 
		ah.FirstName AS [First Name], 
		ah.LastName AS [Last Name],
		a.Balance AS [Current Balance],
		dbo.ufn_CalculateFutureValue(a.Balance, @Interest, 5) AS [Balance in 5 years]
	FROM Accounts AS a
	INNER JOIN AccountHolders AS ah
	ON a.AccountHolderId = ah.Id 
	WHERE a.Id = @AccountID
END