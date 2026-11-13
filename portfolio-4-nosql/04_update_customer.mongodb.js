
use('anchorpay_nosql');

// Upgrade customer 1 from KYC Tier 1 to Tier 2
db.customers.updateOne(
  { customer_id: 1 },
  {
    $set: {
      "kyc.tier": "Tier 2",
      "kyc.daily_transfer_limit": 200000
    }
  }
);

// Check the updated customer
db.customers.find({ customer_id: 1 });
