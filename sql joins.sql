
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
