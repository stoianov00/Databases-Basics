SELECT f.ProductId, CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
ISNULL(f.Description, '') AS FeedbackDescription
FROM Feedbacks AS f
INNER JOIN (
  SELECT CustomerId
  FROM Feedbacks
  GROUP BY CustomerId
  HAVING COUNT(Id) >= 3
) AS topCustomers
ON f.CustomerId = topCustomers.CustomerId
JOIN Customers AS c ON c.Id = topCustomers.CustomerId
ORDER BY f.ProductId, CustomerName, f.Id