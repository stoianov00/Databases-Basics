SELECT TOP(10) p.Name, p.Description, AVG(f.Rate) AS [AverageRate],
COUNT(f.Id) AS [FeedBackAmount]  FROM Products AS p
INNER JOIN Feedbacks AS f
ON f.ProductId = p.Id
GROUP BY p.Name, p.Description
ORDER BY [AverageRate] DESC, [FeedBackAmount] DESC