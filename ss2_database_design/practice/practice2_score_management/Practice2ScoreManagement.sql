create database score_management;
use score_management;
create table score_management.student(
		student_code int primary key auto_increment,
        student_name varchar(50),
        day_of_birth datetime,
        class varchar(20),
        gender varchar(20)
);
create table score_management.subjects(
		subject_code int primary key auto_increment,
        subject_name varchar(50)
);
create table score_management.transcript(
		student_code int,
        subject_code int,
        score int,
        exam_date datetime,
        primary key (student_code, subject_code),
        foreign key (student_code) references score_management.student(student_code),
        foreign key (subject_code) references score_management.subjects(subject_code)
);
create table score_management.teacher(
		teacher_code int primary key auto_increment,
        teacher_name varchar(50),
       phone_number varchar(10)
);
alter table score_management.subjects add teacher_code int;

alter table score_management.subjects add constraint fk_teacher foreign key(teacher_code) references  score_management.teacher(teacher_code);


