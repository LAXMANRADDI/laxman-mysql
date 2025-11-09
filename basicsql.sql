schema --> collection of n number of databases 
dbms--> data base management system
rdbms --> relational database management system
se --> storage engine // compiler
 --------------------------------------------------------------------------------- since mysql did not have gui  we r using mysql workbench for practicing ---------------------------------------------
 available data types in my sql 

 
•int
 •smallint
 •bigint
 •tinyint
 •mediumint
 •decimal(p,d)
 •float
 •double
 •char
 •varchar
 •binary
 •varbinary
 •datetime
 •date
 •time
 •timestamp
 •year
 • bit
 • real
 • numeric(p,d)
 • xml
 • text
 • tinytext
 • mediumtext
 • longtext
 • blob

 but varchar , int , date , char  are used in major cases 


DATA TYPES                         SIZE IN BYTES

 • tinyint                  ----------->  1 byte
 • smallint                   --------------> 2 byte
 • mediumint              ------------------> 3 byte
 • int                        ----------------> 4 byte
 • bigint              -----------------------> 8 byte 
 • decimal(p,d)          ----------------->  can store upto65 digits 30 can be after decimal point
 • bit                        -------->  1 bit  ( can store either 0 or1)           // note:  usually used to store true or false

 • char(x)      --------------->  can store max 255 charector 
 • varchar(x)         ------------> 16383 charectors 
 • tinytext    -------------------> 256 bytes 
 • text          ----------------> 65535 bytes    (~64 kb )
 • mediumtext         --------------------> ~16mb          //16777215 bytes 
 • longtext            -------------------->      4294967295 bytes (~ 4gb)




 char vs varchar 
 >> char allocates memory while declaring  ,
 >> varchar uses dynamic memory allocation as user gives input it will allocates memory 
=======================================================================================
----------------------------------------------------------------------  
  dml  --------- >data modification lang
  dql  -------- >>data query lang
  ddl ---------> data definition lang 
  dcl --------->>  data contrlo lang 
  tcl  ------------- >>  transaction control lang 

 

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
constraint in my sql 
 1] not null :Ensures that the column will not accept NULL values.


 
CREATE TABLE Students (
    student_id INT NOT NULL,
    name VARCHAR(50) NOT NULL
);


2] unoque constraints :Ensures all values in the column are different


CREATE TABLE Employees (
    emp_id INT UNIQUE,
    email VARCHAR(100) UNIQUE
);

3]primary key :
 Uniquely identifies each record in a table.
 Combines NOT NULL and UNIQUE.

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50)
);

4] copmosite key :

CREATE TABLE Orders (
    order_id INT,
    product_id INT,
    PRIMARY KEY (order_id, product_id)
);




5] foreign key : Links one table to another using a reference key.

 
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);


6] check constraint:

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    age INT CHECK (age >= 18),
    salary DECIMAL(10,2) CHECK (salary > 0)
);


7] default key : Sets a default value if no value is provided.

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50) DEFAULT 'Unknown',
    joining_date DATE DEFAULT GETDATE()
);

8] add constraint : Add Constraint to an Existing Table

ALTER TABLE Employees
ADD CONSTRAINT unique_email UNIQUE (email);





^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
a] select  clauses:Selects specific columns from a table. 
  
 SELECT name, age FROM Students;




b] from clauses:Specifies the table to retrieve data from.

SELECT * FROM Employees; 


c] where clause:
 Filters rows based on a condition.
SELECT * FROM Employees
WHERE salary > 30000;


 d] group by clause:
  Groups rows and is often used with aggregate functions like COUNT(), SUM(), AVG(), etc.

SELECT department, COUNT(emp_id) AS total_employees
FROM Employees
GROUP BY department;

e]having c;ause :
 Filters groups (unlike WHERE, which filters rows).

SELECT department, AVG(salary) AS avg_salary
FROM Employees
GROUP BY department
HAVING AVG(salary) > 40000; 


f]order by clause :
 Sorts the result in ascending (ASC) or descending (DESC) order.
 SELECT * FROM Employees
ORDER BY salary DESC;

g]limit/ top  clause 

-- MySQL / PostgreSQL
SELECT * FROM Employees
LIMIT 5;

-- SQL Server
SELECT TOP 5 * FROM Employees;



h]join clause :
 Used to combine data from two or more tables.
 SELECT Employees.name, Departments.dept_name
FROM Employees
JOIN Departments
ON Employees.dept_id = Departments.dept_id;

example :
 SELECT department, COUNT(emp_id) AS total_employees
FROM Employees
WHERE salary > 30000
GROUP BY department
HAVING COUNT(emp_id) >= 3
ORDER BY total_employees DESC
LIMIT 5;



^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
order of execution 

SELECT column1, column2       -- 5
FROM table_name               -- 1
WHERE condition               -- 2
GROUP BY column_name          -- 3
HAVING group_condition        -- 4
ORDER BY column_name;         -- 6




i] like clause:
The LIKE clause is used in a WHERE statement to search for a specific pattern in a column
 SELECT column_name
FROM table_name
WHERE column_name LIKE pattern;

