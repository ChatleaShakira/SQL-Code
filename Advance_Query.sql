/*
-------------------------------------------------------------------------
CTEs
-------------------------------------------------------------------------
*/

WITH CTE_Employee AS
(SELECT FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION by Gender) as TotalGender,
AVG(Salary) OVER (PARTITION by Gender) as AvgSalary
FROM TutorATA..EmployeeDemographics Demo
Join TutorATA..EmployeeSalary Sal
	ON Demo.EmployeeID = Sal.EMployeeID
WHERE Salary > 45000
)
/* CTE nya juga harus di run */
SELECT FirstName, AvgSalary
FROM CTE_Employee

/* 
------------------------------------------------------------------------
Temp Table (Gak perlu selalu run CREATE TAble #temp_TABLE nyaa)
------------------------------------------------------------------------
*/ 

CREATE TABLE #temp_Employee (
EmployeeID int,
JobTitle varchar(100),
Salary int
)

Select *
FROM #temp_Employee

INSERT INTO #temp_Employee VALUES (
'1001', 'HR', '45000'
)

INSERT INTO #temp_Employee
SELECT *
FROM TutorATA..EmployeeSalary

CREATE TABLE #temp_Employee2 (
JobTitle varchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)

INSERT INTO #temp_Employee2
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM TutorATA..EmployeeDemographics Demo
JOIN TutorATA..EmployeeSalary Sal
	ON Demo.EmployeeID = Sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #temp_Employee2

SELECT * 
FROM TutorATA..EmployeeDemographics

SELECT * 
FROM TutorATA..EmployeeSalary

/* Trick 
Kalau mungkin temp tablenya udah ada tp kita malah buat lg
pakai "DROP" */

DROP TABLE IF EXISTS #temp_Employee2
CREATE TABLE #temp_Employee2 (
JobTitle varchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)

INSERT INTO #temp_Employee2
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM TutorATA..EmployeeDemographics Demo
JOIN TutorATA..EmployeeSalary Sal
	ON Demo.EmployeeID = Sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #temp_Employee2