# 🎓 School Management System — SQL Project

## 📌 Overview
This project analyzes a school's academic and enrollment data using SQL. It models students, courses, and enrollments to uncover insights around student performance, course popularity, attendance trends, and teacher workload — built as a hands-on portfolio project to practice real-world relational database design and business-oriented SQL analysis.

## 🎯 Objective
To design a relational database and write SQL queries that go beyond basic syntax practice, answering real academic questions such as which courses are most popular, which students perform best, and how attendance correlates with grades.

## 🛠️ Tools & Technologies
| Category | Details |
|---|---|
| Database | MySQL |
| Tool | MySQL Workbench |
| Version Control | GitHub |
| Data | Custom-generated sample dataset (30+ records per table) |

## 🗂️ Database Schema

**students**
| Column | Description |
|---|---|
| student_id | Primary key |
| first_name, last_name | Student name |
| grade_level | Current grade (6–12) |
| email | Student email |
| guardian_phone | Contact number |
| enrollment_date | Date joined the school |

**courses**
| Column | Description |
|---|---|
| course_id | Primary key |
| subject | Course subject |
| grade_level | Grade the course is offered to |
| teacher_name | Assigned teacher |
| credits | Course credit value |

**enrollments**
| Column | Description |
|---|---|
| enrollment_id | Primary key |
| student_id | Foreign key → students |
| course_id | Foreign key → courses |
| enrollment_date | Date enrolled in the course |
| final_grade | Final grade received |
| attendance_pct | Attendance percentage |

## 💻 SQL Concepts Applied
- ✅ Joins across multiple tables
- ✅ Aggregate functions (COUNT, AVG, MAX, MIN)
- ✅ GROUP BY & HAVING
- ✅ Subqueries
- ✅ CASE statements
- ✅ Filtering, sorting & LIMIT

## 🔍 Key Business Questions Explored
- Which students have the highest average attendance?
- How many students are enrolled in each course/subject?
- Which teachers have the highest number of enrolled students?
- What is the grade distribution across all enrollments?
- Which students are enrolled in courses across multiple subjects?
- Which courses have the highest/lowest enrollment?
- Which students perform above the average attendance rate?

## 📁 Repository Structure
```
├── school_sample_data.sql     -- Schema + sample data (CREATE TABLE + INSERT)
├── queries.sql                -- 20 question SQL queries with answers
└── README.md                  -- Project documentation
```

## 📈 Outcome
This project strengthened my ability to translate real-world academic questions into structured SQL queries, and demonstrated core data analysis skills including joins, aggregation, subqueries, and filtering on relational data.

## 🔗 Connect
Feel free to explore the queries, fork the repo, or reach out with feedback!

---
*Part of my SQL & Data Analytics portfolio.*
