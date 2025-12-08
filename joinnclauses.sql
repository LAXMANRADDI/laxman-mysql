A JOIN is used to combine rows from two or more tables based on a related column between them.
Example structure:
Table: students
id	name	dept_id
1	 Rahul 	10
2 	Meena	20


Table: departments
dept_id	dept_name
10     	CSE
20	     ECE


1]INNER JOIN:
Returns rows only when matching data exists in both tables.
SeLECT s.name, d.dept_name
FROM students s
INNER JOIN departments d
ON s.dept_id = d.dept_id;
-->Only matching dept_ids will appear.


2]LEFT JOIN (LEFT OUTER JOIN)

Returns all rows from left table, plus matching rows from right.
SELECT s.name, d.dept_name
FROM students s
LEFT JOIN departments d
ON s.dept_id = d.dept_id;

-->If no match, dept_name becomes NULL.


3] RIGHT JOIN (RIGHT OUTER JOIN)
Opposite of left join.
SELECT s.name, d.dept_name
FROM students s
RIGHT JOIN departments d
ON s.dept_id = d.dept_id;

-->Shows all departments even if no student belongs to that department.


---
4] FULL OUTER JOIN
*)Not directly supported in MySQL.
We use UNION:
SELECT s.*, d.*
FROM students s
LEFT JOIN departments d
ON s.dept_id = d.dept_id

UNION
SELECT s.*, d.*
FROM students s
RIGHT JOIN departments d
ON s.dept_id = d.dept_id;



5] CROSS JOIN
Returns all combinations (cartesian product).
SELECT *
FROM students
CROSS JOIN departments;
If 10 students × 3 depts → 30 rows.
  
6]SELF JOIN
A table joined with itself.
SELECT e1.name AS employee, e2.name AS manager
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.emp_id;


MASTER TABLE FOR ALL FOLLOWING CLAUSES:
emp_id   name  department  salary  join_year 
 1      Rahul  IT          50000   2022      
 2      Meena  HR          60000   2023      
 3      Arjun  IT          70000   2021      
 4      Priya  Sales       45000   2024      
 5      Karan  HR          55000   2022      


1. SELECT
Used to choose columns.
SELECT name, salary
FROM employees;

2. FROM
Specifies table.
SELECT *
FROM employees;

3. WHERE

Filters rows before grouping.
SELECT *
FROM employees
WHERE salary > 55000;

Possible Error :
Correct: salary > 55000
Wrong: WHERE AVG(salary) > 55000
Why? → Aggregate functions not allowed in WHERE.

 4. ORDER BY
Sorts rows.
SELECT name, salary
FROM employees
ORDER BY salary DESC
Error: Ordering a column not in SELECT is allowed in MySQL — no error.

 5. GROUP BY
Groups rows based on a column.
SELECT department, AVG(salary)
FROM employees
GROUP BY department;

Error :
This will ERROR in strict SQL databases:

SELECT name, department
FROM employees
GROUP BY department;

Because name is not aggregated.
MySQL may allow depending on mode, but considered WRONG

6. HAVING
Filters data after grouping.
  
SELECT department, AVG(salary)
FROM employees
GROUP BY department
HAVING AVG(salary) > 55000;

Error : HAVING used without GROUP BY:
SELECT *
FROM employees
HAVING salary > 50000;
This works in MySQL but is bad practice.

7. LIMIT
Restrict rows.
SELECT *
FROM employees
LIMIT 2;

8. DISTINCT
Removes duplicate values.
SELECT DISTINCT department
FROM employees;

9. IN / NOT IN
Multiples values comparison.
SELECT *
FROM employees
WHERE department IN ('IT', 'HR');

10. BETWEEN
Range-based filtering.
SELECT *
FROM employees
WHERE salary BETWEEN 50000 AND 65000;


11. LIKE
Pattern matching.
SELECT *
FROM employees
WHERE name LIKE 'R%';
12. AS (alias)

Renames column/table.
SELECT name AS employee_name
FROM employees AS e;

13. JOIN (with same table
Let’s join employees table with a fake table:
departments
department	head
IT	Arjun
HR	Meena
Sales	Priya
Inner Join
SELECT e.name, e.department, d.head
FROM employees e
JOIN departments d
ON e.department = d.department;

14. EXISTS
Check if row exists in subquery.

SELECT name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM employees x
    WHERE x.department = 'IT'
);
This will return all employees because IT exists.

15. ANY / ALL
ANY
Salary greater than any IT employee (at least one).

SELECT name
FROM employees
WHERE salary > ANY (
    SELECT salary FROM employees WHERE department = 'IT'
);
ALL
Salary greater than all IT employees.
SELECT name
FROM employees
WHERE salary > ALL (
    SELECT salary FROM employees WHERE department = 'IT'
);

16. UNION / UNION ALL
UNION removes duplicates:
SELECT department FROM employees
UNION
SELECT head FROM departments;

UNION ALL keeps duplicates:
SELECT department FROM employees
UNION ALL
SELECT head FROM departments;


using multiple clauses :::
SELECT department, COUNT(*) AS total, AVG(salary) AS avg_sal
FROM employees
WHERE salary > 50000
GROUP BY department
HAVING AVG(salary) > 55000
ORDER BY avg_sal DESC
LIMIT 2;

