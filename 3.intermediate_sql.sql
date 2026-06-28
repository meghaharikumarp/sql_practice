-- JOIN *****

SELECT *FROM employee_demographics
INNER JOIN employee_salary
 ON employee_demographics.employee_id = employee_salary.employee_id; #ITS A BIT LONG SO WE CAN USE ALIASING
 
 SELECT * FROM employee_demographics AS dem
 INNER JOIN employee_salary AS sal
 ON dem.employee_id=sal.employee_id;
 
 SELECT dem.employee_id,dem.first_name,age,occupation FROM employee_demographics dem
 INNER JOIN employee_salary sal 
 ON dem.employee_id=sal.employee_id;
 
 -- OUTER JOIN ****
 #LEFT JOIN
 
 SELECT * FROM employee_demographics dem LEFT JOIN employee_salary sal
 ON dem.employee_id=sal.employee_id;
 
 #RIGHT JOIN
 
 SELECT * FROM employee_demographics
 dem RIGHT JOIN employee_salary sal
 ON dem.employee_id=sal.employee_id;
 
 -- JUST AN EXPERIMENT
 
 SELECT * FROM employee_salary sal LEFT JOIN employee_demographics dem
 ON sal.employee_id=dem.employee_id;
 
 -- SELF JOIN *****
 
SELECT emp1.employee_id AS santa_id,
emp1.first_name AS santa_name,
emp1.last_name AS santa_lastname,
emp2.employee_id AS santa_recieveid,
emp2.first_name AS santa_recievefname,
emp2.last_name AS santa_recievelname
 FROM employee_salary emp1
 JOIN employee_salary emp2 
 ON emp1.employee_id +1 = emp2.employee_id; 
 
 -- multiple join ******
 
 SELECT * FROM employee_demographics AS dem
 INNER JOIN employee_salary AS sal
 ON dem.employee_id=sal.employee_id
 INNER JOIN parks_departments AS par
 ON sal.dept_id=par.department_id;
 
 -- UNION *****
 
 SELECT * FROM employee_demographics
 UNION 
 SELECT * FROM employee_salary; #HERE IT IS NOT A PERFECT TABLE IT IS A MIXED DATA JUST LIKE IN THE VEGGIES FOOD SERVING CATEGORY, SERVING CHICKEN STEW ..
 
 SELECT employee_id,first_name,last_name FROM employee_demographics
 UNION 
 SELECT employee_id,first_name,last_name FROM employee_salary
 ORDER BY employee_id; #HERE IT IS WELL STRUCTURED DATA 
 
 SELECT employee_id,first_name,last_name FROM employee_demographics
 UNION ALL 
 SELECT employee_id,first_name,last_name FROM employee_salary
 ORDER BY employee_id; # HERE ALL THE DATAS ARE COMBINED BECAUSE WE USED ""UNION ALL"" ,BY DEFAULT UNION IS DISTINCT
 
 -- *****************************************************************************
 # HERE WE ARE GOING TO LABEL POPLE WHO IS OLD AND GETTING HIGH SALARY
 
SELECT employee_id,first_name,last_name,'old' AS label
FROM employee_demographics
WHERE age>40
UNION 
SELECT employee_id,first_name,last_name,'high payment' AS label
FROM employee_salary
WHERE salary>70000
ORDER BY employee_id;

 -- *****************************************************************************
 # N0W WE ARE GOING TO LABEL OLD MAN AND OLD LADY
 
 SELECT employee_id,first_name,last_name,'old man' AS label
FROM employee_demographics
WHERE age>40 AND gender = 'male'
UNION 
SELECT employee_id,first_name,last_name,'old lady' AS label
FROM employee_demographics
WHERE age>40 AND gender = 'female'
UNION 
SELECT employee_id,first_name,last_name,'high payment' AS label
FROM employee_salary
WHERE salary>70000
ORDER BY employee_id;

-- *****************************************************************************
    # STRING FUNCTION
    # **** LENGTH FUNCTION ***** #
    
SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2;

SELECT LENGTH('blue sky'); 

# **** UPPER FUNCTION ***** #

SELECT UPPER('blue sky');

SELECT first_name, UPPER(first_name)
FROM employee_demographics;


# **** LOWER FUNCTION ***** #

SELECT LOWER('blue sky');

# **** TRIM FUNCTION ***** #REMOVE WHITESPACE
      
SELECT TRIM('      SKY      '); # IF WE DONT USE TRIM THIS SOACE IS REMAINED

# --------> LTRIM <------------#REMOVE LEFT EXTRA SPACE AND KEEP RIGHT EXTRA SPACE

SELECT LTRIM('      SKY      ');

# --------> RTRIM <------------#REMOVE RIGHT EXTRA SPACE AND KEEP LEFT EXTRA SPACE

SELECT RTRIM('      SKY      ');

# --------> LEFT AND RIGHT <------------#EXTRACT SPECIFIC PORTION OF A STRING


SELECT first_name,
LEFT(first_name, 3),
RIGHT(first_name, 4) 
FROM employee_demographics;

# --------> SUBSTRING <------------ #IT ALLOW  YOU TO STAART FROM SPECIFIC NUMBER OF CHARACTER UPTO N NUMEBER OF CHAR

SELECT first_name, 
SUBSTRING(first_name,2,3)
FROM employee_demographics;

SELECT birth_date, 
SUBSTRING(birth_date,6,2) #here the first number refers to starting position and second one refers to how many character from the first position
FROM employee_demographics;

# --------> REPLACE <------------

SELECT first_name, 
REPLACE(first_name,'a','m')
FROM employee_demographics;#here the first letter is existing letter to be replaced and second is new letter to be added in that position

# --------> LOCATE <------------#THE GIVEN CHARACTER IS ANALYZED AND POSITITON IS RETURNED

SELECT LOCATE('x','alexabder');

SELECT first_name,
LOCATE('n',first_name)
FROM employee_demographics ;

# --------> CONCAT <-------#FOR JOINING TWO STRING

SELECT first_name,
last_name,
CONCAT(first_name,ast_name)
FROM employee_demographics;

