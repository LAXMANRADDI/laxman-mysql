1.1] delete command with where clause :
syntax:
DELETE FROM table_name WHERE condition;
ex: to delete records of student with stdid = 5
DELETE FROM Students
WHERE StudentID = 5;

1.2] delete command without where clause:
syntax :
DELETE FROM table_name;
ex:
DELETE FROM Students;
imp:[Deletes all records (table becomes empty), but table still exists.]


Applications
Remove specific old or invalid data (with WHERE)
Empty table but keep structure for reuse (without WHERE)


2.1] drop command:can be used to drop table or whole database 
  syntax:
DROP TABLE table_name;
ex:
  DROP TABLE Students;
*]Deletes table Students completely (data + structure).

*]for droping database 
  DROP DATABASE CollegeDB;


Applications
Permanently remove unwanted tables or databases.
Used in database cleanup or restructuring.


3] updatae command:

Basic UPDATE
Updates specific columns.

UPDATE table_name
SET column1 = value1;

Example:
UPDATE employees
SET salary = 50000;

*]Updates salary for all employees.

3.2]UPDATE With WHERE Condition

Updates only selected rows.

UPDATE table_name
SET column1 = value1
WHERE condition;

Example

UPDATE employees
SET salary = 65000
WHERE emp_id = 101;