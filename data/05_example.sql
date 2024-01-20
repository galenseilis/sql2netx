SELECT employees.employee_id, employees.first_name, employees.last_name, departments.department_name, salaries.salary
FROM employees
JOIN departments ON employees.department_id = departments.department_id
JOIN salaries ON employees.employee_id = salaries.employee_id;

