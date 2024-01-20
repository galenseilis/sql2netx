SELECT c.customer_id, c.customer_name, MAX(orders.total_order_amount) AS max_order_amount
FROM customers AS c
JOIN (
    SELECT o.customer_id, SUM(p.price * o.quantity) AS total_order_amount
    FROM orders AS o
    JOIN products AS p ON o.product_id = p.product_id
    WHERE o.order_date >= '2023-01-01'
    GROUP BY o.customer_id
) AS orders ON c.customer_id = orders.customer_id
WHERE c.city IN (
    SELECT city
    FROM employees AS e
    JOIN departments AS d ON e.department_id = d.department_id
    WHERE d.location_id = 1
)
GROUP BY c.customer_id, c.customer_name;

