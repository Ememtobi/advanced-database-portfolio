
# Advanced Database Systems Portfolio

## Overview

This repository contains five practical exercises completed as part of my Advanced Database Systems coursework.

The aim of this portfolio is to understand how databases are designed, managed, optimised and used in real-world applications.

I used a fictional Nigerian fintech platform called **AnchorPay** as the case study throughout the exercises.

AnchorPay allows customers to maintain accounts, complete KYC verification and perform financial transactions.

The portfolio covers relational database design, SQL query optimisation, transaction management, NoSQL databases and cloud database concepts.

## Case Study: AnchorPay

AnchorPay is a fictional financial technology platform that manages:

- Customer information
- Know Your Customer (KYC) verification tiers
- Customer accounts and balances
- Money transfer transactions
- Transaction statuses and reversals

The same case study was used across all five portfolios to demonstrate different database concepts.

All customer and transaction information used in this project is fictional and intended for learning purposes.

## Tools and Technologies

| Tool | Purpose |
|---|---|
| PostgreSQL | Relational database design and SQL exercises |
| pgAdmin 4 | Running SQL queries and viewing database results |
| MongoDB Atlas | Cloud-hosted NoSQL database |
| MongoDB for VS Code | Connecting to MongoDB and running queries |
| Visual Studio Code | Writing and organising project files |
| Git and GitHub | Version control and portfolio documentation |

## Portfolio Exercises

### Portfolio 1: Database Design and Modelling

**Folder:** [Portfolio 1](portfolio-1-database-design/)

This exercise focused on designing a relational database for AnchorPay using PostgreSQL.

I created four related tables:

- `customers`
- `accounts`
- `kyc_tiers`
- `transactions`

I defined primary keys, foreign keys and constraints to help maintain data integrity.

I also created an Entity Relationship Diagram (ERD) to show the relationships between the tables and explained database normalisation up to Third Normal Form (3NF).

**Key concepts:** Database design, ERD, primary keys, foreign keys, constraints and normalisation.

### Portfolio 2: Query Processing and Optimisation

**Folder:** [Portfolio 2](portfolio-2-query-optimisation/)

This exercise explored how SQL queries retrieve information and how database performance can be improved.

I wrote SQL queries to retrieve customer details, join related tables, count successful transactions and calculate transaction totals.

I then generated 10,000 additional fictional transactions to create a larger dataset for performance testing.

Using `EXPLAIN ANALYZE`, I compared query execution before and after creating an index on `sender_account_id`.

| Measurement | Before Index | After Index |
|---|---|---|
| Query approach | Sequential Scan | Bitmap Index Scan and Bitmap Heap Scan |
| Matching records | 335 | 335 |
| Execution time | 0.649 ms | 0.238 ms |

The indexed query was faster in the recorded test. These values represent individual test runs and may vary.

**Key concepts:** SQL joins, aggregation, execution plans, indexing and query optimisation.

### Portfolio 3: Transactions and Concurrency

**Folder:** [Portfolio 3](portfolio-3-transactions-concurrency/)

This exercise focused on how databases manage transactions and multiple users accessing data.

I demonstrated:

- `COMMIT` — saving changes made during a transaction.
- `ROLLBACK` — cancelling changes made during a transaction.
- Transaction isolation — preventing another session from seeing uncommitted changes.
- Concurrency control — managing simultaneous updates to the same account.

For example, I transferred NGN 5,000 between two fictional AnchorPay accounts and confirmed that the combined balance remained unchanged. No money was lost or created during the transfer.

I also used two PostgreSQL sessions to observe how row locking prevents conflicting updates from happening at the same time.

**Key concepts:** ACID properties, COMMIT, ROLLBACK, isolation, concurrency and row locking.

### Portfolio 4: NoSQL and Advanced Data Models

**Folder:** [Portfolio 4](portfolio-4-nosql/)

This exercise introduced NoSQL databases using MongoDB.

Unlike PostgreSQL, which stores related information in separate tables, MongoDB can store related customer information together in a document.

I created a MongoDB database named `anchorpay_nosql` and a `customers` collection.

I then:

- Inserted a fictional customer document.
- Retrieved customer information using `find()`.
- Updated a customer's KYC tier using `updateOne()`.
- Queried the database to confirm that the update was saved.

I also reviewed document, key-value, wide-column and graph database models.

MongoDB was the only NoSQL database implemented in this exercise.

**Key concepts:** NoSQL, document databases, collections, embedded documents and MongoDB queries.

### Portfolio 5: Distributed and Cloud Database Exercise

**Folder:** [Portfolio 5](portfolio-5-distributed-cloud/)

This exercise explored cloud and distributed database concepts using MongoDB Atlas.

I used an AnchorPay MongoDB Atlas cluster hosted on AWS. The Atlas deployment showed a three-node replica set.

I connected to the cloud database from VS Code and successfully retrieved customer information.

I also performed a basic availability test using MongoDB's `ping` command and a customer lookup.

Both checks passed.

The exercise also covered:

- Replication — keeping copies of data across database nodes.
- Availability — ensuring the database can be accessed when needed.
- Failover — allowing an eligible secondary node to take over if the primary fails.
- Sharding — distributing portions of a large database across servers.
- Consistency — ensuring database information remains correct and appropriately up to date.

Sharding and failover were discussed but were not practically tested.

**Key concepts:** Cloud databases, distributed databases, replication, availability, sharding, failover and consistency.

## Repository Structure

```text
advanced-database-portfolio/
│
├── portfolio-1-database-design/
│   ├── SQL files
│   ├── ERD and screenshots
│   └── README.md
│
├── portfolio-2-query-optimisation/
│   ├── SQL files
│   ├── Execution plan screenshots
│   └── README.md
│
├── portfolio-3-transactions-concurrency/
│   ├── SQL files
│   ├── Transaction screenshots
│   └── README.md
│
├── portfolio-4-nosql/
│   ├── MongoDB Playground files
│   ├── Customer document examples
│   ├── Screenshots
│   └── README.md
│
├── portfolio-5-distributed-cloud/
│   ├── 01_availability_test.mongodb.js
│   ├── screenshots/
│   │   ├── 01_atlas_cloud_deployment.png
│   │   ├── 02_cloud_database_query.png
│   │   └── 03_availability_test.png
│   └── README.md
│
└── README.md
```

Each portfolio folder contains its own README with more detailed explanations, implementation steps and screenshots.

## Key Lessons Learned

Completing these exercises helped me understand how different database concepts work together.

I learned how to design relational tables, create relationships, write SQL queries and improve query performance using indexes.

I also gained practical experience with transaction management, including how databases handle changes made by multiple users.

Working with MongoDB introduced me to document-based databases, while MongoDB Atlas helped me understand cloud hosting, replication and database availability.

One important lesson was that different databases are suitable for different purposes. For example, PostgreSQL provides useful relational constraints and transaction features, while MongoDB offers a flexible document model for storing related customer information.

## Limitations

This project was completed for academic learning purposes.

The AnchorPay platform is fictional, and the database exercises do not represent a production banking system.

The generated test transactions were used for query performance testing and did not automatically update account balances.

The MongoDB customer account information was sample data and was not synchronised with PostgreSQL.

The cloud availability test confirmed database access at the time of testing. It did not measure long-term uptime or test server failover.

## Conclusion

This portfolio provided practical experience with five important areas of Advanced Database Systems.

By using the same AnchorPay case study throughout, I was able to connect database design, performance optimisation, transaction management, NoSQL and cloud database concepts.

The exercises improved my understanding of how databases store, retrieve, protect and manage information in real-world applications.
