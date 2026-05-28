-- Unions
-- Unions allows you to combine rows together from seperate tables or also from the same table
-- 
SELECT * 
FROM employee_demographics
UNION
SELECT * 
FROM employee_salary
;

SELECT first_name, last_name 
FROM employee_demographics
UNION ALL -- ALL retrives all the results
-- UNION DISTINCT -- DISTINCT This removes the duplicates
SELECT first_name, last_name 
FROM employee_salary
;

-- Use case
-- Identify emploees that are older and have higher salary

SELECT first_name, last_name, 'Older man' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'male'
UNION
SELECT first_name, last_name, 'Older lady' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;