1] delete command with where clause :
syntax:
DELETE FROM table_name WHERE condition;
ex: to delete records of student with stdid = 5
DELETE FROM Students
WHERE StudentID = 5;

2] delete command without where clause:
syntax :
DELETE FROM table_name;
ex:
DELETE FROM Students;
imp:[Deletes all records (table becomes empty), but table still exists.]
