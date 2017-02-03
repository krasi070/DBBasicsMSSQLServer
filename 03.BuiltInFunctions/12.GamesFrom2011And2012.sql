USE Diablo
SELECT TOP (50) Name, CONVERT(varchar(10), Start, 120) AS Started FROM Games
WHERE YEAR(Start) = 2011 OR YEAR(Start) = 2012
ORDER BY Start, Name