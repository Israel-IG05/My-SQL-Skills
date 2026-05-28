-- Joins
-- Joins allow you to combine two tables or more together if they have a common column
-- The column name does not have to be same but the data is similar

SELECT *
FROM employee_demographics
;

SELECT *
FROM employee_salary
;

SElect * 
FROM parks_departments
;

-- Inner Join
-- This type of join returns the rows that are the same in both columns

SELECT dem.employee_id,
dem.age,
sal.occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- Outer Joins (LEFT Join (LEFT OUTER) or RIGHT Join (RIGHT OUTER))
-- Left join takes everything from the left table, if there is no match in the join, and then only return matches from the right table
SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- Outer Joins (Left Join (LEFT OUTER) or Right Join (RIGHT OUTER))
-- RIGHT join takes everything from the RIGHT table, if there is no match in the join, the non matches on the LEFT table return as NULL
SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;


-- SELF JOIN
-- SELF JOIN ties the table to itself
-- In this example we are doing a secret sant using the employee_salary table
-- we are tying the table to itselt to assign secret santa by emplee_id
SELECT sal1.employee_id AS emp_id_secret_santa,
sal1.first_name AS first_name__secret_santa,
sal1.last_name AS last_name__secret_santa,
sal2.employee_id AS emp_id_receipient,
sal2.first_name AS first_name_receipient,
sal2.last_name AS last_name_receipient
FROM employee_salary AS sal1
JOIN employee_salary AS sal2
	ON sal1.employee_id + 1 = sal2.employee_id
;


-- Joining multiple tables 

SELECT dem.employee_id,
dem.first_name,
dem.age,
sal.occupation,
dep.department_name
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
JOIN parks_departments AS dep
	ON dep.department_id = sal.dept_id