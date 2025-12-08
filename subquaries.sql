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
Useful for analytics
Subquery returns 1 value used in every row

3. Subquery in FROM (Derived Table)
Find employees whose salary is above the average of their department
SELECT *
FROM employees e
JOIN (
    SELECT department, AVG(salary) AS avg_sal
    FROM employees
    GROUP BY department
) dept_avg
ON e.department = dept_avg.department
WHERE e.salary > dept_avg.avg_sal;
This is powerful — used in real companies.

4. Subquery with IN
Employees who work in departments where average salary > 55000
SELECT *
FROM employees
WHERE department IN (
    SELECT department 
    FROM employees
    GROUP BY department
    HAVING AVG(salary) > 55000
);

5. Subquery with NOT IN
Find departments WITHOUT any IT employees:
SELECT *
FROM employees
WHERE department NOT IN (
    SELECT department FROM employees WHERE department = 'IT'
);

6. Correlated Subquery (Row-by-row evaluation)
Find employees with salary higher than others in their SAME department
SELECT e1.name, e1.salary, e1.department
FROM employees e1
WHERE e1.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department = e1.department
);


Subquery depends on outer query
Executes once per row
Used for hierarchical or group comparisons

7. Subquery using EXISTS
Show employees only if another IT employee exists
SELECT name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM employees x
    WHERE x.department = 'IT'
);

 EXISTS returns TRUE/FALSE
 Faster than IN for large tables

8. ANY / ALL (Advanced)
Employees whose salary > ANY IT employee
SELECT name
FROM employees
WHERE salary > ANY (
    SELECT salary FROM employees WHERE department = 'IT'
);

Salary > ALL IT employees
SELECT name
FROM employees
WHERE salary > ALL (
    SELECT salary FROM employees WHERE department = 'IT'
);

9. Subquery in UPDATE
Increase salary of employees who are above average:
UPDATE employees
SET salary = salary + 5000
WHERE salary > (
    SELECT AVG(salary) FROM employees
);

10. Subquery in DELETE
Delete employees with the lowest salary in each department (dangerous):
DELETE FROM employees
WHERE salary IN (
    SELECT MIN(salary)
    FROM employees
    GROUP BY department
);
