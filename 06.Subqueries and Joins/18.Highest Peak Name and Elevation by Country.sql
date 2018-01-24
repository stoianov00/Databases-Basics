SELECT TOP(5) CountryName AS [Country],
CASE 
WHEN PeakName IS NULL THEN '(no highest peak)'
ELSE PeakName
END AS [Highest Peak Name], 
CASE  
WHEN Elevation IS NULL THEN 0
ELSE Elevation
END AS [Highest Peak Elevation],
CASE 
WHEN MountainRange IS NULL THEN '(no mountain)'
ELSE MountainRange
END AS [Mountain]
FROM
(
SELECT CountryName, PeakName, Elevation, MountainRange,
DENSE_RANK() OVER(PARTITION BY CountryName ORDER BY Elevation DESC)
AS [Rank]
FROM 
(
SELECT c.CountryName, p.PeakName, p.Elevation, m.MountainRange FROM Countries AS c
LEFT OUTER JOIN MountainsCountries AS mc
ON mc.CountryCode = c.CountryCode
LEFT OUTER JOIN Mountains AS m
ON m.Id = mc.MountainId
LEFT JOIN Peaks AS p ON p.MountainId = m.Id) AS AllPeaks) AS RankedPeaks
WHERE [Rank] = 1
ORDER BY CountryName, PeakName