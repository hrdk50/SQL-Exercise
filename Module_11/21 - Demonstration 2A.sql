
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

CREATE TRIGGER remember_email
ON student 
AFTER INSERT
as
BEGIN
    declare @emailid varchar(25), @id int
	select @id = studentid from inserted		
	select @emailid = studentemail from inserted
    IF @emailid IS NULL 
	Begin
        INSERT INTO remember(studentid,msg)
        VALUES(@id,'enter your email');
    END
END

INSERT INTO student(studentid,studentname,studentemail) VALUES(2,'parth','')

select * from remember

