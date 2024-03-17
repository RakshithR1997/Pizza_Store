---A. KPI’s
---1. Total Revenue:
	Select SUM(total_price) As Total_Revenue from pizza_sales

---2. Average Order Value:
	Select SUM(total_price) / COUNT(distinct(order_id)) As Avg_Order_Value from pizza_sales

---3. Total Pizzas Sold
	Select SUM(quantity) As Total_Pizza_Sold from pizza_sales

---4. Total Orders
	Select COUNT(distinct(order_id)) As Total_Orders from pizza_sales

---5. Average Pizzas Per Order
	Select CAST(CAST(SUM(quantity) As decimal(10,2)) / 
	CAST(COUNT(distinct order_id) As decimal(10,2)) As decimal(10,2)) As Avg_Pizza_Per_Order from pizza_sales

---B. Daily Trend for Total Orders
	Select DATENAME(DW,order_date) as order_day , COUNT(DISTINCT order_id) As Total_orders from pizza_sales
	Group By DATENAME(DW, order_date)

---C. Monthly Trend for Orders
	Select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders from pizza_sales
	GROUP BY DATENAME(MONTH, order_date)

---D. % of Sales by Pizza Category
	SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
	FROM pizza_sales
	GROUP BY pizza_category

---E. % of Sales by Pizza Size
	SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
	FROM pizza_sales
	GROUP BY pizza_size
	ORDER BY pizza_size

---F. Total Pizzas Sold by Pizza Category
	SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold FROM pizza_sales
	GROUP BY pizza_category
	ORDER BY Total_Quantity_Sold DESC

---G. Top 5 Pizzas by Revenue
	SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
	FROM pizza_sales
	GROUP BY pizza_name
	ORDER BY Total_Revenue DESC

---H. Bottom 5 Pizzas by Revenue
	SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
	FROM pizza_sales
	GROUP BY pizza_name
	ORDER BY Total_Revenue ASC

---I. Top 5 Pizzas by Quantity
	SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
	FROM pizza_sales
	GROUP BY pizza_name
	ORDER BY Total_Pizza_Sold DESC

---J. Bottom 5 Pizzas by Quantity
	SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
	FROM pizza_sales
	GROUP BY pizza_name
	ORDER BY Total_Pizza_Sold ASC

---K. Top 5 Pizzas by Total Orders
	SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
	FROM pizza_sales
	GROUP BY pizza_name
	ORDER BY Total_Orders DESC

---L. Borrom 5 Pizzas by Total Orders
	SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
	FROM pizza_sales
	GROUP BY pizza_name
	ORDER BY Total_Orders ASC











	
