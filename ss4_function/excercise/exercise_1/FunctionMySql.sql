use ss2_practice_student_management;

# Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select *
from subject_table
where credit = (select max(credit) from subject_table);

# Hiển thị các thông tin môn học có điểm thi lớn nhất.
select *
from subject_table
         join mark m on subject_table.subject_id = m.subject_id
where mark = (select max(mark) from mark);

# Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select student.student_id, student_name, avg(mark) as avg
from student
         join mark m on student.student_id = m.student_id
group by student.student_id
order by avg;

