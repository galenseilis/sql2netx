SELECT customer_id, COUNT(order_id) AS total_orders, SUM(order_amount) AS total_order_amount
FROM orders
GROUP BY customer_id
HAVING total_order_amount > 1000;

