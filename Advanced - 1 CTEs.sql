-- CTEs or Commong Table Expressions
-- They allow you to define a sub query block that can be referenced within the main query
-- You can only use CTEs immediately after they are created
-- It's not stored in memory

-- Basic Example

WITH CTE_Example AS 
(
SELECT dem.gender,
AVG(sal.salary) AS avg_salary,
MAX(sal.salary) AS max_salary,
MIN(sal.salary) AS min_salary,
COUNT(sal.salary) AS count_salary
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY dem.gender
 )   
SELECT AVG(avg_salary) -- This results in the average off the average salaries from the CTE table
FROM CTE_Example
;


-- Multiple CTEs

WITH CTE_Example AS 
(
SELECT employee_id, gender, birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
 ) ,
 CTE_Example2 AS
 (
 SELECT  employee_id, salary
 FROM employee_salary
 WHERE salary > 50000
 )
SELECT *
FROM CTE_Example
JOIN CTE_Example2
	ON CTE_Example2.employee_id = CTE_Example.employee_id
;