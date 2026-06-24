-- Temporary Tables
-- These are temporary tables that are only visible to the session that they are created in
-- They can be used for storing intermediate results for complex queries
-- They can be used to manipulate data before inserting it to a more permanent table
-- They can be used in other SQL tabs as long as it is within the same session
-- They can be used to manipulate data and do more complex queries and can create a lot of temp tables and join them

-- 1- First way to create one
-- You can insert data into this table and can be used over and over again

-- Creating the temp table
CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

-- Inserting data into the temp table
INSERT INTO temp_table
VALUES( 'Israel', 'Galvez', 'Lord of the Rings');

-- Querying the temp table
SELECT *
FROM temp_table
;

-- 2 First way to create one

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM salary_over_50k
;

