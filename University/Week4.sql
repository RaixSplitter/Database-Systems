
use University;

SELECT * FROM DEPARTMENT;¨

SELECT * FROM INSTRUCTOR;




-- Counts the number of instructors in each department
SELECT DEPTNAME, COUNT(*) FROM INSTRUCTOR GROUP BY DEPTNAME;

-- Display the department table with the respective number of instructors
SELECT department.*, subquery.instructor_count
FROM department
LEFT JOIN (
    SELECT DEPTNAME, COUNT(*) as instructor_count 
    FROM INSTRUCTOR 
    GROUP BY DEPTNAME
) as subquery
ON department.DEPTNAME = subquery.DEPTNAME;


ALTER TABLE DEPARTMENT ADD COLUMN InstructorCount INT;

UPDATE DEPARTMENT
LEFT JOIN (
    SELECT DEPTNAME, COUNT(*) as instructor_count 
    FROM INSTRUCTOR 
    GROUP BY DEPTNAME
) as subquery ON DEPARTMENT.DEPTNAME = subquery.DEPTNAME
SET DEPARTMENT.InstructorCount = subquery.instructor_count;
SELECT * FROM DEPARTMENT;