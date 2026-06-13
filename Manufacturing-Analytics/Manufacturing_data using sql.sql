create database manufacturingdb;
use manufacturingdb;

-- Total Production 
select concat((ROUND(SUM(Produced_Qty) / 1000000.0, 2)),"M") as Total_Production from manufacturing_data;

--------------------------------------------------------------------------------------------------------

-- Total Processed
select concat((ROUND(SUM(Processed_Qty) / 1000000.0, 2)),"M")  as Total_Processed from manufacturing_data;

----------------------------------------------------------------------------------------------------------



-- Rejected Percentage
SELECT 
(SUM(Rejected_Qty) * 100.0 / SUM(Produced_Qty)) AS Rejection_Percentage
FROM manufacturing_data;

--------------------------------------------------------------------------------------------------------------

-- Employeewise Rejected Quantity
SELECT 
Emp_Name,
SUM(Rejected_Qty) AS Total_Rejected
FROM manufacturing_data
GROUP BY Emp_Name
ORDER BY Total_Rejected DESC;

-----------------------------------------------------------------------------------------

-- Machine wise Rejected Quantity
SELECT 
Machine_Code,
SUM(Rejected_Qty) AS Rejected
FROM manufacturing_data
GROUP BY Machine_Code
ORDER BY Rejected DESC
limit 10;

----------------------------------------------------------------------------------------------

-- Prouction Trend
SELECT 
Doc_Date,
SUM(Produced_Qty) AS Production
FROM manufacturing_data
GROUP BY Doc_Date
ORDER BY Doc_Date;

-------------------------------------------------------------------------------------------------------

-- manufacturing vs Rejected
SELECT 
SUM(Produced_Qty) AS Produced,
SUM(Rejected_Qty) AS Rejected
FROM manufacturing_data;

-------------------------------------------------------------------------------------------------------

-- Departmentwise Production Vs Rejected
SELECT 
Department_Name,
SUM(Produced_Qty) AS Produced,
SUM(Rejected_Qty) AS Rejected
FROM manufacturing_data
GROUP BY Department_Name;