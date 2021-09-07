CREATE DATABASE mydatabase;
use mydatabase;
CREATE TABLE users(user_id int, username varchar(30), codekata_solved int, attendance char, topics int, tasks int, company_drives_attended int, mentor varchar(30));
ALTER TABLE users ADD PRIMARY KEY (user_id);
CREATE TABLE courses(c_id int PRIMARY KEY, course_name varchar(30));
CREATE TABLE student_activated_courses(c_id int, user_id int, FOREIGN KEY (c_id) REFERENCES courses(c_id),  FOREIGN KEY (user_id) REFERENCES users(user_id));
DESC users;
DESC courses;
DESC student_activated_courses;
INSERT INTO users VALUES
(101, 'Ramesh', 67, 'P', 4, 6, 3, 'Sameer'),
(102, 'Vaidehi', 83, 'P', 7, 7, 5, 'Sameer'),
(103, 'Akash', 50, 'P', 5, 3, 2, 'Vikas'),
(104, 'Meera', 94, 'A', 8, 10, 6, 'Sameer'),
(105, 'Tanya', 40, 'P', 3, 5, 2, 'Vikas');
INSERT INTO courses VALUES(1, 'course1'), (2, 'course2'), (3, 'course3');
INSERT INTO student_activated_courses VALUES(1, 101), (1, 103), (1, 104), (2, 102), (2, 105), (3, 101), (3, 104);
SELECT * FROM users;
SELECT * FROM courses;
SELECT * FROM student_activated_courses;
SELECT SUM(codekata_solved) FROM users;
SELECT company_drives_attended FROM users WHERE user_id=105;
SELECT username, course_name FROM users JOIN student_activated_courses JOIN courses WHERE users.user_id=104 GROUP BY course_name;
SELECT DISTINCT mentor FROM users;
SELECT mentor, COUNT(*) FROM users WHERE mentor='Sameer';