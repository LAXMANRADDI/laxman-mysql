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
