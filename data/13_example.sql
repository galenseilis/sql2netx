WITH MonthlySales AS (
    SELECT
        customer_id,
        MONTH(order_date) AS order_month,
        SUM(order_amount) AS total_sales
    FROM orders
    GROUP BY customer_id, order_month
)

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name,
    ms.order_month,
    ms.total_sales
FROM employees AS e
JOIN departments AS d ON e.department_id = d.department_id
JOIN (
    SELECT
        c.customer_id,
        MONTH(o.order_date) AS order_month,
        SUM(o.order_amount) AS total_sales
    FROM customers AS c
    JOIN orders AS o ON c.customer_id = o.customer_id
    WHERE c.country = 'USA'
    GROUP BY c.customer_id, order_month
) AS ms ON e.employee_id = ms.customer_id
WHERE ms.total_sales > 1000
ORDER BY e.employee_id, ms.order_month;

