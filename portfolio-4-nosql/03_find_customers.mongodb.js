
use('anchorpay_nosql');

// Find all customers
db.customers.find({});

// Find customer with ID 1
db.customers.find({ customer_id: 1 });

// Find customers in KYC Tier 1
//db.customers.find({ "kyc.tier": "Tier 1" });

// Find customers in KYC Tier 2
db.customers.find({ "kyc.tier": "Tier 2" });