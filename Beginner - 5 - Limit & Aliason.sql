-- Limit & Aliasing

-- Limit just limits the number of rows

SELECT * 
FROM employee_demographics
LIMIT 5
;

-- You can use two limit parameters
-- Only using one
SELECT * 
FROM employee_demographics
ORDER BY AGE DESC
LIMIT 3
;

-- You can use two limit parameters
-- using two parameters
-- It goes to the second record of 3 and then it vies you the  1 one
SELECT * 
FROM employee_demographics
ORDER BY AGE DESC
LIMIT 3,1 
;

-- Aliasing
-- You can rename the the column name
SELECT 
gender, 
AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40
;