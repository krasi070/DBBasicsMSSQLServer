USE Gringotts

DECLARE @currDeposit decimal(8, 2)
DECLARE @previousDeposit decimal(8, 2)
DECLARE @totalSum decimal(8, 2) = 0

DECLARE wizardCursor CURSOR FOR SELECT DepositAmount FROM WizzardDeposits
OPEN wizardCursor
FETCH NEXT FROM wizardCursor INTO @currDeposit

WHILE (@@FETCH_STATUS = 0)
BEGIN
	IF (@previousDeposit IS NOT NULL)
	BEGIN
		SET @totalSum += @previousDeposit - @currDeposit
	END

	SET @previousDeposit = @currDeposit;
	FETCH NEXT FROM wizardCursor INTO @currDeposit 
END

CLOSE wizardCursor
DEALLOCATE wizardCursor

SELECT @totalSum AS SumDifference