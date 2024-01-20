WITH MonthlySales AS (
    SELECT
        customer_id,
        MONTH(order_date) AS order_month,
        SUM(order_amount) AS total_sales
    FROM orders
    GROUP BY customer_id, order_month
)

SELECT
    c.customer_id,
    c.customer_name,
    ms.order_month,
    ms.total_sales
FROM customers AS c
JOIN MonthlySales AS ms ON c.customer_id = ms.customer_id
WHERE ms.total_sales > 500;

