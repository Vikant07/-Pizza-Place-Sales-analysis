-- How many customers do we have each day? Are there any peak hours? How many customers do we have each day ?
SELECT * FROM orders;

SELECT Round(AVG(counts),0) as numbers_of_customers_each_day
FROM (
SELECT date, COUNT(DISTINCT order_id) AS counts
FROM orders
GROUP BY date
)subquery;

--Are there any peak hours?

SELECT DATEPART(HOUR, [time]) AS [hour],
       COUNT(*) AS num_of_customers
FROM orders
GROUP BY DATEPART(HOUR, [time])
ORDER BY [hour];


-- How many pizzas are typically in order? Do we have any bestsellers?
--Average No. of Pizza in an Order

SELECT round(Avg(order_count),0) AS average_order_count
FROM (
    SELECT order_id, COUNT(order_id) AS order_count
    FROM [ order_d]
    GROUP BY order_id
) subquery;

--Do we have any bestsellers?

SELECT pizza_id, Count(order_id) AS total_sold
FROM [ order_d]
GROUP BY pizza_id
ORDER BY total_sold DESC;

--Q3. How much money did we make this year? 

Select SUM(price) AS Total_profit
FROM
(
Select [ order_d].pizza_id, pizzas.price
FROM
[ order_d]
LEFT JOIN 
pizzas
ON
[ order_d].pizza_id=pizzas.pizza_id 
) AS pizza_prices;

--Q4. Are there any pizzas we should take off the menu, or any promotions we could leverage

SELECT pizza_id, Count(order_id) AS total_sold
FROM [ order_d]
GROUP BY pizza_id
ORDER BY total_sold;