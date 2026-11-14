
use('anchorpay_nosql');

// Check whether the cloud database responds
const result = db.runCommand({ ping: 1 });

print("Database ping result:", result.ok);

// Check whether customer data is accessible
const customer = db.customers.findOne({
  customer_id: 1
});

if (result.ok === 1 && customer) {
  print("Availability Test: PASSED");
  print("Customer:", customer.full_name);
  print("KYC Tier:", customer.kyc.tier);
} else {
  print("Availability Test: FAILED");
}
