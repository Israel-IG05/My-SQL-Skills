-- String Functions
-- String functions are built in functions within SQL that will help use strings and work with strings differently

-- Lenght
-- E.G. Can be used to verify exact character lenght for phone numbers

SELECT length('skyfall')
;

SELECT first_name,
length(first_name)
FROM employee_demographics
ORDER BY 2
;


-- Upper
-- Used to capitalize characters in column
-- Lower
-- Used to change characters in column to all lower case

SELECT upper('rocks')
;

SELECT lower('Rocks')
;

SELECT first_name,
upper(first_name)
FROM employee_demographics
;


-- Trim, Left Trim, and Right Trim
-- Takes the whte space on the front or the end and get rid of it.

-- Trim

-- Before
SELECT ('      Chocolate      ')
;
-- After
SELECT trim('      Chocolate      ')
;

-- Left Trim
-- After
SELECT ltrim('      Chocolate      ')
;

-- Right Trim
-- After
SELECT rtrim('      Chocolate      ')
;

-- Left and Right
-- Fetches the number of characters specified on the lft or right hand side

-- Left
SELECT first_name,
LEFT(first_name, 4)
FROM employee_demographics
;

-- Right 
SELECT first_name,
RIGHT(first_name, 4)
FROM employee_demographics
;

-- Substring
-- It fetches the characters from a given number up to a second specified number

SELECT first_name,
substring(first_name, 3,2),
birth_date,
SUBSTRING(birth_date,6,2) AS birth_month
FROM employee_demographics
;

-- Replace
-- This replaces specific characters with the characters that you want

SELECT first_name,
replace(first_name, 'a', 'z')
FROM employee_demographics
;


-- Locate
-- It provides the location of a provided character
SELECT locate('x', 'Alexander')
;

SELECT first_name,
locate('An', first_name)
FROM employee_demographics
;

SELECT first_name,
locate('An', first_name)
FROM employee_demographics
;

-- Concactenate
-- Combines columns or given characters

SELECT first_name, 
last_name, 
concat(first_name, ' ', last_name) AS full_name
FROM employee_demographics
;


-- Coalese
-- This replaces the missing value with a provided values
-- e.g
SELECT
coalesce(Gender, 'N/A'),
AVG(sal.salary) as AvgSal
FROM employee_demographics as dem
Right JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
group by dem.gender
;