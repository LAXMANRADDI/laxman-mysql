a] related to date and time function
 Function                      Description                      Example                                                        
 ----------------------------  -------------------------------  -------------------------------------------------------------- 
 `NOW()`                       Returns current date and time    `SELECT NOW();` → `2025-11-11 14:20:36`                        
 `CURDATE()`                   Returns current date            `SELECT CURDATE();` → `2025-11-11`                             
 `CURTIME()`                   Returns current time             `SELECT CURTIME();` → `14:20:36`                               
 `DATE()`                      Extracts date from datetime      `SELECT DATE('2025-11-11 10:30:00');` → `2025-11-11`           
 `DAY()`                      Returns day of the month (1–31)  `SELECT DAY('2025-11-11');` → `11`                             
 `MONTH()`                     Returns month number (1–12)      `SELECT MONTH('2025-11-11');` → `11`                           
 `YEAR()`                      Returns year                     `SELECT YEAR('2025-11-11');` → `2025`                          
 `DAYNAME()`                   Returns name of the day          `SELECT DAYNAME('2025-11-11');` → `Tuesday`                    
 `MONTHNAME()`                 Returns name of the month        `SELECT MONTHNAME('2025-11-11');` → `November`                 
 `DATEDIFF(d1, d2)`            Difference between two dates     `SELECT DATEDIFF('2025-12-01', '2025-11-11');` → `20`          
 `ADDDATE(d, INTERVAL n DAY)`  Add n days to a date             `SELECT ADDDATE('2025-11-11', INTERVAL 5 DAY);` → `2025-11-16` 
 `SUBDATE(d, INTERVAL n DAY)`  Subtract n days                  `SELECT SUBDATE('2025-11-11', INTERVAL 5 DAY);` → `2025-11-06` 
 `DATE_FORMAT(date, format)`   Custom date formatting           `SELECT DATE_FORMAT(NOW(), '%d-%m-%Y');` → `11-11-2025`        

  ex:
  #CURDATE(), DAYNAME(), ADDDATE()
  SELECT CURDATE() AS Today, 
       DAYNAME(CURDATE()) AS Day_Name, 
       ADDDATE(CURDATE(), INTERVAL 10 DAY) AS Future_Date;
Output:
             Today	Day_Name	Future_Date
             2025-11-11	Tuesday	2025-11-21




  b] related to string
 Function                         Description               Example                                                        
 -------------------------------  ------------------------  -------------------------------------------------------------- 
 `LENGTH(str)`                   Length of string         `SELECT LENGTH('MySQL');` → `5`                                |
 `UPPER(str)`                     Convert to uppercase      `SELECT UPPER('mysql');` → `MYSQL`                             
 `LOWER(str)`                     Convert to lowercase      `SELECT LOWER('MYSQL');` → `mysql`                             
 `CONCAT(a, b, …)`                Join strings              `SELECT CONCAT('My', 'SQL');` → `MySQL`                        
 `SUBSTRING(str, start, length)`  Extract part of a string  `SELECT SUBSTRING('Database', 1, 4);` → `Data`                 
 `REPLACE(str, from, to)`         Replace substring         `SELECT REPLACE('Hello SQL', 'SQL', 'MySQL');` → `Hello MySQL` 
 `LTRIM(str)`                     Remove left spaces        `SELECT LTRIM('  SQL');` → `SQL`                               
 `RTRIM(str)`                     Remove right spaces       `SELECT RTRIM('SQL  ');` → `SQL`                               
 `TRIM(str)`                      Remove both side spaces   `SELECT TRIM('  SQL  ');` → `SQL`                              


 ex:   CONCAT(), UPPER(), LOWER(), REPLACE()
 SELECT CONCAT(UPPER(first_name), ' ', LOWER(last_name)) AS FullName
FROM employees
WHERE REPLACE(department, 'Dept', '') = 'Sales';
Output:
  FullName
  JOHN smith
  MARY thomas



  c] aggrigate functions 


   Function   Description     Example                            
 ---------  ---------------  ---------------------------------- 
 `COUNT()`  Counts rows      `SELECT COUNT(*) FROM students;`   
 `SUM()`    Sum of a column  `SELECT SUM(marks) FROM students;` 
 `AVG()`    Average value    `SELECT AVG(marks) FROM students;` 
 `MIN()`    Minimum value    `SELECT MIN(marks) FROM students;` 
 `MAX()`    Maximum value    `SELECT MAX(marks) FROM students;` 



d] related to numbers\

 Function       Description          Example                            
 -------------  -------------------  ---------------------------------- 
 `ABS(x)`       Absolute value       `SELECT ABS(-5);` → `5`            
 `CEIL(x)`      Round up             `SELECT CEIL(4.2);` → `5`          
 `FLOOR(x)`     Round down           `SELECT FLOOR(4.8);` → `4`         
 `ROUND(x, d)`  Round to d decimals  `SELECT ROUND(5.678, 2);` → `5.68` 
  `MOD(a, b)`    Remainder            `SELECT MOD(10, 3);` → `1`         
`POW(a, b)`    Power                `SELECT POW(2, 3);` → `8`          
 `SQRT(x)`      Square root          `SELECT SQRT(16);` → `4`           

 
ex: Functions used: ROUND(), CEIL()
SELECT id, salary, 
       ROUND(salary * 0.1, 2) AS Bonus, 
       CEIL(salary * 1.05) AS New_Salary
FROM employees;
Output:
id	salary	Bonus	New_Salary
    1	50000	5000.00	52500
    2	42000	4200.00	44100
    3	31500	3150.00	33075

