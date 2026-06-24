/* =========================================
   DEPARTMENT ANALYSIS
========================================= */

-- Employee Count by Department
SELECT Department,
       COUNT(*) AS employee_count
FROM hr_data
GROUP BY Department
ORDER BY employee_count DESC;

-- Attrition by Department
SELECT Department,
       COUNT(*) AS attrition_count
FROM hr_data
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY attrition_count DESC;

-- Attrition Rate by Department
SELECT
    Department,
    COUNT(*) AS total_employees,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS attrition_count,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0
    / COUNT(*) AS attrition_rate
FROM hr_data
GROUP BY Department
ORDER BY attrition_rate DESC;

-- Average Salary by Department
SELECT Department,
       AVG(MonthlyIncome) AS avg_salary
FROM hr_data
GROUP BY Department
ORDER BY avg_salary DESC;