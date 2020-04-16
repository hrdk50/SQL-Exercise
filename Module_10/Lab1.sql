USE AdventureWorks;
GO

CREATE FUNCTION fnStandardPhone
               (@PhoneNumber VARCHAR(32))
RETURNS VARCHAR(32)
AS
  BEGIN
    DECLARE  @Phone CHAR(32)

    SET @Phone = @PhoneNumber

    --  phone number string
    WHILE PATINDEX('%[^0-9]%',@PhoneNumber) > 0
      SET @PhoneNumber = REPLACE(@PhoneNumber,
               SUBSTRING(@PhoneNumber,PATINDEX('%[^0-9]%',@PhoneNumber),1),'') 

    -- US standard phone number

    SET @Phone = @PhoneNumber
    SET @PhoneNumber = '(' + SUBSTRING(@PhoneNumber,1,3) + ') ' +
             SUBSTRING(@PhoneNumber,4,3) + '-' + SUBSTRING(@PhoneNumber,7,4) 
	RETURN @PhoneNumber 
  END



SELECT dbo.fnStandardPhone('+61 3 9485-2342') as 'Phone Number';
SELECT dbo.fnStandardPhone('415 485-2342') as 'Phone Number';
SELECT dbo.fnStandardPhone('(41) 5485-2342') as 'Phone Number';
SELECT dbo.fnStandardPhone('94852342') as 'Phone Number';
SELECT dbo.fnStandardPhone('85-2342') as 'Phone Number';

