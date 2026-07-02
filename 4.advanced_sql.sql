-- ***************************************************************************** --
# --------> CTE <-------#
WITH cte_example as 
(SELECT gender,AVG(salary) avg_salary,MIN(salary) avg_min,MAX(salary) avg_max,COUNT(salary) avg_count
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
GROUP BY gender)
SELECT * FROM cte_example ;

WITH cte_example as 
(SELECT gender,AVG(salary) avg_salary,MIN(salary) avg_min,MAX(salary) avg_max,COUNT(salary) avg_count
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
GROUP BY gender)
SELECT gender,avg_salary FROM cte_example ; #this is more better to use it 

SELECT gender,avg_salary FROM 
(SELECT gender,AVG(salary) avg_salary,MIN(salary) avg_min,MAX(salary) avg_max,COUNT(salary) avg_count
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
GROUP BY gender) cte_example;

WITH cteExample1 as(
SELECT employee_id,first_name,last_name,birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'),

cteExample2 as(
SELECT employee_id,salary
FROM employee_salary
WHERE salary > 50000
)
SELECT * FROM cteExample1
JOIN cteExample2
ON cteExample1.employee_id = cteExample2.employee_id;

WITH cte_example(Gender,avg_salary,min_salary,max_salary,count_salary) as 
(SELECT gender,AVG(salary),MIN(salary),MAX(salary),COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
GROUP BY gender)
SELECT * FROM cte_example ;

-- ***************************************************************************** --
# --------> TEMPORARY TABLES <--------#

CREATE TEMPORARY TABLE temp_table(
id INT,
fname VARCHAR(50),
movie VARCHAR(50));

SELECT * FROM temp_table;

INSERT INTO temp_table 
VALUES(1,'MEGHA','LOKAH');

CREATE TEMPORARY TABLE salary_over_50k
SELECT * FROM employee_salary
WHERE salary >= 50000;

SELECT * FROM salary_over_50k;