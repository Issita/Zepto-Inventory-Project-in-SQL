# 🛒 Zepto Product Data Analysis (PostgreSQL)

This project involves data exploration, plus cleaning, also analysis because we use PostgreSQL on the Zepto product dataset. It features key SQL abilities. Those skills do include querying and filtering and aggregation and basic data transformations.

---
## 📌 Project Overview  
- [Project Overview](#project-overview)
- [Database Schema](#database-schema)
- [Steps Covered](#steps-covered)
- [Data Exploration Under](#1-data-exploration)
- [Data Cleaning](#2-data-cleaning)
- [Business Perceptions from](#3-business-perceptions---queries)
- [Use Cases Sample](#sample-use-cases)
- [Requirements](#requirements)
- [Author](#author)

---

This SQL project explored a product inventory database from Zepto, a quick commerce company. The tasks include:
- Schema creation
- Data exploration
- Data cleaning
- Key business perceptions can be derived by analysts.

## 🗃️ Database Schema

Table: `zepto`

| Column Name            | Data Type     | Description                       |
|------------------------|---------------|-----------------------------------|
| zep_id                 | serial        | Primary Key (unique ID)          |
| category               | varchar(120)  | Product category                 |
| name                   | varchar(150)  | Product name                     |
| mrp                    | numeric(8,2)  | Maximum retail price             |
| discountPercent        | numeric(5,2)  | Discount in percent              |
| availableQuantity      | integer       | Number of units in inventory     |
| discountedSellingPrice | numeric(8,2)  | Final price after discount       |
| weightInGms            | integer       | Weight of product in grams       |
| outOfStock             | boolean       | Availability flag                |
| quantity               | integer       | Purchase quantity (may be user input)|

---

## 📊 Steps Covered

### 1. Data Exploration

- Count of total rows
- View of sample rows
- Checking for null values
- Listing all unique categories
- Stock status summary
- Identifying duplicate product names

### 2. Data Cleaning

- Detecting and deleting products with `mrp = 0`
- Converting prices from paisa to rupees
- Reviewing cleaned data

### 3. Business Insights & Queries

- 🔟 Top 10 best-value products (highest discounts)
- 💰 Total estimated revenue per category
- ❌ High MRP products that are out of stock
- 🎯 Products with MRP > ₹500 and discount < 10%
- 🏆 Top 5 categories by average discount
- ⚖️ Price per gram for products (100g+)
- 🧱 Weight category classification (`Low`, `Medium`, `High`)
- 📦 Total inventory weight per category

---
## 💡 Sample Use Cases

- **Inventory Managers** can use weight and stock status to prioritize logistics.
- **Pricing Analysts** can track discount patterns and revenue estimates.
- **Business Teams** can identify top-value products and underperforming categories.

---

## 🛠 Requirements

- PostgreSQL (v12 or above)
- SQL client (DBeaver, pgAdmin, or CLI)
- Dataset compatible with `zepto` table schema

---

## 👩‍💻 Author

**Issita Priyadarsini**

---
