-- ROLLBACK Example: customer starts transferring ₦10,000 but decides to cancel before the transaction is completed.

-- Step 1: Balance changes temporarily
BEGIN;

-- Deduct NGN 10,000 from Account 1 (Account 1 Balance : 55000)
UPDATE accounts
SET balance = balance - 10000
WHERE account_id = 1
  AND balance >= 10000;

-- Add NGN 10,000 to Account 2 (Account 2 Balance : 75000)
UPDATE accounts
SET balance = balance + 10000
WHERE account_id = 2;

-- View balances before cancelling
SELECT
    account_id,
    balance
FROM accounts
WHERE account_id IN (1, 2)
ORDER BY account_id;

-- Step 2: Cancels changes and restores the original balances
ROLLBACK;

-- Check balances after cancellation
SELECT
    account_id,
    balance
FROM accounts
WHERE account_id IN (1, 2)
ORDER BY account_id;
