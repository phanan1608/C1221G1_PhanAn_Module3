use ss2_practice_student_management;

select * from student
where student_name like 'h%';

select * from class
where month(start_date)  =12;

select * from subject_table
where credit between 3 and 5;

set sql_safe_updates = 0;
update student set class_id = 2 where student_name = "Hung";  
set sql_safe_updates = 1;

select s.student_name, sub.subject_name,m.mark
from student s
join mark m on s.student_id = m.student_id
join subject_table sub on m.subject_id = sub.subject_id
order by m.mark desc, s.student_name asc;

