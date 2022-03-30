DROP  TABLE my_database.student;

CREATE TABLE my_database.student (
    id INT KEY NOT NULL AUTO_INCREMENT,
    student_name VARCHAR(45),
    age INT,
    country VARCHAR(45)
);