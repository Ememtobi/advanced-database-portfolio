
-- Portfolio 2: Query Processing and Optimisation
-- Query 1: View all registered customers
SELECT
    customer_id,
    full_name,
    email,
    phone_number
FROM customers
ORDER BY customer_id;

-- Query 2: Display customers and their KYC tiers using JOIN
SELECT
    c.customer_id,
    c.full_name,
    k.tier_name,
    k.daily_transfer_limit
FROM customers c
JOIN kyc_tiers k
    ON c.tier_id = k.tier_id
ORDER BY c.customer_id;

-- Query 3: Display customers and their account balances using JOIN
SELECT
    c.customer_id,
    c.full_name,
    a.account_number,
    a.balance,
    a.account_status
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
ORDER BY c.customer_id;

-- Query 4: Count successful transactions
SELECT
    COUNT(*) AS successful_transactions
FROM transactions
WHERE transaction_status = 'SUCCESS';


-- Query 5: Calculate total value of successful transfers
SELECT
    SUM(amount) AS total_successful_transfers
FROM transactions
WHERE transaction_status = 'SUCCESS';


-- Query 6: Total successful transfers sent by each account
SELECT
    a.account_number,
    SUM(t.amount) AS total_amount_sent
FROM transactions t
JOIN accounts a
    ON t.sender_account_id = a.account_id
WHERE t.transaction_status = 'SUCCESS'
GROUP BY a.account_number
ORDER BY total_amount_sent DESC;

