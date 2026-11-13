
-- Portfolio 3: Transaction Isolation
-- Session A: Update balance without committing

BEGIN;

UPDATE accounts
SET balance = balance - 5000
WHERE account_id = 1
  AND balance >= 5000;

SELECT account_id, balance
FROM accounts
WHERE account_id = 1;


-- Session B: Read the account balance

SHOW transaction_isolation;

SELECT account_id, balance
FROM accounts
WHERE account_id = 1;
