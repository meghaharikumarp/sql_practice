CREATE DATABASE student;
 USE student;
 CREATE TABLE science(
 science_id INT PRIMARY KEY,
 fname VARCHAR(50),
 lname VARCHAR(50),
 sc_subject VARCHAR(20)
 );
 INSERT INTO science (science_id,
 fname,lname,sc_subject )VALUES (1,'megha','hp','maths');
 
 SELECT * FROM science;
 
 SELECT science_id,science_id+1 AS aadd
 FROM science;
 
 SELECT DISTINCT salary FROM parks_and_recreation.employee_salary;
 
 #find the gender no duplictes
 
 SELECT DISTINCT gender FROM parks_and_recreation.employee_demographics;
 
#find the females who get salary above 50000
  
 SELECT sal.employee_id, sal.first_name, salary, gender
 FROM parks_and_recreation.employee_salary AS sal
 INNER JOIN  parks_and_recreation.employee_demographics AS dem
 ON sal.employee_id = dem.employee_id
 WHERE sal.salary > 50000
 AND dem.gender ='female';
 
 #like operator
 
 SELECT *
 FROM parks_and_recreation.employee_demographics
 WHERE first_name LIKE '%a%';
 
 #i want to print this result in differenbt table
 
SELECT *,
first_name LIKE '%a%' AS a_name
FROM parks_and_recreation.employee_demographics;

# instead of using 1 and 0 you need to provide yes or no 

SELECT *,
CASE 
 WHEN first_name LIKE '%a%' THEN 'yes'
 WHEN first_name NOT LIKE '%a%' THEN 'no'
 
END AS status_
 FROM parks_and_recreation.employee_demographics;

#order 

SELECT * FROM  parks_and_recreation.employee_demographics
ORDER BY first_name;

#group

SELECT gender FROM parks_and_recreation.employee_demographics
GROUP BY gender;

SELECT occupation FROM parks_and_recreation.employee_salary
GROUP BY occupation;

SELECT first_name FROM parks_and_recreation.employee_demographics
GROUP BY first_name;

 use parks_and_recreation;
 
SELECT gender,AVG(age)
FROM employee_demographics
GROUP BY gender;  

SELECT gender,AVG(age)
FROM employee_demographics
GROUP BY gender
Having AVG(age)>40;

#USING HAVING AND WHERE

SELECT occupation,AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%Manager%' 
GROUP BY occupation
HAVING AVG(salary)>50000;

#limit

SELECT first_name FROM employee_demographics
ORDER BY first_name
LIMIT 2;

#aliasing

SELECT occupation,AVG(salary) AS avg_sal
FROM employee_salary
WHERE occupation LIKE '%Manager%' 
GROUP BY occupation
HAVING avg_sal>50000; 

# INNER

SELECT * FROM employee_demographics
INNER JOIN employee_salary
ON employee_demographics.employee_id=employee_salary.employee_id
INNER JOIN parks_departments
ON employee_salary.dept_id=parks_departments.department_id;

#LEFT

SELECT * FROM employee_demographics
LEFT JOIN employee_salary
ON employee_demographics.employee_id=employee_salary.employee_id;

#SELF JOIN(JOIN)

SELECT emp1.employee_id,emp1.first_name,emp1.last_name,
emp2.employee_id as santa_id,
emp2.first_name as santa_name,
emp2.last_name as santalname
FROM employee_salary as emp1 
JOIN employee_salary as emp2
on emp1.employee_id+1=emp2.employee_id;

#UNION

SELECT first_name FROM employee_demographics
UNION 
SELECT first_name FROM employee_salary; 