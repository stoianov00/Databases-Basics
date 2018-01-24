SELECT c.CountryCode, m.MountainRange, p.PeakName, p.Elevation
FROM MountainsCountries AS c
INNER JOIN Mountains AS m ON m.Id = c.MountainId
INNER JOIN Peaks AS p ON p.MountainId = c.MountainId
WHERE c.CountryCode = 'BG' AND p.Elevation > 2835
ORDER BY p.Elevation DESC