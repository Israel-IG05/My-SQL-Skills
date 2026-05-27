-- GROUP BY
-- It groups together rows that have the same values in the specified column or columns
-- that you are grouping on 
-- then you can run aggregate functions on those colums 

SELECT *
FROM employee_demographics
;

-- Group by to Average
SELECT gender,
ROUND(AVG (age), 2) as  AverageAge,
MAX(age),
MIN(age),
COUNT(age)
FROM employee_demographics
GROUP BY gender
;

-- ORDER BY
-- Order by sorts the results in either ascending (Small to Large) or descending (Large to Small) order
-- If ASC or DESC is not specified, it orders automatcially in ascending order
SELECT * 
FROM employee_demographics
ORDER BY gender, birth_date DESC
;

