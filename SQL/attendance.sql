--take attendance

Update Schedule
Set statsus = '1'
Where student_id = 'HE153488'

--view attendance

select g.groupname, sg.student_id, s.surname+' '
+s.middlename+' '+s.givenname as [FullName],
sc.statsus, i.account_id as Taker, sc.recordtime
from [Group] as g
join Instructor as i on g.instrurtor_id = i.instructor_id
join Student_Group as sg on sg.group_id = g.group_id
join Student as s on s.student_id = sg.student_id
join Schedule as sc on sc.student_id = sg.student_id
where g.groupname = 'SE1605' and sc.student_id = 'HE153488'