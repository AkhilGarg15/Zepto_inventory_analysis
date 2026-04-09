# 🛒 Zepto Inventory Data Analysis (SQL Project)

## 📌 Project Overview
This project analyzes inventory data from a Zepto-like e-commerce platform using SQL (PostgreSQL).  
The goal is to extract meaningful business insights related to pricing, discounts, stock availability, and category performance.

---

## 🎯 Objectives
- Perform data exploration on inventory dataset  
- Clean and preprocess raw data  
- Analyze pricing and discount trends  
- Evaluate stock availability  
- Generate business insights using SQL queries  

---

## 🗂️ Database Schema

### Table: `zepto`

| Column Name               | Data Type        | Description |
|--------------------------|-----------------|-------------|
| sku_id                   | SERIAL (PK)     | Unique product ID |
| category                 | VARCHAR(120)    | Product category |
| name                     | VARCHAR(150)    | Product name |
| mrp                      | NUMERIC(8,2)    | Maximum Retail Price |
| discountPercent          | NUMERIC(5,2)    | Discount percentage |
| availableQuantity        | INTEGER         | Available stock |
| discountedSellingPrice   | NUMERIC(8,2)    | Final selling price |
| weightInGms              | INTEGER         | Product weight |
| outOfStock               | BOOLEAN         | Stock availability |
| quantity                 | INTEGER         | Quantity per unit |

---

## 🔍 Data Exploration
- Count total records  
- View sample dataset  
- Identify NULL values  
- List unique categories  
- Analyze in-stock vs out-of-stock products  
- Detect duplicate product names  

---

## 🧹 Data Cleaning
- Removed products with invalid price (MRP = 0)  
- Converted price from paise to rupees  
- Handled missing and inconsistent values  

---

## 📊 Business Insights

### 🔹 Top 10 Best Value Products
- Based on highest discount percentage  

### 🔹 High MRP but Out-of-Stock Products
- Identifies expensive products unavailable in inventory  

### 🔹 Estimated Revenue by Category
- Revenue = Selling Price × Available Quantity  

### 🔹 Premium Products with Low Discount
- MRP > ₹500 and discount < 10%  

### 🔹 Top Categories by Average Discount
- Shows most competitive categories  

### 🔹 Price per Gram Analysis
- Helps identify best-value products  

### 🔹 Product Segmentation by Weight
- Low (< 1kg)  
- Medium (< 5kg)  
- Bulk (> 5kg)  

### 🔹 Total Inventory Weight by Category
- Useful for logistics and warehouse planning  

---

## 🛠️ Tech Stack
- PostgreSQL  
- SQL  

---

## 📈 Key Learnings
- Data cleaning techniques in SQL  
- Writing optimized analytical queries  
- Extracting business insights from raw data  
- Real-world e-commerce data analysis  

---

## 💡 Future Improvements
- Build Power BI dashboard for visualization  
- Perform advanced analysis using Python (Pandas)  
- Automate data pipeline  
- Add real-time inventory tracking  

---

## 👨‍💻 Author
**Akhil Garg**  
B.Tech CSE | Aspiring Data Analyst  
