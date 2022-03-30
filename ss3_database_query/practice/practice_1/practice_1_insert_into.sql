use ss2_practice_student_management;
insert into class 
(class_name,start_date,`status`)
values ("C1221G1","2021-12-28",1),
 ("C0222G1","2021-02-28",1),
 ("C0322G1","2021-03-28",1);
 
 insert into student
(student_name,address,phone ,`status`,class_id)
values ('Hung', 'Ha Noi', '0912113113', 1, 1),
('Hoa', 'Hai phong', "0912312321",1, 1),
('Manh', 'HCM', '0123123123', 0, 2);

insert into subject_table
(subject_name,credit,`status`)
values ('CF', 5, 1),
       ('C', 6, 1),
       ('HDJ', 5, 1),
       ('RDBMS', 10, 1);

insert into mark
(subject_id,student_id,mark,exam_times)
values  (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
