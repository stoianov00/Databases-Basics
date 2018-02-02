CREATE VIEW v_UserWithCountries
AS 
(
    SELECT cust.FirstName + ' ' + cust.LastName AS [CustomerName], cust.Age, cust.Gender,
    c.Name AS [CountryName] 
    FROM Countries AS c
    INNER JOIN Customers AS cust
    ON cust.CountryId = c.Id
)