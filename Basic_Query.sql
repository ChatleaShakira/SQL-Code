CREATE TABLE EmployeeDemographics
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

Create Table EmployeeSalary 
(EmployeeID int, 
JobTitle varchar(50), 
Salary int
)

Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

SELECT TOP (1000) [EmployeeID]
      ,[FirstName]
      ,[LastName]
      ,[Age]
      ,[Gender]
  FROM [TutorATA].[dbo].[EmployeeDemographics]


SELECT TOP (1000) [EmployeeID]
      ,[JobTitle]
      ,[Salary]
  FROM [TutorATA].[dbo].[EmployeeSalary]

/*
Select Statement
*, Top, Distinct, Count, As, Max, Min, Avg
*/

SELECT *
FROM EmployeeDemographics

SELECT *
FROM EmployeeSalary

SELECT TOP 5*
FROM EmployeeDemoghrapics

SELECT TOP 5 Salary
FROM EmployeeSalary

/*menampilkan hasil yang unik, karena ID unik maka semuanya keluar*/

SELECT DISTINCT (EmployeeID)
FROM EmployeeDemographics

SELECT DISTINCT (Gender)
FROM EmployeeDemographics

/*Menjumlahkan jumlah entri atau banyaknya baris yang berisi gender*/

SELECT COUNT (Gender)
FROM EmployeeDemographics

SELECT MAX (Salary)
FROM EmployeeSalary

SELECT AVG (Salary)
FROM EmployeeSalary

SELECT *
FROM TutorATA.dbo.EmployeeDemographics

/*AS itu untuk nama sementara*/

SELECT * 
FROM EmployeeDemographics
WHERE FirstName = 'Jim'

/*melihat yang bukan (not equal) jim*/
SELECT * 
FROM EmployeeDemographics
WHERE FirstName <>'Jim'

SELECT * 
FROM EmployeeDemographics
WHERE Age > 30

SELECT * 
FROM EmployeeDemographics
WHERE Age >= 30

/*ingat logika or dan and*/
SELECT * 
FROM EmployeeDemographics
WHERE Age >= 30 AND Gender = 'Male'

SELECT * 
FROM EmployeeDemographics
WHERE Age >= 30 OR Gender = 'Male'

/*everybody who has lastname start with S*/
SELECT * 
FROM EmployeeDemographics
WHERE LastName LIKE 'S%'

/*everybody who has lastname with S anywhere*/
SELECT * 
FROM EmployeeDemographics
WHERE LastName LIKE '%S%'

SELECT * 
FROM EmployeeDemographics
WHERE LastName LIKE 'S%O%'

SELECT * 
FROM EmployeeDemographics
WHERE LastName is NOT NULL

/*The different between IN and '=' is that 'IN' can be used for more than one expression*/
SELECT * 
FROM EmployeeDemographics
WHERE FirstName IN ('Jim', 'Michael')

/*Group by and Order by*/
SELECT Gender
FROM EmployeeDemographics
GROUP BY Gender

SELECT Gender, COUNT(Gender)
FROM EmployeeDemographics
GROUP BY Gender

SELECT Gender, Age, COUNT(Gender)
FROM EmployeeDemographics
GROUP BY Gender, Age

SELECT Gender, Age, COUNT(Gender), COUNT(Age)
FROM EmployeeDemographics
GROUP BY Gender, Age

SELECT Gender, Age, COUNT(Gender)
FROM EmployeeDemographics
WHERE Age > 30
GROUP BY Gender, Age

SELECT Gender, COUNT(Gender) AS Total
FROM EmployeeDemographics
WHERE Age > 30
GROUP BY Gender

SELECT Gender, COUNT(Gender) AS Total
FROM EmployeeDemographics
WHERE Age > 30
GROUP BY Gender
Order BY Total

/* ASC ascending DESC Descending, in general auto ASC*/
SELECT Gender, COUNT(Gender) AS Total
FROM EmployeeDemographics
WHERE Age > 30
GROUP BY Gender
Order BY Total DESC

SELECT *
FROM EmployeeDemographics
ORDER BY Age

SELECT *
FROM EmployeeDemographics
ORDER BY Age ASC, Gender ASC

SELECT *
FROM EmployeeDemographics
ORDER BY Age ASC, Gender DESC

SELECT *
FROM EmployeeDemographics
ORDER BY Age DESC, Gender DESC

SELECT *
FROM EmployeeDemographics
ORDER BY 4 DESC, 5 DESC