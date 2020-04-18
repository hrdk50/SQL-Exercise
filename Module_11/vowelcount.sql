create FUNCTION countvowels
(@noVowels varchar(max))
RETURNS int
AS
begin

declare  @string int=0
Select @string=len(@noVowels)-len(replace(replace(replace(replace(replace(@noVowels,'a',''),'e',''),'i',''),'o',''),'u','') )
return @string
end
GO

select dbo.countvowels('aabbcciio') as 'Total Vowels'

