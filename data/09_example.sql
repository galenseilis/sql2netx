SELECT employee_id, first_name, last_name, department_name
FROM (
    SELECT e.employee_id, e.first_name, e.last_name, d.department_name
    FROM employees AS e
    JOIN departments AS d ON e.department_id = d.department_id
    WHERE d.location_id = 1
) AS employee_department;

