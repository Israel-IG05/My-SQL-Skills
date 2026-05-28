-- Case Statements
-- They allow to add logic in the select statments like if/else statments

-- Example
-- Single case
Select first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
END AS old_young
FROM employee_demographics
;

-- Example
-- multiple case
Select first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Sunset'
    WHEN age >= 50 THEN 'Evening'
END AS age_bracket
FROM employee_demographics
;

-- Study Case
-- Council sent out a memo of their bonus and pay increase for end of year
-- and we need to follow it and determine peoples end of year salary or the salary going into the new year 
-- and if they got a bonus, how much was it?

-- Get Pay Increast and Bonus
-- < 50000 = 5% raise
-- > 50000 = 7% raise
-- = 50000 = No raise
-- If in Finance = 10% bonus

SELECT sal.first_name,
sal.last_name,
sal.salary,
CASE
	WHEN sal.salary < 50000 THEN sal.salary + (sal.salary * 0.05)
    WHEN sal.salary > 50000 THEN sal.salary + (sal.salary * 0.07)
END AS new_year_salary,
CASE
	WHEN dep.department_id = 6 THEN sal.salary * 0.1 
    END AS yearly_bonus
FROM employee_salary AS sal
JOIN parks_departments AS dep
	ON dep.department_id = sal.dept_id
;

select * from parks_departments;
select * from employee_salary;