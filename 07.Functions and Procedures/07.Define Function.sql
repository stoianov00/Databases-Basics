CREATE FUNCTION ufn_IsWordComprised(@SetOfLetters VARCHAR(MAX), @Word VARCHAR(MAX))
RETURNS BIT
AS
BEGIN
    DECLARE @IsComprised BIT = 0;
    DECLARE @Counter INT = 1;
    DECLARE @CurrentChar CHAR;
        
    WHILE(LEN(@Word) >= @Counter)
    BEGIN
	   SET @CurrentChar = SUBSTRING(@Word, @Counter, 1)
	   DECLARE @Match INT = CHARINDEX(@CurrentChar, @SetOfLetters)

	   IF(@Match = 0)
	   BEGIN
		  SET @IsComprised = 0
		  RETURN @IsComprised
	   END
	   SET @Counter += 1
    END
    RETURN 1
END

--testing
SELECT dbo.ufn_IsWordComprised ('bobr', 'Rob')