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






















 
