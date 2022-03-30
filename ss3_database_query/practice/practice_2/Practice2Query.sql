use ss2_practice_student_management;
select * from student;

select * from student where `status` = true ;

select * from subject_table where credit <10 ;

select S.student_id, S.student_name,C.class_name
from student S join class C on S.class_id = C.class_id;

select S.student_id, S.student_name,C.class_name
from student S join class C on S.class_id = C.class_id
where C.class_name = "C1221G1";

select S.student_id, S.student_name, Sub.subject_name,M.mark
from student S 
join mark M on S.student_id = M.student_id 
join subject_table Sub on M. subject_id = Sub.subject_id;

select S.student_id, S.student_name, Sub.subject_name,M.mark
from student S 
join mark M on S.student_id = M.student_id 
join subject_table Sub on M. subject_id = Sub.subject_id
where Sub.subject_name="CF";
