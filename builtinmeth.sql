 related to date and time function
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
