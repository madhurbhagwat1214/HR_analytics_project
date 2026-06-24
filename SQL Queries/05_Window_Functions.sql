/* =========================================
   WINDOW FUNCTIONS (ADVANCED SQL)
========================================= */

-- Salary Rank Within Department
SELECT
    EmployeeID,
    Department,
    MonthlyIncome,
    RANK() OVER (
        PARTITION BY Department
        ORDER BY MonthlyIncome DESC
    ) AS salary_rank
FROM hr_data;

-- Top 3 Highest Paid Employees Per Department
WITH ranked_employees AS (
    SELECT *,
           RANK() OVER (
               PARTITION BY Department
               ORDER BY MonthlyIncome DESC
           ) AS salary_rank
    FROM hr_data
)
SELECT *
FROM ranked_employees
WHERE salary_rank <= 3;

-- Compare Employee Salary with Department Average
SELECT
    EmployeeID,
    Department,
    MonthlyIncome,
    AVG(MonthlyIncome) OVER (
        PARTITION BY Department
    ) AS dept_avg_salary
FROM hr_data;

-- Department Size
SELECT
    EmployeeID,
    Department,
    COUNT(*) OVER (
        PARTITION BY Department
    ) AS dept_size
FROM hr_data;

-- Previous Salary Comparison
SELECT
    EmployeeID,
    Department,
    MonthlyIncome,
    LAG(MonthlyIncome) OVER (
        PARTITION BY Department
        ORDER BY MonthlyIncome
    ) AS previous_salary
FROM hr_data;

-- Salary Difference from Previous Employee
SELECT
    EmployeeID,
    Department,
    MonthlyIncome,
    MonthlyIncome -
    LAG(MonthlyIncome) OVER (
        PARTITION BY Department
        ORDER BY MonthlyIncome
    ) AS salary_difference
FROM hr_data;

-- Highest Paid Employee in Each Department
WITH department_rank AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY Department
               ORDER BY MonthlyIncome DESC
           ) AS rn
    FROM hr_data
)
SELECT *
FROM department_rank
WHERE rn = 1;