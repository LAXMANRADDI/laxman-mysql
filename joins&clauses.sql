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
