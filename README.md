# Supermarket Database Overview
This repository contains SQL scripts for creating and populating a retail store database using a top-down approach. The database is designed to manage and track various aspects of a retail store, including products, customers, invoices, discounts, taxes, and more.

# Database Schema
The database schema consists of 13 tables, each playing a specific role in the store’s operations:

Categories: Stores information about different product categories in the store.

Products: Contains data about the products available for sale, including their prices and categories.

Discounts: Holds information about various discounts available in the store.

Product_Discounts: Links specific discounts to products, implementing the relationship between products and discounts.

Customers: Stores information about customers of the retail store, including contact details and addresses.

Invoices: Records invoices generated for customer purchases, including details like date, party, net amount, and username.

Customer_Invoices: Links customers to specific invoices, managing the relationship between customers and their purchase history.

Invoice_Items: Contains details of items in each invoice, linking invoices to products.

Invoice_Discounts: Links specific discounts to invoices, managing the relationship between invoices and discounts.

Savings: Tracks the total savings associated with each invoice.

Taxes: Stores information about different taxes applicable to products.

Product_Taxes: Links specific taxes to products, managing the relationship between products and taxes.

Invoice_Payments: Records payment details for invoices, including payment methods and amounts.

Payment_Methods: Contains information about the various payment methods used in the store.

# Table Relationships
Categories: One-to-many relationship with Products.
Products and Discounts: Many-to-many relationship, managed via the Product_Discounts table.
Products and Taxes: Many-to-many relationship, managed via the Product_Taxes table.
Invoices and Customers: One-to-many relationship, managed via the Customer_Invoices table.
Invoices and Products: Many-to-many relationship, managed via the Invoice_Items table.
Invoices and Discounts: Many-to-many relationship, managed via the Invoice_Discounts table.
Invoices and Payments: One-to-many relationship, managed via the Invoice_Payments table.
Invoices and Savings: One-to-one relationship, tracking the total savings per invoice.
Payment Methods: Linked to Invoice_Payments, providing information on how payments were made.
