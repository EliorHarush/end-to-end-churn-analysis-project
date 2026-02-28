--Exploratory data analysis -- Getting a bigger picture of the data --

SELECT * FROM Customer_Data;

-- Gender distribution --

SELECT Gender, COUNT(Gender) AS TotalCount,
CAST(COUNT(Gender) * 100.0 / (SELECT COUNT (*) FROM Customer_Data) AS decimal(10, 2)) AS Percentage
FROM Customer_Data
GROUP BY Gender;

-- Contract distribution --

SELECT Contract, COUNT(Contract) AS TotalCount,
CAST(COUNT(Contract) * 100.0 / (SELECT COUNT (*) FROM Customer_Data) AS decimal(10, 2)) AS Percentage
FROM Customer_Data
GROUP BY Contract;

-- Customer status + Revenue contribution --

SELECT Customer_Status, COUNT(Customer_Status) AS TotalCount, SUM(Total_Revenue) AS TotalREV,
CAST(SUM(Total_Revenue) / (SELECT SUM(Total_Revenue) FROM Customer_Data) * 100.0 AS decimal(10, 2)) AS RevPercentage
FROM Customer_Data
GROUP BY Customer_Status;

-- State distribution --

SELECT State, COUNT(State) AS TotalCount,
CAST(COUNT(State) * 100.0 / (SELECT COUNT(*) FROM Customer_Data) AS decimal(10, 2)) AS Percentage
FROM Customer_Data
GROUP BY State
ORDER BY Percentage DESC;