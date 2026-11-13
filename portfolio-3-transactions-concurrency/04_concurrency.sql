-- Session A: Lock and update Account 1
-- Start a transaction and deduct NGN 5,000

BEGIN;

UPDATE accounts
SET balance = balance - 5000
WHERE account_id = 1
  AND balance >= 5000;

SELECT account_id, balance
FROM accounts
WHERE account_id = 1;

-- Session B: Initiate another transaction
-- Try to deduct NGN 3,000
-- Session B should wait because Session A currently holds a lock on Account 1's row.

BEGIN;

UPDATE accounts
SET balance = balance - 3000
WHERE account_id = 1
  AND balance >= 3000;

-- Session B: Release the lock in Session A
-- Balance updated from 55000 to 50000

COMMIT;

-- Session B: Confirm successful deduction (NGN 3,000)
-- Temporary Balance updated from 50000 to 47000

SELECT account_id, balance
FROM accounts
WHERE account_id = 1;

-- Session B: Run commit to finalise transaction
COMMIT;