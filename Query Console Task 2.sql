-- 1. Database Setup task 2:

USE StudentManagement;

-- 2. Creating course table:
CREATE TABLE courses
(
    course_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name      VARCHAR(50)       NOT NULL,
    PRIMARY KEY (course_id)
);

-- 3. Inserting values like courseID and name into course table
INSERT INTO courses (course_id, name)
VALUES (100, 'Mechanical'),
       (101, 'Civil'),
       (102, 'Electronics & Telecommunications'),
       (103, 'Architect'),
       (104, 'IT'),
       (105, 'Robotics');

-- 4. Creating 'enrollments' as new Mapping table:
-- Cardinality:
-- Student : Course => Many : Many (One student can enroll/belongs to multiple course and one course belongs to multiple students)
-- Hence creating mapping table
CREATE TABLE enrollments
(
    stud_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    c_id    SMALLINT UNSIGNED NOT NULL,
    grade   INT,
    FOREIGN KEY (stud_id) REFERENCES students (student_id),
    FOREIGN KEY (c_id) REFERENCES courses (course_id)
);

DROP TABLE enrollments;

-- 5. Inserting values into 'Enrollments' table:
INSERT INTO enrollments (stud_id, c_id, grade)
VALUES (1, 100, 90),
       (2, 100, 80),
       (3, 101, 70),
       (4, 102, 82),
       (5, 103, 84),
       (6, 104, 35),
       (7, 105, 20),
       (8, 101, 50),
       (9, 103, 20),
       (10, 105, 75);

# Operation on 3 table created: (Student, Courses, Enrollments)
-- Q1. List all students enrolled in each course.
SELECT s.name, c.name
FROM enrollments e
         JOIN students s ON e.stud_id = s.student_id
         JOIN courses c on e.c_id = c.course_id;

-- Q2. Find average grade per course.
SELECT c.name, ROUND(AVG(e.grade), 2) AS avg_grade
FROM enrollments e
         JOIN courses c ON e.c_id = c.course_id
GROUP BY c.name;

-- Q3. Find top 3 students overall.
SELECT s.name, ROUND(AVG(e.grade), 2) AS avg_grade
FROM enrollments e
         JOIN students s ON e.stud_id = s.student_id
GROUP BY s.name
ORDER BY avg_grade DESC
LIMIT 3;

-- Q4. Count students who failed (grade < 40).
SELECT COUNT(e.stud_id) AS fail_stud_count
FROM enrollments e
WHERE e.grade < 40;