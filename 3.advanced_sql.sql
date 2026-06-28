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
 
 SELECT * FROM employee_demographics dem RIGHT JOIN employee_salary sal
 ON dem.employee_id=sal.employee_id;
 
 -- JUST AN EXPERIMENT
 
 SELECT * FROM employee_salary sal LEFT JOIN employee_demographics dem
 ON sal.employee_id=dem.employee_id;
 
 -- SELF JOIN *****
 
SELECT *
 FROM employee_salary emp1
 JOIN employee_salary mast 
 ON emp1.employee_id +1 = mast.employee_id; 
 