-- SQL Queries for the specified KPIs

-- 1. Average Attrition Rate for All Departments
SELECT 
    Department, 
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS Avg_Attrition_Rate
FROM HR_1
GROUP BY Department;

-- 2. Average Hourly Rate of Male Research Scientists
SELECT 
    ROUND(AVG(HourlyRate), 2) AS Avg_Hourly_Rate
FROM HR_1
WHERE Gender = 'Male' AND JobRole = 'Research Scientist';

-- 3. Attrition Rate vs. Monthly Income Stats
SELECT 
    h1.Attrition, 
    ROUND(AVG(h2.MonthlyIncome), 2) AS Avg_Monthly_Income,
    MIN(h2.MonthlyIncome) AS Min_Monthly_Income,
    MAX(h2.MonthlyIncome) AS Max_Monthly_Income
FROM HR_1 h1
JOIN HR_2 h2 ON h1.EmployeeNumber = h2.`Employee ID`
GROUP BY h1.Attrition;


-- 4. Average Working Years for Each Department

SELECT 
    h1.Department, 
    ROUND(AVG(h2.TotalWorkingYears), 2) AS Avg_Working_Years
FROM HR_1 h1
JOIN HR_2 h2 ON h1.EmployeeNumber = h2.`Employee ID`  
GROUP BY h1.Department;

-- 5. Job Role vs. Work-Life Balance
SELECT 
    h1.JobRole, 
    ROUND(AVG(h2.WorkLifeBalance), 2) AS Avg_WorkLife_Balance
FROM HR_1 h1
JOIN HR_2 h2 ON h1.EmployeeNumber = h2.`Employee ID`  
GROUP BY h1.JobRole;

-- 6. Attrition Rate vs. Years Since Last Promotion
SELECT 
    h1.Attrition, 
    ROUND(AVG(h2.YearsSinceLastPromotion), 2) AS Avg_Years_Since_Last_Promotion
FROM HR_1 h1
JOIN HR_2 h2 ON h1.EmployeeNumber = h2.`Employee ID`  
GROUP BY h1.Attrition;








