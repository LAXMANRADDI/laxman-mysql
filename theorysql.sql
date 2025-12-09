1. LOGGED OPERATION (With Logging / Write-Ahead Logging)
A logged operation is one where the database records the action in a log file (transaction log) before executing it.
This is called Write-Ahead Logging (WAL).

  ::Purpose:::
Ensures recoverability
Supports ROLLBACK
Supports ACID properties
Supports crash recovery
Ensures durability
Examples of Logged Operations
These operations modify the database and MUST be logged:
INSERT
UPDATE
DELETE
CREATE TABLE, ALTER, DROP (DDL)
Index updates
Transaction BEGIN/COMMIT/ROLLBACK

DB stores:
UNDO log (old values → for rollback)
REDO log (new values → for crash recovery)
Transaction "start", "commit" records

Workflow (Simplified)
1. Operation requested
2. Log record stored on disk
3. Actual data updated
4. Commit recorded

Advantages------------>
  Data safety
  Allows rollback
  Crash recovery possible
  Ensures consistency
  
Disadvantages ---------->
  Slower (logging overhead)
  More disk usage


2. NON-LOGGED OPERATION (Without Logging)
Operations that do NOT generate transaction log entries.
Meaning: DB does not store undo/redo info for them.
Purpose
Faster execution
Used for bulk operations
Used when rollback is not required
Examples::
SELECT statements
No changes → no need to log
  
Bulk operations without logging mode, e.g.:

LOAD DATA INFILE
CREATE INDEX (depending on DB engine)
Non-transactional tables (MyISAM)

Temporary tables
Operations in autocommit OFF but not yet committed
File-based import/export without journal logging
not logged meant to be ::
No undo log
No redo log
No crash recovery tracking

**Advantages
VERY fast
Ideal for bulk operations
**Disadvantages**
Cannot rollback
No crash recovery
Database inconsistency possible

3. LOGGED vs NON-LOGGED — Easy Comparison
Feature	Logged	Non-Logged
Rollback	Possible	Not possible
Logs stored	Yes (undo/redo)	No
Crash recovery	Yes	No
Speed	Slower	Fast
Safety	High	Low
Best for	Transactions, updates	Bulk loads, temp ops
Example	UPDATE, DELETE	SELECT, LOAD DATA

4. Real-Life Example
Logged Operation (Safe)
Updating bank balance:
UPDATE accounts SET balance = balance - 2000 WHERE id = 1;
DB logs old & new values.
Crash? → It can recover.

*] Non-Logged Operation (Fast)
Fast importing 1 million rows:
LOAD DATA INFILE 'file.csv' INTO TABLE sales;
No logs → Very fast
BUT if power fails → cannot recover.

5. Logged Operation Internals (UNDO & REDO)
UPDATE emp SET salary = 80000 WHERE emp_id = 5;
DB stores:
Undo Log:
(emp_id=5, old_salary=40000)
Redo Log:
(emp_id=5, new_salary=80000)
Undo → rollback
Redo → crash recovery
