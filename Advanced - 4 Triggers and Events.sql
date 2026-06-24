-- Triggers and Events
-- Trigger is a block of code that executes automatically when an event takes place on a specific table

-- Triggers
-- Example, when somone gets hired, they get added to the employee_salary table
-- with the employee_id, first_name, last_name, occupation, salary, and dept_id
-- We will create a trigger that will add the employee to the employee_demographics table when they are added to the employee_salary table
-- We will add the emploee_id, first_name, last_name to the employee_demographics tabke

-- Tables
SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;


-- Creating the trigger
DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

-- Testing the trigger
INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (13, 'James', 'Hetfield', 'CEO', 95000, NULL);


-- Events 
-- Events take place when it's scheduled,
-- Events are more like a schedule automater rather than a trigger that happens when an event takes place
-- EG. Pull data from a specific file path on a schedule
-- EG. You can build reports that are exported to a file on a schedule, daily, weekly, monthly, yearly

-- Case 
-- The Parks and Recreation deparment is spending too much money and they want to retire people who are over the age of 60 and give them lifetime pay
-- We need to create an event that checks every month or every day to see if they are over a specific age, then we are going to delete them from the table as they will be retired

-- Table sample
SELECT * 
FROM employee_demographics
;
-- EG.  5	Jerry	Gergich	61	Male	1962-08-28

-- Creating the EVENT

DELIMITER $$
CREATE EVENT delete_retiress
ON SCHEDULE EVERY 30 second
DO 
BEGIN
	DELETE
	FROM employee_demographics 
    WHERE age >= 60;
END $$
DELIMITER ;


-- If the event was not created 
-- You can check it like this

SHOW VARIABLES LIKE 'event%';

-- If value = OFF 
-- Then update value to ON
-- It's possible you may not have permissions and may need to turn on setting under peferences




