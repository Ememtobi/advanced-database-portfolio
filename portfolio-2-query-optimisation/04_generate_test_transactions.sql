
-- Generate additional 10,000 fictional transactions so we can test query performance on a larger table.
INSERT INTO transactions (
    sender_account_id,
    receiver_account_id,
    amount,
    currency,
    transaction_status
)
SELECT
    ((n - 1) % 30) + 1,
    (n % 30) + 1,
    ((n % 500) + 1) * 100.00,
    'NGN',
    CASE
        WHEN n % 10 = 0 THEN 'FAILED'
        ELSE 'SUCCESS'
    END
FROM generate_series(1, 10000) AS n;
