
-- AnchorPay Fintech Transaction Management System
-- 1. Create Customers Table

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Create Accounts Table
-- Each account belongs to a customer

CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    account_number VARCHAR(10) UNIQUE NOT NULL,
    balance NUMERIC(15,2) NOT NULL DEFAULT 0.00,
    account_status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    currency VARCHAR(3) NOT NULL DEFAULT 'NGN',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT chk_balance
        CHECK (balance >= 0),

    CONSTRAINT chk_account_status
        CHECK (account_status IN ('ACTIVE', 'FROZEN', 'CLOSED'))
);


-- 3. Create transactions table
-- Records money transfers between accounts
-- Supports reversals for failed transactions

CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,

    sender_account_id INTEGER NOT NULL,
    receiver_account_id INTEGER NOT NULL,

    amount NUMERIC(15,2) NOT NULL,
    currency VARCHAR(3) NOT NULL DEFAULT 'NGN',

    transaction_status VARCHAR(20)
        NOT NULL DEFAULT 'PENDING',

    original_transaction_id INTEGER,

    transaction_date TIMESTAMP
        NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Foreign key: Sender account
    CONSTRAINT fk_sender
        FOREIGN KEY (sender_account_id)
        REFERENCES accounts(account_id),

    -- Foreign key: Receiver account
    CONSTRAINT fk_receiver
        FOREIGN KEY (receiver_account_id)
        REFERENCES accounts(account_id),

    -- Links a reversal to the original transfer
    CONSTRAINT fk_original_transaction
        FOREIGN KEY (original_transaction_id)
        REFERENCES transactions(transaction_id),

    -- Transaction amount must be positive
    CONSTRAINT chk_amount
        CHECK (amount > 0),

    -- Only Nigerian Naira is supported
    CONSTRAINT chk_currency
        CHECK (currency = 'NGN'),

    -- Allowed transaction statuses
    CONSTRAINT chk_transaction_status
        CHECK (transaction_status IN (
            'PENDING',
            'SUCCESS',
            'FAILED',
            'REVERSED'
        )),

    -- Prevent transfers to the same account
    CONSTRAINT chk_different_accounts
        CHECK (sender_account_id <> receiver_account_id),

    -- Prevent multiple reversal records
    -- referencing the same original transaction
    CONSTRAINT uq_original_transaction
        UNIQUE (original_transaction_id)
);


-- 4. create KYC tiers table
-- Stores customer verification tiers
-- and their daily transfer limits in NGN

CREATE TABLE kyc_tiers (
    tier_id INTEGER PRIMARY KEY,

    tier_name VARCHAR(20) UNIQUE NOT NULL,

    verification_level VARCHAR(30) NOT NULL,

    daily_transfer_limit NUMERIC(15,2) NOT NULL,

    currency VARCHAR(3) NOT NULL DEFAULT 'NGN',

    CONSTRAINT chk_daily_limit
        CHECK (daily_transfer_limit > 0),

    CONSTRAINT chk_kyc_currency
        CHECK (currency = 'NGN')
);

-- 5. Add KYC tier_id to customers table

ALTER TABLE customers
ADD COLUMN tier_id INTEGER NOT NULL DEFAULT 1;

-- 6. Link customers to the KYC tiers table

ALTER TABLE customers
ADD CONSTRAINT fk_customer_kyc_tier
FOREIGN KEY (tier_id)
REFERENCES kyc_tiers(tier_id);

-- 7. Assign different tiers to existing customers
-- Assign Tier 2 to customers 11–20

UPDATE customers
SET tier_id = 2
WHERE customer_id BETWEEN 11 AND 20;

-- Assign Tier 3 to customers 21–30

UPDATE customers
SET tier_id = 3
WHERE customer_id BETWEEN 21 AND 30;
