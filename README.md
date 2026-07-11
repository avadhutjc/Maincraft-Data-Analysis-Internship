# Maincraft Data Analysis Internship - Task 2

## Overview
This README documents **Task 2** using only:
- `Query Console Task 2.sql`

Task 2 extends the existing student database by adding course and enrollment data, then solving SQL questions with joins, aggregation, sorting, and filtering.

## SQL File Used
- `Query Console Task 2.sql`

## Task 2 Operations

### 1) Database and Table Work
- Uses `StudentManagement` database.
- Creates `courses` table.
- Creates `enrollments` mapping table to model many-to-many relation between students and courses.
- Inserts sample course and enrollment records.

### 2) Queries Answered

#### Q1. List all students enrolled in each course
```sql
SELECT s.name, c.name
FROM enrollments e
JOIN students s ON e.stud_id = s.student_id
JOIN courses c ON e.c_id = c.course_id;
```
**Explanation:** Shows each student with the course they are enrolled in.

#### Q2. Find average grade per course
```sql
SELECT c.name, ROUND(AVG(e.grade), 2) AS avg_grade
FROM enrollments e
JOIN courses c ON e.c_id = c.course_id
GROUP BY c.name;
```
**Explanation:** Calculates course-wise average grade.

#### Q3. Find top 3 students overall
```sql
SELECT s.name, ROUND(AVG(e.grade), 2) AS avg_grade
FROM enrollments e
JOIN students s ON e.stud_id = s.student_id
GROUP BY s.name
ORDER BY avg_grade DESC
LIMIT 3;
```
**Explanation:** Returns top three students based on highest average grade.

#### Q4. Count students who failed (grade < 40)
```sql
SELECT s.name, e.grade, COALESCE(COUNT(s.student_id), 0) AS fail_stud_count
FROM enrollments e
JOIN students s ON s.student_id = e.stud_id
WHERE e.grade < 40
GROUP BY s.name, e.grade;
```
**Explanation:** Lists students with failing grades and counts matching records.

## Screenshot References (Question + Output)

### Screenshot 1 - Q1 Result
![Task2 Screenshot 1](https://github.com/user-attachments/assets/23311656-223a-486d-a91e-ae60be6829ec)

### Screenshot 2 - Task 2 Result
![Task2 Screenshot 2](https://github.com/user-attachments/assets/57c90ba6-26a6-4f2b-b417-2d889471083f)

### Screenshot 3 - Task 2 Result
![Task2 Screenshot 3](https://github.com/user-attachments/assets/10254c82-999a-4acf-a9e3-3af7338d39f4)

### Screenshot 4 - Task 2 Result
![Task2 Screenshot 4](https://github.com/user-attachments/assets/2d84a48f-91f4-4758-9a20-27bd1a847167)

## How to Run
1. Open MySQL client / SQL IDE.
2. Run `Query Console Task 2.sql`.
3. Execute Q1 to Q4 and compare outputs with screenshots.

## Project Structure
```text
Maincraft-Data-Analysis-Internship/
├── Query Console Task 2.sql
└── README.md
```