-- Subqueries
-- These are queries within anohter query
-- They can be added in the WHERE clause or in the FROM Clause

SELECT *
FROM employee_demographics
;

SELECT *
FROM employee_salary
;

SELECT *
FROM parks_departments
;

-- Subquery in the WHERE clause
-- Selecting employees that only work in the Parks and Recreation departments (dept_id = 1)
-- This can be done without joining tables and using subqueries

SELECT *
FROM employee_demographics
WHERE employee_id IN 
					(SELECT employee_id -- You can only have one operand
                    FROM employee_salary
                    WHERE dept_id = 1)
;


-- Subquery in the FROM clause
-- Lets say we want to look at all the salaries and add a column next to it comparing the average salary for everyone

-- Example 1
SELECT first_name,
salary,
(SELECT AVG(salary)
FROM employee_salary) as avg_sal
FROM employee_salary
;

-- Example 2
-- We can aggregate columsn and use it in a subquery

-- Original agreegate query
SELECT gender, AVG(age) AS avg_age, MAX(age) AS max_age, MIN(age) as min_age, COUNT(age) as age_count
FROM employee_demographics
GROUP BY gender
;

-- Query used to get averages of aggregates in the subquery
SELECT AVG(max_age)-- We are averaging the average max age calculated in the subquery
FROM 
(SELECT gender, AVG(age) AS avg_age, MAX(age) AS max_age, MIN(age) as min_age, COUNT(age) as age_count
FROM employee_demographics
GROUP BY gender) AS agg_table -- The subquery has to be named

