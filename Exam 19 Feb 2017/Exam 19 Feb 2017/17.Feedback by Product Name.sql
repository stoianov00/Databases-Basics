CREATE FUNCTION udf_GetRating (@ProductName NVARCHAR(25))
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @Rating DECIMAL(4, 2) =
    (
	   SELECT AVG(f.Rate) FROM Feedbacks AS f
	   INNER JOIN Products AS p ON f.ProductId = p.Id
	   WHERE p.Name = @productName
    ); 

    DECLARE @RatingAsWord VARCHAR(20);
    
    IF(@Rating < 5)
    BEGIN
	   SET @RatingAsWord = 'Bad'
    END 
    ELSE IF (@Rating BETWEEN 5 AND 8)
    BEGIN 
	   SET @RatingAsWord = 'Average'
    END
    ELSE IF (@Rating > 8)
    BEGIN
	   SET @RatingAsWord = 'Good'
    END
    ELSE 
    BEGIN
	   SET @RatingAsWord = 'No rating' 
    END

    RETURN @RatingAsWord 
END

--testing
SELECT TOP 5 Id, Name, dbo.udf_GetRating(Name)
FROM Products
ORDER BY Id