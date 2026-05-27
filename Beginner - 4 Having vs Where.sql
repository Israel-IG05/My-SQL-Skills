-- Having VS WHERE

-- Using WHERE for the aggregate function between FROM and GROUP BY will not work
-- Becuase the average group has not been created and this is where you use Having
-- Incorrect way
SELECT gender,
AVG(age)
FROM employee_demographics
WHERE AVG(age) >40
GROUP BY gender
;

-- Correct way
-- IN order to filter the aggregate function, you use HAVING after GROUP BY
SELECT gender,
AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) >40
;

SELECT * FROM employee_salary;

SELECT occupation,
AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 70000
;