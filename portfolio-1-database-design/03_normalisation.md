
# Database Normalisation – AnchorPay

## 1. Introduction

Normalisation means organising data into separate tables so that the same information is not repeated unnecessarily.

When designing AnchorPay, I created four tables:

- `kyc_tiers`
- `customers`
- `accounts`
- `transactions`

I separated the tables because they store different information, but they still need to be connected.

For example, instead of storing a customer's name and phone number every time they make a transfer, the transactions table uses their account ID to identify the account involved.

## 2. First Normal Form (1NF)

The first normal form means that each field should contain one value, and each record should be uniquely identified.

In AnchorPay, every customer has a unique `customer_id`, every account has an `account_id`, and every transaction has a `transaction_id`.

For example, if a customer makes three transfers, the database stores them as three separate transaction records instead of putting all three transfers in one field.

This is how I applied 1NF.

## 3. Second Normal Form (2NF)

The second normal form means that the information in a table should depend on its primary key, not just part of it.

In AnchorPay, each table has one primary key column.

For example, the account balance belongs to a particular account identified by `account_id`, while the transaction amount belongs to a transaction identified by `transaction_id`.

Since all four tables use single-column primary keys and already meet 1NF, there are no partial key dependencies.

This means the tables meet 2NF.

## 4. Third Normal Form (3NF)

The third normal form means that information should be stored in the table where it belongs, rather than unnecessarily repeating it in other tables.

For example, AnchorPay has three KYC tiers, each with a daily transfer limit.

Instead of storing the tier name and transfer limit for every customer, I created a separate `kyc_tiers` table.

The `customers` table only stores `tier_id`, which connects each customer to their KYC tier.

I used the same approach for accounts and transactions.

The `accounts` table uses `customer_id` instead of repeating customer details, while the `transactions` table uses account IDs instead of storing customer names and account details for every transfer.

This helps reduce repeated information and keeps the database organised.

Based on these relationships and the business rules used for AnchorPay, the tables were designed to meet 3NF.

## 5. Why I Used This Design

I chose this structure because it makes the database easier to manage.

For example, if the daily transfer limit for Tier 1 changes, I only need to update it in the `kyc_tiers` table rather than changing the details of every Tier 1 customer.

The `accounts` table also stores account balances so that the system can retrieve them easily. The logic for updating balances during transfers will be handled in Portfolio 3.

## 6. Conclusion

Normalisation helped me understand why it is better to separate information into related tables instead of putting everything in one large table.

By applying 1NF, 2NF and 3NF, I was able to organise the AnchorPay database in a way that reduces unnecessary duplication and makes the information easier to maintain.
