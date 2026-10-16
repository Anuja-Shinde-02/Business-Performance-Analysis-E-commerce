
-- DATA QUALITY ASSESSMENT/DATA VALIDATION

/*
	Business Question
	Does the Customers table contain duplicate Customer IDs?
*/
SELECT
    customer_id,
    COUNT(*) AS duplicate_count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

/*
	Business Question
	Does the Orders table contain duplicate Order IDs?
*/
SELECT
    order_id,
    COUNT(*) AS duplicate_count
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

/*
	Business Question
	How many missing values exist?
*/
SELECT * FROM customers;

-- Customers Table
SELECT
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS MissingCustomerID,
    SUM(CASE WHEN first_name IS NULL THEN 1 ELSE 0 END) AS MissingFirstName,
	SUM(CASE WHEN last_name IS NULL THEN 1 ELSE 0 END) AS MissingLastName,
    SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS MissingCountry,
	SUM(CASE WHEN state IS NULL THEN 1 ELSE 0 END) AS MissingState,
	SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS MissingCity,
    SUM(CASE WHEN score IS NULL THEN 1 ELSE 0 END) AS MissingScore
FROM customers;

-- Orders Table
SELECT
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS MissingOrderID,
    SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS MissingOrderDate,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS MissingCustomerID,
    SUM(CASE WHEN product_name IS NULL THEN 1 ELSE 0 END) AS MissingProduct,
    SUM(CASE WHEN product_category IS NULL THEN 1 ELSE 0 END) AS MissingCategory,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS MissingQuantity,
    SUM(CASE WHEN sales IS NULL THEN 1 ELSE 0 END) AS MissingSales
FROM orders;
/*
	Business Question
	Are there orders without customers?
*/
SELECT o.*
FROM orders o
LEFT JOIN customers c
    ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

/*
	Business Question
	Are there any customers without orders?
*/
SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

/*
	Business Question
	Are there any negative or zero sales?
*/
SELECT * FROM orders;

SELECT *
FROM orders
WHERE sales <= 0;

/*
	Business Question
	Are there any invalid quantity values?
*/
SELECT *
FROM orders
WHERE quantity <= 0;

/*
	Business Question
	Date Range Validation

	This tells us:
	- Earliest order date
	- Latest order date
	- Number of years covered
	It helps us understand the time span before analyzing yearly or monthly trends.
*/
SELECT
    MIN(order_date) AS FirstOrderDate,
    MAX(order_date) AS LastOrderDate,
    COUNT(DISTINCT YEAR(order_date)) AS NumberOfYears
FROM orders;

/*
	What was the first thing you did after importing the data?

	Answer:
	I first assessed the quality of the data by checking for duplicates, missing values, 
	orphan records, and invalid sales values. Only after confirming the integrity of the dataset 
	did I begin the business analysis.


| Check                    | Result | Status   |
| ------------------------ | ------ | -------- |
| Duplicate Customer IDs   | 0      |   Pass   |
| Duplicate Order IDs      | 0      |   Pass   |
| Missing Customer Scores  | X      |   Review |
| Orders Without Customers | 0      |   Pass   |
| Invalid Sales Values     | 0      |   Pass   |

*/

SELECT
    CAST(SUM(sales) AS DECIMAL(10,2)) AS Total_Revenue,
    COUNT(order_id) AS Total_Orders,
    COUNT(DISTINCT customer_id) AS Total_Customers,
    CAST(AVG(sales) AS DECIMAL(10,2)) AS Average_Order_Value
FROM orders;

SELECT
    YEAR(order_date) AS Order_Year,
    CAST(SUM(sales) AS DECIMAL(10,2)) AS Total_Revenue,
    COUNT(order_id) AS Total_Orders,
    CAST(AVG(sales) AS DECIMAL(10,2)) AS Average_Order_Value
FROM orders
GROUP BY YEAR(order_date)
ORDER BY Order_Year;


SELECT
    product_category,
    CAST(SUM(sales) AS DECIMAL(10,2)) AS Total_Revenue,
    COUNT(order_id) AS Total_Orders,
    CAST(AVG(sales) AS DECIMAL(10,2)) AS Average_Order_Value
FROM orders
GROUP BY product_category
ORDER BY Total_Revenue DESC;


SELECT
    product_category,
    product_name,
    CAST(SUM(sales) AS DECIMAL(10,2)) AS Total_Revenue,
    SUM(quantity) AS Total_Quantity_Sold,
    COUNT(order_id) AS Total_Orders,
    CAST(AVG(sales) AS DECIMAL(10,2)) AS Average_Order_Value
FROM orders
GROUP BY
    product_category,
    product_name
ORDER BY
    product_category,
    Total_Revenue DESC;

SELECT
    c.country,
    COUNT(DISTINCT c.customer_id) AS Total_Customers,
    COUNT(o.order_id) AS Total_Orders,
    CAST(SUM(o.sales) AS DECIMAL(10,2)) AS Total_Revenue,
    CAST(AVG(o.sales) AS DECIMAL(10,2)) AS Average_Order_Value
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.country
ORDER BY
    Total_Revenue DESC;


SELECT
    c.customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS Customer_Name,
    c.country,
    c.score,
    COUNT(o.order_id) AS Total_Orders,
    SUM(o.quantity) AS Total_Quantity,
    CAST(SUM(o.sales) AS DECIMAL(10,2)) AS Total_Revenue,
    CAST(AVG(o.sales) AS DECIMAL(10,2)) AS Average_Order_Value
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.country,
    c.score
ORDER BY
    Total_Revenue DESC;