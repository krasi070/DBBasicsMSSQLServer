CREATE PROCEDURE usp_GetTownsStartingWith(@String varchar(max))
AS
BEGIN
	SELECT Name FROM Towns
	WHERE LOWER(SUBSTRING(Name, 1, LEN(@String))) = LOWER(@String)
END

EXEC usp_GetTownsStartingWith 'b'