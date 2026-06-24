/* =========================================
   JOB ROLE ANALYSIS
========================================= */

-- Employee Count by Job Role
SELECT JobRole,
       COUNT(*) AS employee_count
FROM hr_data
GROUP BY JobRole
ORDER BY employee_count DESC;

-- Attrition by Job Role
SELECT JobRole,
       COUNT(*) AS attrition_count
FROM hr_data
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY attrition_count DESC;

-- Attrition Rate by Job Role
SELECT
    JobRole,
    COUNT(*) AS total_employees,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS attrition_count,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0
    / COUNT(*) AS attrition_rate
FROM hr_data
GROUP BY JobRole
ORDER BY attrition_rate DESC;

-- Average Salary by Job Role
SELECT JobRole,
       AVG(MonthlyIncome) AS avg_salary
FROM hr_data
GROUP BY JobRole
ORDER BY avg_salary DESC;