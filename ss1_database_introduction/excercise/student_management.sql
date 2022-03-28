CREATE DATABASE `my_database1`;
CREATE TABLE my_database1.student (
    id INT KEY NOT NULL AUTO_INCREMENT,
    student_name VARCHAR(45),
    age INT,
    country VARCHAR(45)
);

INSERT INTO my_database1.student
(student_name,age,country)
VALUES 
("Hoang",25,"VN"),
("Luat",20,"VN"),
("My",30,"VN");

USE my_database1;
CREATE TABLE class (
    id INT NOT NULL AUTO_INCREMENT KEY,
    class_name VARCHAR(45)
);

INSERT INTO my_database1.class
(class_name)
VALUES
("C1221G1"),
("C0222G1"),
("C0222G2");

USE my_database1;
CREATE TABLE teacher( 
	id INT AUTO_INCREMENT NOT NULL KEY,
    name VARCHAR(45),
    age INT,
    country VARCHAR(45) 
);
INSERT INTO my_database1.teacher
(name, age,country)
VALUES
("ChanhTV",37,"VN"),
("ChienTV",27,"VN"),
("HaiTT",27,"VN");









