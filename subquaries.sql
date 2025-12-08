1. Subquery in WHERE (Most Important) 

Find employees earning more than the average salary
SELECT name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary) FROM employees
);
