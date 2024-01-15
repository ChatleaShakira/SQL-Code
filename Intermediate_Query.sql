/*
Joins
Unions
Case Statements
Updating/Deleting data
Partition By
Data Types
Aliasing
Creating Views
Having vs Group By Statements
GetDate()
Primary Key vs Foreign Key
*/

/*
Inner Joins, Full/Left/Right Outer Joins
*/

SELECT *
FROM TutorATA.dbo.EmployeeDemographics

SELECT *
FROM TutorATA.dbo.EmployeeSalary

/* Inner Join, hanya menampilkan yang kedua duanya ada atau irisan berdasarkan ID*/
SELECT *
FROM TutorATA.dbo.EmployeeDemographics
Inner Join TutorATA.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/* Full Outer Join (kayak gabungan)*/
SELECT *
FROM TutorATA.dbo.EmployeeDemographics
Full Outer Join TutorATA.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/* Left Outer Join (irisan + tambahan dari tabel yg duluan di sebut)*/
SELECT *
FROM TutorATA.dbo.EmployeeDemographics
Left Outer Join TutorATA.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/* Right Outer Join (irisan + tambahan dari tabel yg belakangan di sebut)*/
SELECT *
FROM TutorATA.dbo.EmployeeDemographics
Right Outer Join TutorATA.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT JobTitle, Salary
FROM TutorATA.dbo.EmployeeDemographics
Inner Join TutorATA.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'

SELECT *
FROM TutorATA.dbo.EmployeeDemographics
Inner Join TutorATA.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'

SELECT JobTitle, AVG(Salary)
FROM TutorATA.dbo.EmployeeDemographics
Inner Join TutorATA.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle

/* 
Union, Union All
*/

/*Table 1 Insert:*/
Insert into EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

/*Table 3 Query:*/
Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

/*Table 3 Insert:*/
Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')

/* Full Outer Join (kayak gabungan)*/
SELECT *
FROM TutorATA.dbo.EmployeeDemographics
Full Outer Join TutorATA.dbo.WareHouseEmployeeDemographics
	ON EmployeeDemographics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID

/*cek*/
SELECT *
FROM TutorATA.dbo.EmployeeDemographics

SELECT *
FROM TutorATA.dbo.WareHouseEmployeeDemographics

/*Union (gabungin kolom yg sama juga, jadi gak ada yg double kolomnya, tdk ada duplikat)*/
SELECT *
FROM TutorATA.dbo.EmployeeDemographics
UNION
SELECT *
FROM TutorATA.dbo.WareHouseEmployeeDemographics

/*Union ALL (gabungin kolom yg sama juga, jadi gak ada yg double kolomnya, regardless with duplicate or not)*/
SELECT *
FROM TutorATA.dbo.EmployeeDemographics
UNION ALL
SELECT *
FROM TutorATA.dbo.WareHouseEmployeeDemographics

/*Union ALL (gabungin kolom yg sama juga, jadi gak ada yg double kolomnya, regardless with duplicate or not)*/
SELECT *
FROM TutorATA.dbo.EmployeeDemographics
UNION ALL
SELECT *
FROM TutorATA.dbo.WareHouseEmployeeDemographics
ORDER BY EmployeeID

/*kalau kolomnya beda(better gausah)*/
SELECT *
FROM TutorATA.dbo.EmployeeDemographics
SELECT *
FROM TutorATA.dbo.EmployeeSalary
ORDER BY EmployeeID

SELECT EmployeeID, FirstName, Age
FROM TutorATA.dbo.EmployeeDemographics
UNION
SELECT EmployeeID, JobTitle, Salary
FROM TutorATA.dbo.EmployeeSalary
ORDER BY EmployeeID

/*Case Statement*/
SELECT FirstName, LastName, Age
FROM TutorATA.dbo.EmployeeDemographics

SELECT FirstName, LastName, Age
FROM TutorATA.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age

SELECT FirstName, LastName, Age,
CASE
	WHEN Age > 30 THEN 'Old'
	ELSE 'Young'
END
FROM TutorATA.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age

SELECT FirstName, LastName, Age,
CASE
	WHEN Age > 30 THEN 'Old'
	ELSE 'Young'
END 
AS Category
FROM TutorATA.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age

SELECT FirstName, LastName, Age,
CASE
	WHEN Age > 30 THEN 'Old'
	WHEN Age BETWEEN 27 AND 30 THEN 'Mature'
	ELSE 'Young'
END 
AS Category
FROM TutorATA.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age

SELECT *
FROM TutorATA.dbo.EmployeeDemographics
JOIN TutorATA.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT FirstName, LastName, JobTitle, Salary
FROM TutorATA.dbo.EmployeeDemographics
JOIN TutorATA.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT FirstName, LastName, JobTitle, Salary,
CASE 
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
	WHEN Jobtitle = 'Accountant' THEN Salary + (Salary * .05)
	WHEN Jobtitle = 'HR' THEN Salary + (Salary * .000001)
	Else Salary + (Salary * .03)
END
AS SalaryAfterRaise
FROM TutorATA.dbo.EmployeeDemographics
JOIN TutorATA.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/* 
Having Clause
*/

SELECT JobTitle, COUNT(JobTitle)
FROM TutorATA.dbo.EmployeeDemographics
JOIN TutorATA.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle

/*ini gabisa dilakukan*/
SELECT JobTitle, COUNT(JobTitle)
FROM TutorATA.dbo.EmployeeDemographics
JOIN TutorATA.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE COUNT(JobTitle) > 1
GROUP BY JobTitle

/*yang benar (perhatikan letak group by dan Having)*/
SELECT JobTitle, COUNT(JobTitle)
FROM TutorATA.dbo.EmployeeDemographics
JOIN TutorATA.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1

SELECT JobTitle, AVG(Salary)
FROM TutorATA.dbo.EmployeeDemographics
JOIN TutorATA.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
ORDER BY AVG(Salary)

SELECT JobTitle, AVG(Salary)
FROM TutorATA.dbo.EmployeeDemographics
JOIN TutorATA.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary)

/*
Updating/Deleting Data
*/

SELECT *
FROM TutorATA.dbo.EmployeeDemographics

UPDATE TutorATA.dbo.EmployeeDemographics
SET EmployeeID = 1012
WHERE FirstName = 'Holly' AND LastName = 'Flax'

UPDATE TutorATA.dbo.EmployeeDemographics
SET Age= 31, Gender = 'Female'
WHERE FirstName = 'Holly' AND LastName = 'Flax'

/* Be careful to use DELETE*/

DELETE FROM TutorATA.dbo.EmployeeDemographics
WHERE EmployeeID = 1005

SELECT *
FROM TutorATA.dbo.EmployeeDemographics
WHERE EmployeeID = 1004

/* 
Aliasing
*/

SELECT FirstName AS Fname
FROM TutorATA.dbo.EmployeeDemographics

/* bisa juga kita tulis dengan space aja tanpa AS */
SELECT FirstName Fname
FROM TutorATA.dbo.EmployeeDemographics

SELECT FirstName + ' ' + LastName AS FullName
FROM TutorATA.dbo.EmployeeDemographics

SELECT Demo.EmployeeID, Sal.Salary
FROM TutorATA.dbo.EmployeeDemographics AS DEMO
JOIN TutorATA.dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID

/* 
Partition by
*/
SELECT *
FROM TutorATA..EmployeeDemographics

SELECT *
FROM TutorATA..EmployeeSalary

SELECT *
FROM TutorATA.dbo.EmployeeDemographics AS DEMO
JOIN TutorATA.dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID

SELECT  FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
FROM TutorATA.dbo.EmployeeDemographics AS DEMO
JOIN TutorATA.dbo.EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID
