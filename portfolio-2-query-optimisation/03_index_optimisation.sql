-- 1. Create an index on the sender account column
CREATE INDEX idx_transactions_sender
ON transactions(sender_account_id);

-- 2. ANALYZE- Update what PostgreSQL knows about the table after adding the transactions.

ANALYZE transactions; 

-- 3. Test query performance after indexing

EXPLAIN ANALYZE
SELECT
    transaction_id,
    sender_account_id,
    amount,
    transaction_status
FROM transactions
WHERE sender_account_id = 1;