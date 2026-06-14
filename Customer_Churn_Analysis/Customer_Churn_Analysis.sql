-- Create Database
CREATE DATABASE customer_churn_analysis;

-- Use Database
USE customer_churn_analysis;

-- Create Table
CREATE TABLE customer_churn (
    customer_id INT PRIMARY KEY,
    gender VARCHAR(10),
    tenure INT,
    contract VARCHAR(50),
    monthly_charges DECIMAL(10,2),
    total_charges DECIMAL(10,2),
    internet_service VARCHAR(50),
    churn VARCHAR(5)
);

INSERT INTO customer_churn
(customer_id, gender, tenure, contract, monthly_charges, total_charges, internet_service, churn)
VALUES
(1, 'Male', 1, 'Month-to-month', 70.5, 70.5, 'Fiber optic', 'Yes'),
(2, 'Female', 24, 'One year', 80.0, 1920.0, 'DSL', 'No'),
(3, 'Male', 3, 'Month-to-month', 90.0, 270.0, 'Fiber optic', 'Yes'),
(4, 'Female', 48, 'Two year', 60.0, 2880.0, 'DSL', 'No'),
(5, 'Male', 12, 'Month-to-month', 75.0, 900.0, 'Fiber optic', 'Yes'),
(6, 'Female', 36, 'One year', 65.0, 2340.0, 'DSL', 'No'),
(7, 'Male', 5, 'Month-to-month', 95.0, 475.0, 'Fiber optic', 'Yes'),
(8, 'Female', 60, 'Two year', 55.0, 3300.0, 'DSL', 'No'),
(9, 'Male', 18, 'One year', 70.0, 1260.0, 'DSL', 'No'),
(10, 'Female', 2, 'Month-to-month', 85.0, 170.0, 'Fiber optic', 'Yes'),
(11, 'Male', 30, 'One year', 60.0, 1800.0, 'DSL', 'No'),
(12, 'Female', 8, 'Month-to-month', 88.0, 704.0, 'Fiber optic', 'Yes'),
(13, 'Male', 45, 'Two year', 50.0, 2250.0, 'DSL', 'No'),
(14, 'Female', 6, 'Month-to-month', 92.0, 552.0, 'Fiber optic', 'Yes'),
(15, 'Male', 20, 'One year', 68.0, 1360.0, 'DSL', 'No'),
(16, 'Female', 55, 'Two year', 58.0, 3190.0, 'DSL', 'No'),
(17, 'Male', 4, 'Month-to-month', 97.0, 388.0, 'Fiber optic', 'Yes'),
(18, 'Female', 10, 'Month-to-month', 82.0, 820.0, 'Fiber optic', 'Yes'),
(19, 'Male', 40, 'Two year', 62.0, 2480.0, 'DSL', 'No'),
(20, 'Female', 15, 'One year', 70.0, 1050.0, 'DSL', 'No'),
(21, 'Male', 2, 'Month-to-month', 89.0, 178.0, 'Fiber optic', 'Yes'),
(22, 'Female', 28, 'One year', 66.0, 1848.0, 'DSL', 'No'),
(23, 'Male', 50, 'Two year', 52.0, 2600.0, 'DSL', 'No'),
(24, 'Female', 7, 'Month-to-month', 91.0, 637.0, 'Fiber optic', 'Yes'),
(25, 'Male', 14, 'Month-to-month', 78.0, 1092.0, 'Fiber optic', 'Yes'),
(26, 'Female', 33, 'One year', 64.0, 2112.0, 'DSL', 'No'),
(27, 'Male', 60, 'Two year', 58.0, 3480.0, 'DSL', 'No'),
(28, 'Female', 9, 'Month-to-month', 86.0, 774.0, 'Fiber optic', 'Yes'),
(29, 'Male', 22, 'One year', 70.0, 1540.0, 'DSL', 'No'),
(30, 'Female', 4, 'Month-to-month', 93.0, 372.0, 'Fiber optic', 'Yes'),
(31, 'Male', 18, 'One year', 67.0, 1206.0, 'DSL', 'No'),
(32, 'Female', 11, 'Month-to-month', 85.0, 935.0, 'Fiber optic', 'Yes'),
(33, 'Male', 42, 'Two year', 55.0, 2310.0, 'DSL', 'No'),
(34, 'Female', 6, 'Month-to-month', 96.0, 576.0, 'Fiber optic', 'Yes'),
(35, 'Male', 25, 'One year', 72.0, 1800.0, 'DSL', 'No'),
(36, 'Female', 48, 'Two year', 60.0, 2880.0, 'DSL', 'No'),
(37, 'Male', 3, 'Month-to-month', 98.0, 294.0, 'Fiber optic', 'Yes'),
(38, 'Female', 16, 'Month-to-month', 80.0, 1280.0, 'Fiber optic', 'Yes'),
(39, 'Male', 38, 'Two year', 62.0, 2356.0, 'DSL', 'No'),
(40, 'Female', 20, 'One year', 69.0, 1380.0, 'DSL', 'No');



-- 1. View Complete Dataset
SELECT * 
FROM customer_churn;

-- 2. Total Customers
SELECT COUNT(*) AS total_customers
FROM customer_churn;

-- 3. Churn Rate
SELECT
ROUND(
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 /
COUNT(*),2
) AS churn_rate_percentage
FROM customer_churn;

-- 4. Total Churned Customers
SELECT COUNT(*) AS churned_customers
FROM customer_churn
WHERE churn = 'Yes';

-- 5. Gender-wise Customer Distribution
SELECT gender,
COUNT(*) AS total_customers
FROM customer_churn
GROUP BY gender;

-- 6. Gender-wise Churn Analysis
SELECT gender,
COUNT(*) AS churned_customers
FROM customer_churn
WHERE churn = 'Yes'
GROUP BY gender;

-- 7. Contract Type Analysis
SELECT contract,
COUNT(*) AS total_customers
FROM customer_churn
GROUP BY contract;

-- 8. Churn by Contract Type
SELECT contract,
COUNT(*) AS churned_customers
FROM customer_churn
WHERE churn = 'Yes'
GROUP BY contract;

-- 9. Average Monthly Charges by Churn Status
SELECT churn,
ROUND(AVG(monthly_charges),2) AS avg_monthly_charge
FROM customer_churn
GROUP BY churn;

-- 10. Average Tenure by Churn Status
SELECT churn,
ROUND(AVG(tenure),2) AS avg_tenure
FROM customer_churn
GROUP BY churn;

-- 11. Internet Service Distribution
SELECT internet_service,
COUNT(*) AS total_customers
FROM customer_churn
GROUP BY internet_service;

-- 12. Churn by Internet Service
SELECT internet_service,
COUNT(*) AS churned_customers
FROM customer_churn
WHERE churn = 'Yes'
GROUP BY internet_service;

-- 13. Top 5 Customers with Highest Monthly Charges
SELECT *
FROM customer_churn
ORDER BY monthly_charges DESC
LIMIT 5;

-- 14. Customers with Tenure Greater Than Average
SELECT *
FROM customer_churn
WHERE tenure >
(
SELECT AVG(tenure)
FROM customer_churn
);

-- 15. Customer Segmentation Based on Tenure
SELECT
CASE
WHEN tenure < 12 THEN 'New Customer'
WHEN tenure BETWEEN 12 AND 36 THEN 'Mid-Term Customer'
ELSE 'Loyal Customer'
END AS customer_segment,
COUNT(*) AS total_customers
FROM customer_churn
GROUP BY customer_segment;

-- 16. Churn Rate by Contract Type
SELECT contract,
ROUND(
SUM(CASE WHEN churn='Yes' THEN 1 ELSE 0 END)*100.0/
COUNT(*),2
) AS churn_rate
FROM customer_churn
GROUP BY contract;

-- 17. Revenue Lost Due to Churn
SELECT
SUM(total_charges) AS revenue_lost
FROM customer_churn
WHERE churn = 'Yes';

-- 18. Highest Revenue Generating Customers
SELECT customer_id,
total_charges
FROM customer_churn
ORDER BY total_charges DESC
LIMIT 10;

-- 19. Monthly Charges Category Analysis
SELECT
CASE
WHEN monthly_charges < 50 THEN 'Low'
WHEN monthly_charges BETWEEN 50 AND 80 THEN 'Medium'
ELSE 'High'
END AS charge_category,
COUNT(*) AS total_customers
FROM customer_churn
GROUP BY charge_category;

-- 20. Churned Customers with High Monthly Charges
SELECT *
FROM customer_churn
WHERE churn='Yes'
AND monthly_charges >
(
SELECT AVG(monthly_charges)
FROM customer_churn
);


select * from customer_churn;