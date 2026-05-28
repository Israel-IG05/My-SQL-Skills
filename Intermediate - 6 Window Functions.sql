-- Window Functions
-- Window functions allow us to look at a partition or a group but they keep their own unique rows in the output



-- Example to show the difference between grouping and using Window Fucntions
-- GROUP BY rolls everything up into one row
-- We will take the demographics table
-- we will take the gender and compare it to the actual salaries

-- GROUP BY example
SELECT dem.gender,
AVG(sal.salary) AS avg_salary
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
    GROUP BY dem.gender
;


-- Window function example 1 
-- OVER() -- This will look at everything
-- OVER (PARTITION BY column_name) -- Performs the calculation for all group but it does not group it
SELECT dem.employee_id,
dem.last_name,
dem.gender,
AVG(sal.salary) OVER (PARTITION BY dem.gender) AS avg_salary -- This calculation is independent from the other columns
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- Window function example 2
-- Roling total
SELECT dem.employee_id,
dem.first_name,
dem.last_name,
dem.gender,
sal.salary,
SUM(sal.salary) OVER (PARTITION BY dem.gender ORDER BY dem.employee_id) AS running_salary_total -- This calculation is independent from the other columns
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;


-- Row Number
-- row_number() OVER () -- row number does not repeat
-- row_number() OVER (PARTITION BY gender) -- row number starts again based on column name provided
-- row_number() OVER (PARTITION BY dem.gender ORDER BY sal.salary DESC) ORDER BY ranks it based on salary
--                    |  This is the group part | - |this is the order it processes it by |

-- RANK
-- row number does not create duplicates rows if the values are the same
-- However, When Rank encounters a duplicate based on the ORDER BY column, it  creates a same value, 
-- but after the duplicate it restarts the rank at the value it would have been if there were no duplicates
-- DENSE RANK() after it encounters a duplicate value, it does not retart the count at the would be next volume but it gives the next number numerically

-- salary	row_num	rank_num	dense_rank_num
-- 5000		1		1			1
-- 60000	2		2			2
-- 55000	3		3			3
-- 25000	4		4			4
-- 90000	1		1			1
-- 70000	2		2			2
-- 65000	3		3			3
-- 57000	4		4			4
-- 50000	5		5			5
-- 50000	6		5			5
-- 20000	7		7			6


SELECT dem.employee_id,
dem.first_name,
dem.last_name,
dem.gender,
sal.salary,
ROW_NUMBER() OVER (PARTITION BY dem.gender ORDER BY sal.salary DESC) AS row_num,
RANK() OVER (PARTITION BY dem.gender ORDER BY sal.salary DESC) AS rank_num,
DENSE_RANK() OVER (PARTITION BY dem.gender ORDER BY sal.salary DESC) AS dense_rank_num
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;




