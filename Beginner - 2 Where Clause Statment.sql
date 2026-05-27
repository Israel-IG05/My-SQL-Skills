-- WHERE Clause

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE first_name = 'Leslie';


-- Not including 50000 salary
SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary > 50000;

-- Including 50000 salary
SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000;

-- = fetches exact matches
SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE gender = 'Female';

-- =! excludes the results
SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE gender != 'Female';

-- How to Date Format
SELECT first_name,
DATE_FORMAT(birth_date, '%m/%d/%Y') AS date
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
;

-- Logical operators are AND, OR, NOT
-- AND means both requests have to match
-- OR one or the other requests can match

-- Using AND
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'male'
;


-- Using OR
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
OR  gender = 'male'
;

-- Using OR NOT
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT  gender = 'male'
;

-- Using Parenthesis
-- This is an isolated conditional statment
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55
;

-- Like statments
-- % (means anything) and _ (means a specific value
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a%'
;

-- The underscore tells how many characters are there
-- _ one is one character
-- __ two are two characters
-- % can be combined
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a__%'
;



