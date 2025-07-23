drop table if exists zepto;

create table zepto (
zep_id serial PRIMARY KEY,
Category VARCHAR (120),
name VARCHAR (150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

-- Data Exploration 

-- count of rows
SELECT COUNT(*) FROM zepto;

-- sample data
SELECT * FROM zepto
LIMIT 10;

--checking null value
SELECT * FROM zepto
WHERE 
Category IS NULL
OR
name IS NULL
OR 	
mrp IS NULL
OR
discountPercent IS NULL
OR
availableQuantity IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

-- Different product catregories
SELECT DISTINCT Category
FROM zepto
ORDER BY Category;

-- product in stock vs out of stock 
SELECT outOfStock,
COUNT(zep_id)
FROM zepto
GROUP BY outOfStock;

-- product names present multiple times
SELECT 
name,
COUNT(zep_id) as "Number of SKUs"
FROM zepto
GROUP BY name
HAVING COUNT(zep_id) > 1
ORDER BY COUNT(zep_id) DESC;


--Data Cleaning

-- products with  price = 0
SELECT * FROM zepto
WHERE 
mrp = 0 OR discountedSellingPrice = 0;

DELETE FROM zepto
WHERE mrp = 0;

-- convert paisa to rupees
UPDATE zepto
SET mrp = mrp/ 100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

select * from zepto;

--Q1 - Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name,
mrp,
discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

--Q2 - Calculated estimated revenue for each category
SELECT 
category,
SUM(discountedSellingPrice * availableQuantity) AS Total_Revenue
FROM zepto
GROUP BY category
ORDER BY Total_Revenue;

--Q3 - What are the products with high MRP but out of stock.
SELECT DISTINCT
name,
mrp,
outofstock
FROM zepto
WHERE outofstock = TRUE
ORDER BY mrp DESC;


--Q4 - Find all products where MRP is greater than $500 and discount is less then 10%.
 SELECT  
 DISTINCT name,
 mrp,
 discountPercent
 FROM zepto
 WHERE mrp > 500 AND discountPercent<10 
 ORDER BY mrp DESC , discountPercent DESC;

--Q5 - Identify the top 5 categories offering the highest average discount percentage.
SELECT 
category,
ROUND(AVG(discountPercent),2) AS Avg_percentage
FROM zepto
GROUP BY category
ORDER BY Avg_percentage DESC
LIMIT 5;

--Q6 - Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT 
name,
weightInGms,
discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS Price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY Price_per_gram;

--Q7 - Group the products into categories like low , medium, high
SELECT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'High'
END AS Weight_Category
FROM zepto;

--Q8 - What is the Total Inventory Weight per category
SELECT 
category,
SUM(weightInGms*availableQuantity) AS Total_Weight
FROM zepto
GROUP BY category
ORDER BY Total_Weight;


