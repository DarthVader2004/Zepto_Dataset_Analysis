DROP TABLE IF EXISTS zepto;

CREATE TABLE zepto(
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8,2),
    discoutpercent NUMERIC(5,2),
    availableQuantity INTEGER,
    disocuntedSellinPrice NUMERIC(8,2),
    weightInGms INTEGER,
    outOfStock BOOLEAN,
    quantity INTEGER
);

-- DATA EXPLORATION

-- count of rows
SELECT COUNT(*) FROM zepto;

-- sample data
SELECT * FROM zepto
LIMIT 10;

-- null values
SELECT * FROM zepto
WHERE name IS NULL
OR 
category IS NULL
OR 
mrp IS NULL
OR 
discoutpercent IS NULL
OR 
disocuntedSellinPrice IS NULL
OR 
weightInGms IS NULL
OR 
availableQuantity IS NULL
OR 
outOfStock IS NULL
OR 
quantity IS NULL;

-- different product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

-- products in stock vs out of stock
SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;

-- product names present multiple times
SELECT name, COUNT(sku_id) as "Nubmer of SKUs"
FROM zepto
GROUP BY name
HAVING count(sku_id) > 1
ORDER BY count(sku_id) DESC;

-- data cleaning 

-- product with price = 0
SELECT * FROM zepto
WHERE mrp = 0 OR  disocuntedSellinPrice = 0 ;

DELETE FROM zepto
WHERE mrp = 0;

-- convert paise to rupees
UPDATE zepto 
SET mrp = mrp/100.0,
disocuntedSellinPrice = disocuntedSellinPrice/100.0;

SELECT mrp, disocuntedSellinPrice FROM zepto

-- Q1.Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name, mrp, discoutpercent
FROM zepto
ORDER BY  discoutpercent DESC
LIMIT 10;

-- Q2.What are the Prodcuts with High MRP but of out of Stock.
SELECT DISTINCT name,mrp
FROM zepto
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC;

-- Q3.Calculate Estimated Revenue for each category
SELECT category,
SUM (disocuntedSellinPrice * availableQuantity ) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue DESC;

-- Q4.Find all the products where MRP is greater than rs 500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discoutpercent
FROM zepto
WHERE mrp > 500 AND discoutpercent < 10
ORDER BY mrp DESC;

-- Q5.Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(AVG(discoutpercent),2) as avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6.Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms,disocuntedSellinPrice,
ROUND(disocuntedSellinPrice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

-- Q7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
  WHEN weightInGms < 5000 THEN 'Medium'
  ELSE 'Bulk'
  END AS weight_category
FROM zepto;

-- Q8.What is the Total Inventory Weight Per Category
SELECT category,
SUM (weightInGms * availableQuantity) as total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight