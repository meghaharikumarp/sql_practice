#CREATE

create database class;

use class;

#CREATE TABLE***


CREATE TABLE student (
 id INT PRIMARY KEY auto_increment,
 first_name VARCHAR(50),
 age int
 );
 
 #INSERT ***
 
 insert into student (first_name,age)values 
 ('megha',20),
 ('paru',20),
 ('appu',23),
 ('ammu',23);
 
 insert into student (age)values
 (20),(30),(40),(15);
 
 # DELETE***
 
delete from student where id in(1,2,3,4);

# UPDATE***
 

update student
set age=20
where id=1;

# SELECT****

select * from student;
SELECT first_name,salary FROM parks_and_recreation.employee_salary
where salary>=50000;

SELECT * FROM parks_and_recreation.employee_salary
where salary>=50000;

SELECT * FROM parks_and_recreation.employee_demographics
where gender!='female';

SELECT * FROM parks_and_recreation.employee_demographics
where birth_date > '1985-01-01'
AND gender='male';

-- like statement
-- % anything _ a specific value

SELECT * FROM employee_demographics
where first_name like 'jer%';

SELECT * FROM employee_demographics
where first_name like '%a%';

SELECT * FROM employee_demographics
where first_name like 'a%';

SELECT * FROM employee_demographics
where first_name like 'a__';

SELECT * FROM employee_demographics
where birth_date LIKE '1986%';

-- GROUP BY*****

select gender from employee_demographics
group by gender;

select gender,first_name from employee_demographics
group by gender,first_name;

SELECT gender,AVG(age),MAX(age),MIN(age),COUNT(age)
FROM employee_demographics
group by gender;

SELECT occupation,salary FROM employee_salary
group by occupation,salary;

-- ORDER BY*****

SELECT * FROM employee_demographics
ORDER BY first_name DESC;


SELECT * FROM employee_demographics
ORDER BY first_name;

SELECT * FROM employee_demographics
ORDER BY first_name ASC;

SELECT * FROM employee_demographics
ORDER BY gender,age;

Update employee_demographics
set age=28
where employee_id=10;

-- HAVING *****

SELECT occupation,AVG(salary) FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 60000;

-- ALIASING *****

SELECT gender,AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;

SELECT gender,AVG(age) avg_age #NOT NEEDED TO ADD AS THIS IS IS ALSO WORKS WELL, AS HELPS TO UNDERSTAND BETTER
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;

-- LIMIT *****

SELECT *
FROM employee_demographics
ORDER BY age
LIMIT 2;

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3;

SELECT *
FROM employee_demographics
ORDER BY age
LIMIT 1,3;

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2,5;



