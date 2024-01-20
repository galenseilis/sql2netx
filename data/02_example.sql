SELECT employees.employee_id, employees.first_name, employees.last_name, departments.department_name
FROM employees
JOIN departments ON employees.department_id = departments.department_id
WHERE employees.salary > 50000;

