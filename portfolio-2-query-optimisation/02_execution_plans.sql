-- Query 7: Execution plan- To check how PostgreSQL searches transactions

EXPLAIN ANALYZE
SELECT
    transaction_id,
    sender_account_id,
    amount,
    transaction_status
FROM transactions
WHERE sender_account_id = 1;

-- Query 8: ANALYZE- Updates what PostgreSQL knows about the table after adding the treansactions.

ANALYZE transactions; 


-- Query 9: Execution plan after creating the index

EXPLAIN ANALYZE
SELECT
    transaction_id,
    sender_account_id,
    amount,
    transaction_status
FROM transactions
WHERE sender_account_id = 1;




