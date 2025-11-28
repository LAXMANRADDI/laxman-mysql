
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

SELECT s.name, d.dept_name
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