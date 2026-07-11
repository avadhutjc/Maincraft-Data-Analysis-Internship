-- 1. Database Setup:
CREATE DATABASE StudentManagement;

SELECT DATABASE();

USE StudentManagement;

CREATE TABLE students
(
    StudentID    SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    Name         VARCHAR(50)       NOT NULL,
    Gender       CHAR(1)           NOT NULL,
    Age          SMALLINT UNSIGNED NOT NULL,
    Grade        VARCHAR(2)        NOT NULL,
    MathScore    SMALLINT UNSIGNED NOT NULL,
    ScienceScore SMALLINT UNSIGNED NOT NULL,
    EnglishScore SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (StudentID)
);

-- Updating column name from Uppercase to lowercase:
ALTER TABLE StudentManagement.students
    RENAME COLUMN studentId TO student_id;

ALTER TABLE students
    RENAME COLUMN name TO name;

ALTER TABLE students
    RENAME COLUMN gender TO gender;

ALTER TABLE students
    RENAME COLUMN age TO age;

ALTER TABLE students
    RENAME COLUMN grade TO grade;

ALTER TABLE students
    RENAME COLUMN mathscore TO math_score;

ALTER TABLE students
    RENAME COLUMN scienceScore TO science_score;

ALTER TABLE students
    RENAME COLUMN EnglishScore TO english_score;

-- 2. Inserting values into student table: Add at least 10 records with variety
Insert INTO students (student_id, name, gender, age, grade, math_score, science_score, english_score)
values (1, 'Shree', 'M', 26, 'A', 95, 98, 91);

Insert INTO students (student_id, name, gender, age, grade, math_score, science_score, english_score)
values (2, 'Shubham', 'M', 28, 'B', 75, 78, 72);

INSERT INTO students(student_id, name, gender, age, grade, math_score, science_score, english_score)
VALUES (3, 'Snehal', 'F', 27, 'C', 70, 75, 76);

INSERT INTO students(student_id, name, gender, age, grade, math_score, science_score, english_score)
VALUES (4, 'Pooja', 'F', 26, 'A', 90, 92, 94);

INSERT INTO students(student_id, name, gender, age, grade, math_score, science_score, english_score)
VALUES (5, 'Akansha', 'F', 27, 'B', 89, 55, 76);

INSERT INTO students(student_id, name, gender, age, grade, math_score, science_score, english_score)
VALUES (6, 'Ruturaj', 'M', 29, 'D', 65, 60, 68);

INSERT INTO students(student_id, name, gender, age, grade, math_score, science_score, english_score)
VALUES (7, 'Rutuja', 'F', 26, 'C', 72, 74, 76);

INSERT INTO students(student_id, name, gender, age, grade, math_score, science_score, english_score)
VALUES (8, 'Amrut', 'M', 27, 'B', 89, 88, 80);

INSERT INTO students (student_id, name, gender, age, grade, math_score, science_score, english_score)
VALUES (9, 'Kalyani', 'F', 28, 'B', 84, 82, 81),
       (10, 'Niraj', 'M', 27, 'A', 99, 99, 100);

-- 3. Performing below SQL queries on database:
-- 3.1. Show all student details.
SELECT *
FROM StudentManagement.students;

-- 3.2. Average score in each subject.
-- Query: Average Maths, Science, English Score
SELECT AVG(math_score)    AS avg_maths_score,
       AVG(science_score) AS avg_science_score,
       AVG(english_score) AS avg_english_score
FROM students;

-- 3.3. Top performer (highest total score).
WITH cte_total_score AS (SELECT student_id,
                                COALESCE(math_score, 0) +
                                COALESCE(science_score, 0) +
                                COALESCE(english_score, 0) AS row_total
                         FROM students)

SELECT student_id, MAX(row_total) AS max_row_total
FROM cte_total_score
GROUP BY student_id
ORDER BY max_row_total DESC
LIMIT 1;

-- 3.4. Count students per grade
SELECT grade AS Grade, COUNT(grade) AS Grade_Count
FROM students
GROUP BY grade;

-- 3.5. Average score by gender (Male, Female wise)
WITH cte_total_score AS (SELECT gender,
                                COALESCE(math_score, 0) +
                                COALESCE(science_score, 0) +
                                COALESCE(english_score, 0) AS row_total
                         FROM students)

SELECT gender, ROUND(AVG(row_total), 2) AS avg_total_score
FROM cte_total_score
GROUP BY gender;

-- 3.6. Students with Math > 80
SELECT student_id, math_score, name
FROM students
WHERE math_score > 80;

-- 3.7. Update any random student grade to 'A+'
Update students
SET grade = 'A+'
WHERE student_id = 10;