
-- COMMIT Example
-- Transfer NGN 5,000 from Account 1 to Account 2


BEGIN;

-- Deduct money from the sender (Initial balance: 60000)
UPDATE accounts
SET balance = balance - 5000
WHERE account_id = 1
  AND balance >= 5000;

-- Add money to the receiver (Initial balance: 70000)
UPDATE accounts
SET balance = balance + 5000
WHERE account_id = 2;

-- Save both changes
COMMIT;

-- Check the updated balances
SELECT
    account_id,
    account_number,
    balance
FROM accounts
WHERE account_id IN (1, 2)
ORDER BY account_id;
