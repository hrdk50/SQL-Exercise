create vStudent as select s.studentId,s.studentName,r.result
from Students s, Resulr r
where e.studentId = r.studentId;

update vStudent set studentName='xyz',result='pass' where studentId = 1