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


CORELATED NON-CORELATED SUBQUARIES::
1. NON-CORRELATED SUBQUERY (Independent Subquery)
Definition
A non-correlated subquery is a subquery that does NOT depend on the outer query.
It runs independently, returns a result, and then the outer query uses that result.

Key Points
Inner query executes first.
Inner query does not reference any column from the outer query.
Result of inner query is fixed for the outer query.
Faster and commonly used.

Example : USING =
Find employees who earn the maximum salary
SELECT name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

Example : USING IN
Find employees who work in departments located in 'Bangalore'
SELECT name
FROM employees
WHERE dept_id IN (
    SELECT dept_id FROM departments WHERE location = 'Bangalore'
);

--> Inner Query Runs Independently -->Result Returned -->Outer Query Uses That Result


CORRELATED SUBQUERY (Dependent Subquery)
Definition
A correlated subquery depends on the outer query.
It runs again for every row of the outer query.

Key Points
Inner query uses a column from the outer query.
Inner query executes multiple times (once per row).
Slower than non-correlated subqueries.
Used for row-by-row comparison.

Example : Find employees whose salary is above the average salary of their department
SELECT e1.name, e1.salary, e1.dept_id
FROM employees e1
WHERE e1.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e1.dept_id = e2.dept_id
);

Here, e1.dept_id is from outer query → dependency.

Example : Find employees who earn the highest salary in their department
SELECT e1.name, e1.salary, e1.dept_id
FROM employees e1
WHERE e1.salary = (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e1.dept_id = e2.dept_id
);

Inner query depends on outer row → correlated.

Outer Row → Inner query runs (uses outer row value) → Returns result → Outer query checks condition → Goes to next row → Inner query runs again →
...

 Feature     Non-Correlated                       Correlated                         
 Dependency  Does NOT depend on outer query       Depends on outer query             
 Execution   Inner query runs first ONCE          Inner query runs MULTIPLE times    
 Speed       Faster                               Slower                             
 Use-case    Fixed comparison                     Row-by-row comparison              
 References  Inner query uses only its own table  Inner query references outer table 


master table for following subquaries::::::::: 
| emp_id | name | dept_id | salary |
| ------ | ---- | ------- | ------ |
| 1      | Asha | 10      | 50,000 |
| 2      | Ravi | 10      | 70,000 |
| 3      | Janu | 20      | 60,000 |
| 4      | Mani | 20      | 90,000 |
| 5      | Riya | 20      | 40,000 |

1. Subquery with IN
Used when the subquery returns multiple values.
Example
Find employees in departments where average salary > 60,000
SELECT name
FROM employees
WHERE dept_id IN (
    SELECT dept_id
    FROM employees
    GROUP BY dept_id
    HAVING AVG(salary) > 60000
);

2. Subquery with NOT IN
Opposite of IN.
Example
Find employees not working in highly paid departments
SELECT name
FROM employees
WHERE dept_id NOT IN (
    SELECT dept_id
    FROM employees
    GROUP BY dept_id
    HAVING AVG(salary) > 60000
);
