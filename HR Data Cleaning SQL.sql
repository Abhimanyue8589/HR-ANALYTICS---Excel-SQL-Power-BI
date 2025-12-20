CREATE DATABASE projects;

USE projects;

SELECT * FROM hr;

ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(30) NULL;

DESCRIBE hr;

SELECT birthdate FROM hr;

SET Sql_safe_updates = 0;

UPDATE hr
SET birthdate = CASE
WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
ELSE NULL 
END;


UPDATE hr
SET birthdate = CASE
  WHEN birthdate LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(TRIM(birthdate), '%m/%d/%y'), '%Y-%m-%d')
  WHEN birthdate LIKE '%-%' THEN DATE_FORMAT(STR_TO_DATE(TRIM(birthdate), '%m-%d-%y'), '%Y-%m-%d')
  ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;
SELECT birthdate FROM hr;

UPDATE hr
SET hire_date = CASE
WHEN  hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
ELSE NULL 
END;

SELECT hire_date FROM hr;

UPDATE hr
SET termdate=date(str_to_date(termdate,'%Y-%m-%d%H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate !='';

SELECT termdate FROM hr;

SELECT termdate FROM hr LIMIT 20;

UPDATE hr
SET termdate=date(str_to_date(termdate,'%Y-%m-%d%H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate !='';

SELECT termdate FROM hr;

UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

SELECT termdate from hr;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

ALTER TABLE hr ADD COLUMN age INT;

SELECT* FROM hr;

UPDATE hr
SET age= timestampdiff(YEAR,birthdate,CURDATE());

SELECT birthdate,age FROM hr;

SELECT 
min(age)AS youngest,
max(age)AS oldest
FROM hr;  


 SELECT count(*)FROM hr WHERE age<18;