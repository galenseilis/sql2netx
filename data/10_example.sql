SELECT e.employee_id, e.first_name, e.last_name, d.department_name, p.product_name
FROM employees AS e
JOIN departments AS d ON e.department_id = d.department_id
JOIN (
    SELECT o.employee_id, o.product_id
    FROM orders AS o
    JOIN products AS p ON o.product_id = p.product_id
    WHERE p.category_id = 3
) AS emp_orders ON e.employee_id = emp_orders.employee_id
JOIN products AS p ON emp_orders.product_id = p.product_id;

