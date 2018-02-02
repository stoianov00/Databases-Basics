SELECT cust.FirstName, cust.Age, cust.PhoneNumber FROM Customers AS cust
INNER JOIN Countries AS c
ON c.Id = cust.CountryId
WHERE cust.Age >= 21 
AND  
FirstName LIKE '%an%'
OR
PhoneNumber LIKE '%38'
AND c.Name <> 'Greece'
ORDER BY cust.FirstName, cust.Age DESC