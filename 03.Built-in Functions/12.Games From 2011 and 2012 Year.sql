SELECT TOP(50) Name, 
LEFT(CONVERT(varchar, Start, 120), 10) AS Start
FROM Games
WHERE YEAR(Start) IN (2011, 2012)
ORDER BY Games.Start, Name