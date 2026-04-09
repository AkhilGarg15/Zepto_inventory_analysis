drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) not null,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

--DATA EXPLORATION

--COUNT OF ROWS
SELECT COUNT(*) FROM zepto;

--Sample data
SELECT * FROM zepto
LIMIT 10;

--NULL VALUES
SELECT * FROM zepto
WHERE category is NULL
OR name is NULL
OR mrp is NULL
OR discountpercent is NULL
OR discountedsellingprice is NULL
OR weightingms is NULL
OR availablequantity is NULL
OR outofstock is NULL
OR quantity is NULL;

-- different product category
SELECT DISTINCT category
FROM zepto
ORDER BY category

-- products in stock vs out of stock
SELECT outofstock, COUNT(sku_id)
FROM zepto
GROUP BY outofstock;

-- products names present multiple times
SELECT name, COUNT(sku_id) as "number of SKUs"
FROM zepto
GROUP BY name
ORDER BY COUNT(sku_id) DESC;

--DATA CLEANING

--product with price = 0
SELECT * FROM zepto
WHERE mrp = 0 OR discountedsellingprice = 0;

DELETE FROM zepto
WHERE mrp = 0;

-- convert paise to rupees
UPDATE zepto
SET mrp = mrp/100.0,
discountedsellingprice = discountedsellingprice/100.0;

SELECT mrp,discountedsellingprice FROM zepto

-- DATA ANALYSIS

---- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name, mrp , discountpercent, discountedsellingprice
FROM zepto
ORDER BY discountpercent DESC
LIMIT 10;

--Q2.What are the Products with High MRP but Out of Stock
SELECT DISTINCT name, mrp
FROM zepto
WHERE outofstock = TRUE and mrp >250
ORDER BY mrp DESC;

--Q3.Calculate Estimated Revenue for each category
SELECT category,
SUM(discountedsellingprice*availablequantity) AS totalrevenue
FROM zepto
GROUP BY category
ORDER BY totalrevenue DESC;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp,discountpercent
FROM zepto
WHERE mrp > 500 and discountpercent < 10
ORDER BY mrp DESC, discountpercent DESC

---- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category, 
ROUND(AVG(discountpercent),2) as avgdiscount
FROM zepto
GROUP BY category
ORDER BY avgdiscount DESC
LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name,weightingms,discountedsellingprice, 
ROUND(Weightingms/discountedsellingprice,2) AS pricepergram
FROM zepto
WHERE weightingms >= 100
ORDER BY pricepergram DESC

--Q7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto;

--Q8.What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight DESC;