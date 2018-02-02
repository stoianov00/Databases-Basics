SELECT TOP(1) WITH TIES countr.Name AS [CountryName], AVG(f.Rate) AS [FeedbackRate] FROM Feedbacks AS f
INNER JOIN Customers AS c
ON c.Id = f.CustomerId
INNER JOIN Countries AS countr
ON countr.Id = c.CountryId
GROUP BY countr.Name
ORDER BY [FeedbackRate] DESC