create database project;
use project;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    grade_level VARCHAR(5),
    email VARCHAR(100),
    guardian_phone VARCHAR(15),
    enrollment_date DATE
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    subject VARCHAR(50),
    grade_level VARCHAR(5),
    teacher_name VARCHAR(50),
    credits INT
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    final_grade VARCHAR(15),
    attendance_pct INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

select * from courses;
select * from enrollments;
select * from students;
##BASIC

## 1.List all students in grade level "10".
SELECT * FROM students WHERE grade_level = '10';

##2.Find all courses that carry 4 credits.
SELECT * FROM courses WHERE credits = 4;

##3.Find all courses taught by "Mr. Sharma".
SELECT * FROM courses WHERE teacher_name = 'Mr. Sharma';

##4.List all enrollments with a final grade of "A+".
SELECT * FROM enrollments WHERE final_grade = 'A+';

##5.List enrollments with attendance_pct below 75.
SELECT * FROM enrollments WHERE attendance_pct < 75;

##6.Find the student(s) with the most recent enrollment_date.
SELECT * FROM students ORDER BY enrollment_date DESC
LIMIT 1;

#GROUP BY

## 7.Find the average attendance_pct across all enrollments.
SELECT AVG(attendance_pct) AS avg_attendance FROM enrollments;

##8. Count how many courses each teacher teaches.
SELECT teacher_name, COUNT(*) AS total_courses
FROM courses
GROUP BY teacher_name;

##9.Find the total number of students enrolled in each grade_level.
SELECT grade_level, COUNT(*) AS total_students
FROM students
GROUP BY grade_level;

## 10.Find the number of enrollments per final_grade category.
SELECT final_grade, COUNT(*) AS total
FROM enrollments
GROUP BY final_grade;

##11.Find the highest and lowest attendance_pct recorded.
SELECT MAX(attendance_pct) AS highest, MIN(attendance_pct) AS lowest
FROM enrollments;

##12.Count how many students are enrolled in more than one course.
SELECT student_id, COUNT(*) AS course_count
FROM enrollments
GROUP BY student_id
HAVING COUNT(*) > 1;

##13. Show all courses along with the teacher name and the grade level they teach.
SELECT course_id, subject, teacher_name, grade_level
FROM courses;

##14.List students who are enrolled in "Mathematics" courses.
SELECT DISTINCT s.first_name, s.last_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.subject = 'Mathematics';

##15.Find all students taught by "Mrs. Iyer", along with the subject.
SELECT s.first_name, s.last_name, c.subject
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.teacher_name = 'Mrs. Iyer';

##16.Show each student's name along with their average attendance_pct across all courses.
SELECT s.student_id, s.first_name, s.last_name, AVG(e.attendance_pct) AS avg_attendance
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.first_name, s.last_name;

##17.Find students whose average attendance_pct is above the overall average.
SELECT s.student_id, s.first_name, s.last_name, AVG(e.attendance_pct) AS avg_attendance
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING AVG(e.attendance_pct) > (SELECT AVG(attendance_pct) FROM enrollments);

##18.Find the teacher(s) with the highest total number of enrolled students (across all their courses).
SELECT c.teacher_name, COUNT(e.enrollment_id) AS total_students
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.teacher_name
ORDER BY total_students DESC
LIMIT 1;

##19.List courses with more than 3 enrollments, using HAVING.
SELECT c.course_id, c.subject, COUNT(e.enrollment_id) AS total_enrollments
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.subject
HAVING COUNT(e.enrollment_id) > 3;

##20.Find students who have a final_grade of "In Progress" and the course subject for each.
SELECT s.first_name, s.last_name, c.subject
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.final_grade = 'In Progress';