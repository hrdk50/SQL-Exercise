USE AdventureWorks;
GO

CREATE FUNCTION IntegerListToTable
( @InputList varchar(MAX),@Delimiter char(1) = ',')
RETURNS @OutputTable TABLE (PositionInList int IDENTITY(1, 1) NOT NULL,IntegerValue int)
AS BEGIN
		INSERT INTO @OutputTable (IntegerValue)
		SELECT Value FROM STRING_SPLIT ( @InputList , @Delimiter );
	RETURN;
END;
GO



SELECT * FROM dbo.IntegerListToTable('234,12,3253,242,2',',');

SELECT * FROM dbo.IntegerListToTable('234|354253|3242|2','|');
