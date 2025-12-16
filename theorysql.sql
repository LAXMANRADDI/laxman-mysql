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

---
# 1.Write-Ahead Logging
“A database must ALWAYS write log records *before* writing the actual data to disk.”
This rule ensures:
*Atomicity(rollback possible)
*Durability (committed data survives crash)
*Consistency (no partial writes)
---
#  2. Why WAL
Without WAL:
* If DB crashes mid-update → data becomes half updated
* No undo information → rollback impossible
* No redo information → committed transactions lost
---
#  3. WAL Basic Rule
For every UPDATE/DELETE/INSERT:
Step 1:
Write **log record** (undo + redo) → *disk*
Step 2:
Write  actual modified data** → buffer → disk later
Step 3:
On COMMIT, write “commit record” → log
This ensures recovery.
---
#4. WAL Log Contains
UNDO Information
Old value — used to roll back uncommitted changes.
  
REDO Information
New value — used to redo committed changes after crash.
---
5. WAL Example (Simple)
Query:
```sql
UPDATE emp SET salary = 50000 WHERE emp_id = 100;

What DB writes:
Undo log i.e (emp_id=100, old_salary=30000)
Redo log  i.e (emp_id=100, new_salary=50000)
#6. WAL Benefits
| Feature        | WAL Provides |
| -------------- | ------------ |
| Atomicity      | YES          |
| Consistency    | YES          |
| Isolation      | YES          |
| Durability     | YES          |
| Crash recovery | YES          |

---
7. WAL + Buffer Management (Steal & Force)
This is VERY important for exams.

STEAL
Uncommitted data **may be written** to disk.
* Allows DB to free buffer memory
* But requires **UNDO logging** (to undo uncommitted data during crash)
Used by most DBs (InnoDB)
--
##FORCE
On COMMIT, all modified pages *must be written* to disk.
* Makes recovery easier
* Slow performance
* Not used in modern DBs
 MySQL InnoDB does NOT use FORCE
 It uses WAL + REDO logs instead.
---
8. WAL with Checkpoints
Checkpoints are places where DB writes:
* all dirty pages to disk
* checkpoint record to logs

Purpose:
* speed up recovery
* reduce redo work after crash
---

1. ARIES 

Earlier logging techniques had problems:
Slow recovery
Force writes
Limited buffer policies


ARIES solves this by supporting: STEAL (write uncommitted pages to disk)
NO-FORCE (don’t force pages at commit)
Fast crash recovery


---
2. Core Ideas of ARIES
ARIES is based on UNDO/REDO logging and WAL.
Three big ideas:
1. Log everything (before & after images)
2. Repeat history during RED
3. Undo losers at the end

---
3. Important ARIES Components
Log Sequence Number (LSN)
Every log record has a unique number.
Each data page stores the LSN of last update.
---
Transaction Table (TT)
Tracks:
Active transactions
Last LSN of each transaction
Transaction status (active, committed)
---
Dirty Page Table (DPT)
Tracks:
Pages modified but not yet written to disk
Stores recLSN (first LSN that dirtied the page)
--
 4. ARIES Recovery = 3 Phases
CRASH
  ↓
ANALYSIS
  ↓
REDO
  ↓
UNDO
---
PHASE 1: ANALYSIS
Purpose:
Identify winner and loser transactions
Reconstruct Transaction Table & Dirty Page Table
What happens:
Scan log forward from last checkpoint
Fill TT & DPT

Output:
Winners → committed
Losers → active/uncommitted

-
PHASE 2: REDO (Repeat History)
Purpose:
Reapply all changes (even uncommitted ones!)
Rule:
Redo log record only if:
Page is in DPT AND
Log LSN ≥ recLSN AND
PageLSN < LogLSN


 redo uncommitted: Because DB wants to repeat history exactly.


---
PHASE 3: UNDO
Purpose:
Roll back loser transactions
Undo in reverse LSN order
Use UNDO info (old values)
Write Compensation Log Records (CLR)


CLR:
Records that an undo has happened
Ensures idempotency (safe if crash happens again)


---

5. Simple ARIES Example
Transactions:
T1: UPDATE A
T2: UPDATE B
T1: COMMIT
CRASH

Analysis:
T1 → Winner
T2 → Loser


Redo:
Redo T1 and T2 updates


Undo:
Undo T2 using old value
Write CLR


--
6. Feature	ARIES
Supports STEAL	
Supports NO FORCE	
Fast Recovery	
Handles repeated crashes	
Used in real DBs	

PART 1: TRANSACTION STATES

A transaction = a sequence of database operations that must be executed as a single unit.

🟦 1. Active

Transaction is currently executing.

START TRANSACTION
  ↓
Active


Example:

UPDATE accounts SET balance = balance - 1000 WHERE id = 1;

🟨 2. Partially Committed

All statements executed, but not yet permanently saved.

Last SQL executed
→ waiting for COMMIT to be written to log


Crash here → rollback possible.

🟩 3. Committed

Transaction successfully completed.

COMMIT;


Changes are permanent.

🟥 4. Failed

Transaction cannot continue due to:

system crash

constraint violation

deadlock

🟪 5. Aborted

Transaction is rolled back.

ROLLBACK;


DB returns to previous consistent state.

🟫 6. Terminated

Transaction leaves the system after commit/abort.
Transaction State Diagram (Exam-friendly)
Active
  ↓
Partially Committed
  ↓
Committed → Terminated
  ↓
Failed → Aborted → Terminated
PART 2: ACID PROPERTIES
ACID ensures reliable transactions.
Atomicity
All or nothing.
Example:
UPDATE A;
UPDATE B;
If second fails → first must rollback.
Supported by:
UNDO logs
WAL

🅲 Consistency

Transaction moves DB from one valid state to another.

Example:

Total bank balance must remain same after transfer.

Isolation
Each transaction executes as if alone.
Example:
Two users updating same row simultaneously should not corrupt data.
Handled by:
Locks
MVCC
Durability
  
Once committed → changes survive crashes.
Handled by:
REDO logs
WAL
ARIES
ACID Summary Table
Property	Ensures	Achieved by
Atomicity	No partial execution	UNDO logs
Consistency	DB rules preserved	Constraints
Isolation	No interference	Locks/MVCC
Durability	Data survives crash	REDO + WAL
Real-Life Example (Bank Transfer)
T1:
Withdraw 500 from A
Deposit 500 to B


Atomicity → both happen or none
Consistency → total money same
Isolation → no interference
Durability → survives crash

