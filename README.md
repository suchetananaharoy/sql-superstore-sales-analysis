# 📊 SQL Superstore Sales Analysis

## 🧠 Project Overview
This project is an end-to-end **SQL analysis** performed on the **Sample Superstore dataset** using **SQL Server Management Studio (SSMS)**.  
The goal of this project is to strengthen SQL fundamentals while applying them to real-world business scenarios such as sales performance, profitability, discount impact, and customer segmentation.

This repository serves as:
- 📘 A **hands-on SQL learning project**
- 💼 A **job-ready portfolio project** for SQL/Data Analyst interviews

---

## 🎯 Project Objectives
- Practice **core to advanced SQL concepts** using SQL Server
- Analyze **sales, profit, and discount patterns**
- Build **business KPIs** using SQL queries
- Write **clean, readable, and interview-ready SQL**
- Understand how SQL supports **data-driven business decisions**

---

## 🗂 Dataset Information
- **Dataset Name:** Sample Superstore
- **Source:** Kaggle
- **Domain:** Retail / Sales Analytics
- **Data Type:** Transactional sales data

### 📌 Key Columns Used
- Ship Mode  
- Segment  
- Country  
- City  
- State  
- Postal Code  
- Region  
- Category  
- Sub-Category  
- Sales  
- Quantity  
- Discount  
- Profit  

---

## 🛠 Tools & Technologies
- **SQL Server**
- **SQL Server Management Studio (SSMS)**
- **T-SQL**
- CSV dataset imported into SQL Server

---

## 🧩 SQL Concepts Covered

### 🔹 Basic SQL
- `SELECT`, `WHERE`, `ORDER BY`
- `DISTINCT`
- Data filtering and sorting

### 🔹 Aggregation & Grouping
- `SUM`, `AVG`, `COUNT`
- `GROUP BY`, `HAVING`
- Sales and profit KPIs

### 🔹 Business Analysis
- Region-wise and category-wise sales
- Profit and loss analysis
- Discount impact on profitability

### 🔹 Advanced SQL
- `CASE WHEN` for business logic
- Subqueries
- `NULLIF` for defensive SQL coding
- Common Table Expressions (CTEs)
- Window functions:
  - `RANK()`
  - Running totals using `OVER()`

---

## 📊 Key Analyses Performed
- ✅ Total sales and profit by region
- ✅ Category and sub-category performance analysis
- ✅ Profit margin calculation
- ✅ Identification of loss-making categories and cities
- ✅ Impact of discounts on profit
- ✅ Ranking regions by profitability
- ✅ Running total of sales using window functions
- ✅ Segment-wise sales and profit analysis

---

## 📈 Sample Business KPI
### Profit Margin (%)
```sql
ROUND(
    (SUM(Profit) / NULLIF(SUM(Sales), 0)) * 100,
    2
) AS Profit_Margin_Percentage

```
## 🚀 How to Use This Project

1. Download the **Sample Superstore** dataset from Kaggle  
2. Import the CSV file into **SQL Server**  
3. Open **SQL Server Management Studio (SSMS)**  
4. Run the SQL queries provided in the `queries` folder  
5. Modify queries to explore additional insights  
6. Practice explaining query logic for interview preparation  

---

## 📌 Future Enhancements

- Build **Power BI dashboards** using SQL query outputs  
- Add **indexing and performance optimization** techniques  
- Create **SQL views and stored procedures**  
- Include **time-based trend analysis** for deeper insights  
