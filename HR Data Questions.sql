#1. What is the gender breakdown of employees in the company?
SELECT gender, count(*) as Count
FROM hr
where age >= 18
GROUP BY gender;

#2. What is the race/ethnicity breakdown of employees in the company?
SELECT race, count(*) as Count
FROM hr
where age >= 18
GROUP BY race
ORDER BY Count DESC;

#3. What is the age distribution of employees in the company?
SELECT 
min(age) AS youngest, 
max(age) AS oldest
FROM hr
WHERE age >=18;

#or

SELECT 
  CASE 
    WHEN age >= 18 AND age <= 35 THEN '18-35'
    WHEN age >= 36 AND age <= 64 THEN '36-64'
    ELSE '65+' 
  END AS age_group, gender,
  COUNT(*) AS count
FROM 
  hr
WHERE 
  age >= 18
GROUP BY age_group, gender
ORDER BY age_group, gender;

#4. How many employees work at headquarters versus remote locations?
SELECT location, count(*) as Count
FROM hr
where age >= 18
GROUP BY location;

#5. What is the average length of employment for employees who have been terminated?
SELECT ROUND(AVG (timestampdiff(Year, hire_date, termdate)),0) AS Avg_length_of_employment
FROM hr
where termdate <> '0000-00-00' AND termdate <= CURDATE() AND Age >=18;

#6. How does the gender distribution vary across departments and job titles?

#across department
select department, gender, count(*) as count from hr
where age >=18
Group BY department, gender
ORDER BY department;

#across jobtitle
select jobtitle, gender, count(*) as count from hr
where age >=18
Group BY jobtitle, gender
ORDER BY jobtitle;

#7. What is the distribution of job titles across the company?
select jobtitle, count(*) as count from hr
where age >=18
Group BY jobtitle
ORDER BY count DESC;

#8. Which department has the highest turnover rate?
SELECT department, 
       COUNT(*) AS total_count, 
       SUM(termdate <= CURDATE() AND termdate <> '0000-00-00') AS terminated_count, 
       (SUM(termdate <= CURDATE() AND termdate <> '0000-00-00') / COUNT(*)) AS turnover_rate
FROM hr
WHERE age >= 18
GROUP BY department
ORDER BY turnover_rate DESC
LIMIT 1;

#9. What is the distribution of employees across locations by city and state?
SELECT location_state, COUNT(*) as count
FROM hr
WHERE age >= 18
GROUP BY location_state
ORDER BY count DESC;

#10. How has the company's employee count changed over time based on hire and term dates?
SELECT 
    year, 
    hires, 
    terminations, 
    (hires - terminations) AS net_change,
    ROUND(((hires - terminations) / hires * 100), 2) AS net_change_percent
FROM (
    SELECT 
        YEAR(hire_date) AS year, 
        COUNT(*) AS hires, 
        SUM(CASE WHEN termdate <> '0000-00-00' AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS terminations
    FROM 
        hr
    WHERE age >= 18
    GROUP BY 
        YEAR(hire_date)
) subquery
ORDER BY 
    year ASC;
    
#11. What is the tenure distribution for each department?
SELECT department, ROUND(AVG(DATEDIFF(CURDATE(), termdate)/365),0) as avg_tenure
FROM hr
WHERE termdate <= CURDATE() AND termdate <> '0000-00-00' AND age >= 18
GROUP BY department