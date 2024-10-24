SELECT * FROM hr;

ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NOT NULL;

SELECT birthdate FROM hr;

SET sql_safe_updates = 0;

#fix the birth and hire dates
UPDATE hr
SET birthdate = CASE
WHEN birthdate like '%/%' THEN date_format(str_to_date (birthdate,'%m/%d/%Y'), '%Y-%m-%d')
WHEN birthdate like '%-%' THEN date_format(str_to_date (birthdate,'%m-%d-%Y'), '%Y-%m-%d')
ELSE NULL
END;

SELECT birthdate FROM hr;

UPDATE hr
SET hire_date = CASE
WHEN hire_date like '%/%' THEN date_format(str_to_date (hire_date,'%m/%d/%Y'), '%Y-%m-%d')
WHEN hire_date like '%-%' THEN date_format(str_to_date (hire_date,'%m-%d-%Y'), '%Y-%m-%d')
ELSE NULL
END;

SELECT hire_date FROM hr;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

SELECT termdate FROM hr;

UPDATE hr
SET termdate =date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate is NOT NULL AND termdate !='';

UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SELECT termdate FROM hr;

describe hr;

SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

ALTER TABLE hr
ADD COLUMN Age int;

UPDATE hr
SET Age = timestampdiff(Year, birthdate, CURDATE());

Select * from hr;

#Lets see the age column if there is any outliers
SELECT max(age) as oldest, min(age) as youngest from hr;

SELECT count(*) Age from hr where age <18;

SELECT COUNT(*) FROM hr WHERE termdate > CURDATE();

SELECT COUNT(*)
FROM hr
WHERE termdate = '0000-00-00';

SELECT location FROM hr;