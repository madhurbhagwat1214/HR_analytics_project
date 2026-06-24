/* =========================================
   KPI ANALYSIS
========================================= */

-- Total Employees
SELECT COUNT(*) AS total_employees
FROM hr_data;

-- Attrition Count
SELECT COUNT(*) AS attrition_count
FROM hr_data
WHERE Attrition = 'Yes';

-- Attrition Rate
SELECT
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0
    / COUNT(*) AS attrition_rate
FROM hr_data;

-- Average Salary
SELECT AVG(MonthlyIncome) AS avg_salary
FROM hr_data;

-- Average Age
SELECT AVG(Age) AS avg_age
FROM hr_data;

-- Average Experience
SELECT AVG(TotalWorkingYears) AS avg_experience
FROM hr_data;