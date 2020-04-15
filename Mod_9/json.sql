Use NaukriDb

create procedure spJSON
@json varchar(max)
as
begin

insert into Skills(SkillName,UserId)
select SkillName,UserId from openjson(@json) 
with (SkillName varchar(50) '$.skills',userId bigint '$.id')as jsonValues 
end

exec spJSON @json ='{"skills":"abc","id":"1"}'

select * from Skills 


 
CREATE PROCEDURE RetrieveJson 
@jsonOutput VARCHAR(MAX) OUTPUT 
AS 
BEGIN
 
SET @jsonOutput = (SELECT TOP (1)
      SkillName,UserId FROM Skills
    FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
END

DECLARE @json AS NVARCHAR(MAX)
EXEC RetrieveJson @jsonOutput = @json OUTPUT
 
SELECT @json