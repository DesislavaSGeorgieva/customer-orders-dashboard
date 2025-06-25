
-- SQL Project: Customer Orders Dashboard
-- Author: Desislava Georgieva
-- Description: Realistic queries on a simple customer-orders relational schema

-- Task 1: List each customer and the number of their orders
SELECT customers.name, COUNT(orders.order_id) AS total_orders_per_customer
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.name;

-- Task 2: Show customers with total completed orders over 200
SELECT customers.name, SUM(orders.total) AS total_sum
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
WHERE orders.status = 'Completed'
GROUP BY customers.name
HAVING total_sum > 200
ORDER BY total_sum ASC;

-- Task 3: Show all completed orders (status = 'Completed')
SELECT customers.name, orders.order_date, orders.total
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id
WHERE orders.status = 'Completed'
ORDER BY orders.order_date DESC;

-- Task 4: Show the highest value order and the customer who made it
SELECT customers.name, orders.total
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
WHERE orders.total = (SELECT MAX(total) FROM orders);

-- Task 5: Show total order amounts grouped by country
SELECT customers.country, SUM(orders.total) AS orders_per_country
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customers.country
ORDER BY orders_per_country DESC;
