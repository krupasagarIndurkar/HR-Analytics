CREATE DATABASE hr_analytics;
USE hr_analytics;

select * from hr_1;
select * from hr_2;

-- 1 Average Attrition Rate for All Departments
SELECT 
    Department,
ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS Attrition_Rate_Percentage
FROM hr_1
GROUP BY Department;

-- 2  Average Hourly Rate of Male Research Scientists
SELECT  
    AVG(HourlyRate) AS Avg_HourlyRate_Male_ResearchScientist
FROM hr_1
WHERE Gender = 'Male' 
  AND JobRole = 'Research Scientist';
 
 
 --- 3 Total Employees
SELECT COUNT(*) AS Total_Employees FROM hr_1;


--- 4 Total Employees by Gender-----------
SELECT Gender, COUNT(*) AS Total_Employees
FROM hr_1
GROUP BY Gender;

-- 5 Overall Attrition Rate
SELECT 
  ROUND((SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS Overall_Attrition_Rate
FROM hr_1;


--- 6 Attrition Count by Job Role
SELECT JobRole, COUNT(*) AS Total_Employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)/COUNT(*)*100,2) AS Attrition_Rate_Percentage
FROM hr_1
GROUP BY JobRole
ORDER BY Attrition_Rate_Percentage DESC;


--- 7 Environment Satisfaction by Department
SELECT Department, ROUND(AVG(EnvironmentSatisfaction), 2) AS Avg_Env_Satisfaction
FROM hr_1
GROUP BY Department;

--- 8 Job Satisfaction by Role
SELECT JobRole, ROUND(AVG(JobSatisfaction), 2) AS Avg_Satisfaction
FROM hr_1
GROUP BY JobRole
ORDER BY Avg_Satisfaction DESC;




