-- Insert sample customers

INSERT INTO customers (full_name, email, phone_number)
VALUES
('Ada Okafor', 'ada@example.com', '08012345678'),
('Tobi Bello', 'tobi@example.com', '08087654321');
('Chinedu Okeke', 'chinedu@example.com', '08010000003'),
('Aisha Mohammed', 'aisha@example.com', '08010000004'),
('Oluwaseun Adeyemi', 'seun@example.com', '08010000005'),
('Ngozi Eze', 'ngozi@example.com', '08010000006'),
('Ibrahim Musa', 'ibrahim@example.com', '08010000007'),
('Fatima Abdullahi', 'fatima@example.com', '08010000008'),
('Emeka Nwosu', 'emeka@example.com', '08010000009'),
('Blessing Johnson', 'blessing@example.com', '08010000010'),
('Samuel Adebayo', 'samuel@example.com', '08010000011'),
('Zainab Bello', 'zainab@example.com', '08010000012'),
('David Okafor', 'david@example.com', '08010000013'),
('Grace Udo', 'grace@example.com', '08010000014'),
('Tunde Bakare', 'tunde@example.com', '08010000015'),
('Amara Obi', 'amara@example.com', '08010000016'),
('Yusuf Sani', 'yusuf@example.com', '08010000017'),
('Esther Akpan', 'esther@example.com', '08010000018'),
('Femi Oladipo', 'femi@example.com', '08010000019'),
('Hauwa Ibrahim', 'hauwa@example.com', '08010000020'),
('Daniel Ekanem', 'daniel@example.com', '08010000021'),
('Chioma Nnamdi', 'chioma@example.com', '08010000022'),
('Peter Ojo', 'peter@example.com', '08010000023'),
('Maryam Usman', 'maryam@example.com', '08010000024'),
('Victor Chukwu', 'victor@example.com', '08010000025'),
('Ruth Bassey', 'ruth@example.com', '08010000026'),
('Kunle Ajayi', 'kunle@example.com', '08010000027'),
('Halima Garba', 'halima@example.com', '08010000028'),
('Joseph Etim', 'joseph@example.com', '08010000029'),
('Deborah Adekunle', 'deborah@example.com', '08010000030');


--2. Create accounts for 30 existing customers

INSERT INTO accounts (
    customer_id,
    account_number,
    balance,
    account_status
)
SELECT
    customer_id,
    (1000000000 + customer_id)::VARCHAR(10),
    (50000 + customer_id * 10000)::NUMERIC(15,2),
    'ACTIVE'
FROM customers
WHERE customer_id BETWEEN 1 AND 30;


-- Insert KYC tiers

INSERT INTO kyc_tiers (
    tier_id,
    tier_name,
    verification_level,
    daily_transfer_limit,
    currency
)
VALUES
    (1, 'Tier 1', 'Basic', 50000.00, 'NGN'),
    (2, 'Tier 2', 'Intermediate', 200000.00, 'NGN'),
    (3, 'Tier 3', 'Full', 1000000.00, 'NGN');

-- Insert sample transaction records

INSERT INTO transactions (
    sender_account_id,
    receiver_account_id,
    amount,
    currency,
    transaction_status
)
VALUES
    (1, 2, 20000.00, 'NGN', 'SUCCESS'),
    (3, 4, 15000.00, 'NGN', 'SUCCESS'),
    (5, 6, 10000.00, 'NGN', 'FAILED'),
    (7, 8, 5000.00, 'NGN', 'FAILED');

-- create a sample reversal transaction
-- Transaction failed but customer was debited

INSERT INTO transactions (
    sender_account_id,
    receiver_account_id,
    amount,
    currency,
    transaction_status,
    original_transaction_id
)
SELECT
    receiver_account_id,
    sender_account_id,
    amount,
    currency,
    'REVERSED',
    transaction_id
FROM transactions
WHERE transaction_id = 4
  AND transaction_status = 'FAILED'
  AND original_transaction_id IS NULL
  AND NOT EXISTS (
      SELECT 1
      FROM transactions
      WHERE original_transaction_id = 4
  );

