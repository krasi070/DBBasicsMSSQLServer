USE Geography
SELECT Peaks.PeakName, Rivers.RiverName, LOWER(SUBSTRING(Peaks.PeakName, 1, LEN(Peaks.PeakName) - 1) + Rivers.RiverName) AS Mix
FROM Peaks, Rivers
WHERE RIGHT(Peaks.PeakName, 1) = LEFT(Rivers.RiverName, 1)
ORDER BY Mix