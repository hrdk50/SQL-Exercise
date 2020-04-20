
USE tempdb;
GO

CREATE TRIGGER student_InsteadOfDELETE
ON student
INSTEAD OF DELETE
AS
BEGIN
       SET NOCOUNT ON;
 
       declare @studentid int
       select @studentid = deleted.studentid       
       FROM deleted
 
       IF @studentid = 2
       BEGIN
              RAISERROR('Parth''s record cannot be deleted',8,1)
              rollback
              insert into remember
              VALUES(@studentid, 'Record cannot be deleted.')
       END
       ELSE
       BEGIN
              DELETE FROM student
              WHERE studentid = @studentid
 
              INSERT INTO remember
              VALUES(@studentid, 'Instead Of Delete')
       END
END


delete from student where studentid = 2 