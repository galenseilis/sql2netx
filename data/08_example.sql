SELECT customer_id, customer_name, total_order_amount
FROM (
    SELECT c.customer_id, c.customer_name, SUM(o.order_amount) AS total_order_amount
    FROM customers AS c
    JOIN orders AS o ON c.customer_id = o.customer_id
    JOIN products AS p ON o.product_id = p.product_id
    JOIN categories AS cat ON p.category_id = cat.category_id
    WHERE cat.category_name = 'Electronics'
    GROUP BY c.customer_id, c.customer_name
    HAVING COUNT(DISTINCT o.order_id) > 2
) AS customer_orders;

