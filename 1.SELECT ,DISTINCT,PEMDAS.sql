SELECT * FROM class.student;
SELECT first_name,
id,
age,
age+10
FROM class.student;
SELECT DISTINCT age FROM class.student;
SELECT DISTINCT first_name,age FROM class.student;

#where clause
SELECT * FROM student
WHERE first_name='paru';
