1. Subquery in WHERE (Most Important) 

Find employees earning more than the average salary
SELECT name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary) FROM employees
);

2. Subquery in SELECT
Compare each salary with the overall average
SELECT 
    name,
    salary,
    (SELECT AVG(salary) FROM employees) AS avg_salary
FROM employees;
✔ Useful for analytics
✔ Subquery returns 1 value used in every row
