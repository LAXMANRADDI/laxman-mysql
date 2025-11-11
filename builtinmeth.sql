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
