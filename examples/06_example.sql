SELECT order_id, customer_id, order_date, order_amount
FROM orders
WHERE customer_id IN (SELECT customer_id FROM orders GROUP BY customer_id HAVING COUNT(order_id) > 1);

