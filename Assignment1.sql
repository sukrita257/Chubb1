CREATE DATABASE mydatabase;
USE mydatabase;
CREATE TABLE users(user_id int PRIMARY KEY, username varchar(20), codekata_solved int, company_attended int, mentor_id int, FOREIGN KEY (mentor_id) REFERENCES mentor(mentor_id));
CREATE TABLE codekata(codekata_id int PRIMARY KEY, codekata_name varchar(20), solved_by int);
CREATE TABLE attendance(a_id int, FOREIGN KEY (a_id) REFERENCES users(user_id), attendance char);
CREATE TABLE topics(topic_id int PRIMARY KEY, topic_name varchar(20));
CREATE TABLE tasks(task_id int PRIMARY KEY, task_name varchar(20));
CREATE TABLE company_drive(c_id int PRIMARY KEY, c_name varchar(20), c_attendance char);
CREATE TABLE mentor(mentor_id int PRIMARY KEY, mentor_name varchar(20));
CREATE TABLE courses(course_id int PRIMARY KEY, course_name varchar(20));
CREATE TABLE students_activated_courses(s_id int, course_id int, FOREIGN KEY (s_id) REFERENCES users(user_id), FOREIGN KEY (course_id) REFERENCES courses(course_id));

INSERT INTO users VALUES (101, "Rohan", 19, 5, 1),
						(102, "Meera", 8, 3, 1), 
                        (103, "Gita", 4, 2, 3),
                        (104,"Suman", 10, 3, 4),
                        (105,"Shivam", 12, 4, 5);
INSERT INTO codekata VALUES (11, "DSA", 2),
							(12, "OOP", 1),
                            (13, "DBMS", 1),
                            (14, "Arrays", 1),
                            (15, "Java", 0);
INSERT INTO attendance VALUES (101,"P"), (102,"A"),(103,"P"),(104,"A"),(105,"P");
INSERT INTO topics VALUES (1,"T1"),(2,"T2"),(3,"T3"),(4,"T4"),(5,"T5");
INSERT INTO tasks VALUES(1,"Task1"),(2,"Task2"),(3,"Task3"),(4,"Task4"),(5,"Task5");
INSERT INTO company_drive VALUES (1,"Chubb","P"),(2,"Accolite","A"),(3,"Dell","P"),(4,"TCS","A"),(5,"HRC","A");
INSERT INTO mentor VALUES(1,"AAA"),(2,"BBB"),(3,"CCC"),(4,"DDD"),(5,"EEE");
INSERT INTO courses VALUES (1001,"Arrays"),(1002,"DSA"),(1003,"Java"),(1004,"DBMS"),(1005,"OOP");
INSERT INTO students_activated_courses VALUES (101, 1004),(102, 1002),(103, 1005),(104, 1001),(105, 1002);

SELECT SUM(codekata_solved) FROM users;
SELECT company_attended FROM users WHERE user_id="101";
SELECT username, course_name FROM users JOIN students_activated_courses JOIN courses WHERE users.user_id=104 GROUP BY course_name;
SELECT mentor_name FROM mentor;
(SELECT * FROM users WHERE mentor_id='1');
