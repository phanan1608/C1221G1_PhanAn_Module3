use ss2_practice_student_management;

select address, count(student_id) as number_of_student
from student
group by address;

select s.student_id, s.student_name, avg(Mark)
from student s
         join mark m on s.student_id = m.student_id
group by s.student_id, s.student_name;

select s.student_id, s.student_name, avg(Mark)
from student s
         join mark m on s.student_id = m.student_id
group by s.student_id, s.student_name
having avg(mark) > 8;

select s.student_id, s.student_name, avg(mark)
from student s
         join mark m on s.student_id = m.student_id
group by s.student_id, s.student_name
having avg(mark) >= all (select avg(mark) from mark group by mark.student_id);