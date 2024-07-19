SELECT*
from pizza_sales

SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value
from pizza_sales

SELECT SUM(quantity) AS Total_Pizza_Sold 
from pizza_sales

SELECT COUNT(DISTINCT order_id) AS Total_Order 
from pizza_sales

SELECT CAST(CAST(SUM(quantity) AS DECIMAL (10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL (10,2))
AS Avg_pizza_per_order
from pizza_sales

SELECT*
FROM pizza_sales

SELECT DATENAME(DW, order_date) AS order_day,
COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

SELECT DATENAME(MONTH, order_date) AS Month_Name,
COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_orders DESC

SELECT DATENAME(DW, order_date) AS Order_day, sum(total_price) as Total_sales, sum(total_price) *100 / 
(SELECT sum(total_price) FROM pizza_sales WHERE MONTH(order_date) = 2) AS Per_Revenue
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY DATENAME(DW, order_date)
order by Per_Revenue desc

SELECT pizza_size, CAST(sum(total_price) AS decimal(10,2)) as Total_sales, CAST(sum(total_price) *100 / 
(SELECT sum(total_price) FROM pizza_sales WHERE DATEPART(QUARTER, order_date) =2) AS decimal(10,2)) AS Per_Revenue
FROM pizza_sales
WHERE DATEPART(QUARTER, order_date) =2
GROUP BY pizza_size
order by Per_Revenue desc

SELECT TOP 5 pizza_name, sum(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

SELECT TOP 5 pizza_name, sum(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC

oo
