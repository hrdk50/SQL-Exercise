
USE tempdb;
GO

CREATE TABLE student (
    studentid int PRIMARY KEY,
    studentname varchar(30) NOT NULL,
    studentemail varchar(25)
);

CREATE TABLE remember (
    rememberid int PRIMARY KEY,
    msg varchar(max) NOT NULL,
	studentid int
);

-- after insert query
CREATE TRIGGER student_insert
ON student 
AFTER INSERT
AS
BEGIN
       SET NOCOUNT ON;
 
       declare @studentid int
       select @studentid = inserted.studentid       
       from inserted
       insert into remember values(@studentid, 'Inserted')
END

INSERT INTO student(studentname,studentemail) VALUES('Hardik','hardik@gmail.com')

select * from remember


-- after update query
CREATE TRIGGER student_update
ON student
AFTER UPDATE
AS
BEGIN
       SET NOCOUNT ON;
 
       declare @studentid int
       declare @msg varchar(max)
 
       select @studentid = inserted.studentid from inserted
 
       if update(studentname)
       BEGIN
              SET @msg = 'Updated Student Name'
       END
 
       if update(studentemail)
       BEGIN
              SET @msg = 'Updated Email Id'
       END
 
       insert into remember
       VALUES(@studentid, @msg)
END

--after delete query
CREATE TRIGGER student_delete
ON student
AFTER DELETE
AS
BEGIN
       SET NOCOUNT ON;
       declare @studentid int
 
       SELECT @studentid = deleted.studentid       
       FROM deleted
 
       insert into remember
       VALUES(@studentid, 'Deleted')
END