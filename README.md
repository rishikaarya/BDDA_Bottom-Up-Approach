# Supermarket Database Overview
This repository contains SQL scripts for creating and populating a retail store database using a top-down approach. The database is designed to manage and track various aspects of a supermarket, including products, customers, invoices, discounts, taxes, and more.

# Database Schema
The database schema consists of 14 tables, each playing a specific role in the store’s operations:

1) Categories: Stores information about different product categories in the store.

2) Products: Contains data about the products available for sale, including their prices and categories.

3) Discounts: Holds information about various discounts available in the store.

4) Product_Discounts: Links specific discounts to products, implementing the relationship between products and discounts.

5) Customers: Stores information about customers of the retail store, including contact details and addresses.

6) Invoices: Records invoices generated for customer purchases, including details like date, party, net amount, and username.

7) Customer_Invoices: Links customers to specific invoices, managing the relationship between customers and their purchase history.

8) Invoice_Items: Contains details of items in each invoice, linking invoices to products.

9) Invoice_Discounts: Links specific discounts to invoices, managing the relationship between invoices and discounts.

10) Savings: Tracks the total savings associated with each invoice.

11) Taxes: Stores information about different taxes applicable to products.

12) Product_Taxes: Links specific taxes to products, managing the relationship between products and taxes.

13) Invoice_Payments: Records payment details for invoices, including payment methods and amounts.

14) Payment_Methods: Contains information about the various payment methods used in the store.

# Table Relationships
1) Customers and Invoices: A customer can have many invoices, but an invoice belongs to only one customer.

2) Invoices and Invoice Items: An invoice can have many items, but an item belongs to only one invoice.

3) Invoices and Invoice Payments: An invoice can have many payments, but a payment belongs to only one invoice.

4) Invoices and Invoice Discounts: An invoice can have many discounts, but a discount belongs to only one invoice.

5) Products and Product Discounts: A product can have many discounts, but a discount belongs to only one product.

6) Products and Product Taxes: A product can have many taxes, but a tax belongs to only one product.

7) Customers and Customer Invoices: A customer can have many customer invoices, and a customer invoice can belong to many customers.
