-- Stored Procedures
-- Is a way to save your SQL code that you can reuse over and over again 
-- When the store procedure is saved, you can call that store procedure and excecute all the code that you wrote within the stored procedure
-- Helpful for storing comple queries or repetitive code and enhancing performance overall

-- Sample Data
SELECT * 
FROM employee_salary
WHERE salary >= 50000
;

-- 1. Creating the procedure
CREATE PROCEDURE large_salaries()
SELECT * 
FROM employee_salary
WHERE salary >= 50000
;

-- 2. Calling the procedure
CALL large_salaries();

-- Creating the procedure
CREATE PROCEDURE large_salaries()
SELECT * 
FROM employee_salary
WHERE salary >= 50000
;



-- Creating two queries within one store procedure
-- 1. creating the procedure
DELIMITER $$ -- This changes the delimiter to $$
CREATE PROCEDURE large_salaries2()
BEGIN
	SELECT * 
	FROM employee_salary
	WHERE salary >= 50000; -- This is the original delimiter
	SELECT
	* FROM employee_salary 
	WHERE salary >= 10000; -- This is the original delimiter
END $$
DELIMITER ; -- This changes it back to ;

-- calling the store procedure 
CALL large_salaries2;




-- Parameters
-- Parameters are variables that are passed as input in a stored procedure
-- It allows the store procedure to accept an input value and place it into the code

-- 
DELIMITER $$ 
CREATE PROCEDURE large_salaries3(name_of_varialbe int) -- This is naming the paranamer with the data type
BEGIN
	SELECT * 
	FROM employee_salary
    WHERE employee_id = name_of_varialbe; -- this ties the value to the variable you are trying
END $$
DELIMITER ;

CALL large_salaries3(1); -- When calling the pocedure, you can specify the variable you are looking for 


