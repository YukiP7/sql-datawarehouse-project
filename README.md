# 📊 Data Warehouse Project – Medallion Architecture (SQL Server)

## 📌 Project Description
This project demonstrates the **end-to-end implementation of a Data Warehouse** using **SQL Server**, following the **Medallion Architecture** (Bronze, Silver, Gold layers).  
It performs structured, scalable, and reliable **ETL (Extract, Transform, Load)** operations to simulate how modern data warehouses handle data ingestion, transformation, and modeling for analytics and business intelligence (BI) use cases.

The entire pipeline leverages:
- SQL Server
- Stored Procedures
- Bulk Insert Operations
- Structured Data Modeling

This setup mirrors real-world enterprise **data engineering workflows** and modern **data lakehouse** principles.

---

## 🏗️ Architecture Overview – Medallion Approach
**Medallion Architecture** organizes data into three progressive layers:

[Source Data] 

    ↓ Extract
[Bronze Layer] — Raw, unmodified

    ↓ Transform
[Silver Layer] — Cleaned, standardised

    ↓ Load/Model
[Gold Layer] — Analytics & reporting ready


Each layer ensures improved **data quality, traceability, and analytical readiness**.

---

## 🔹 1. Bronze Layer – Raw Data Ingestion

### Purpose
The **Bronze layer** ingests raw data from multiple sources with minimal transformation.  
It acts as the **single source of truth** for all original data.

### Key Activities
- Initialize database and schemas in SQL Server  
- Load raw data from multiple data sources (CSV / flat files)  
- Preserve original data structure and values  
- Perform full-load ingestion using stored procedures  

### Implementation Details
- Created Bronze tables mirroring source data structures  
- Used `BULK INSERT` for fast data loading  
- Developed stored procedures for:
  - Data truncation  
  - Full refresh loads  
  - File-based ingestion  

---

## 🔹 2. Silver Layer – Cleaned & Validated Data

### Purpose
The **Silver layer** transforms raw data into clean, standardized, and analysis-ready datasets.

### Key Activities
- Data cleaning and validation  
- Data transformation  
- Standardization and normalization  

### Transformations Applied
- Handling NULL and missing values  
- Removing duplicates  
- Standardizing formats (dates, text, numbers)  
- Normalizing categorical values  
- Applying business rules and creating derived columns  

### Implementation Details
- Created Silver tables with improved schema design  
- Used **CTEs, views**, and **stored procedures** for transformations  
- Moved only validated, quality-checked data forward  

---

## 🔹 3. Gold Layer – Analytics & Data Modeling

### Purpose
The **Gold layer** provides curated, analytics-ready data optimized for **reporting**, **dashboards**, and **business decisions**.

### Key Activities
- Dimensional modeling (Star / Snowflake schema)  
- Aggregation and KPI creation  
- Building fact and dimension tables  

### Implementation Details
- Created:
  - **Fact tables** → measures, metrics  
  - **Dimension tables** → entities, attributes  
- Designed optimized schemas for:
  - Power BI  
  - Reporting tools  
  - Ad-hoc SQL analysis  

---

## ⚙️ Technology Stack

| Component | Technology | 
|-----------|------------|
| **Database** | SQL Server | 
| **ETL Scripts** | T-SQL Stored Procedures & Scripts | 
| **IDE/Editor** | SQL Server Management Studio (SSMS) |
| **Versioning** | Git / GitHub |
| **Visualization** | Draw.io | 

---

## 🚀 Project Workflow Summary
1. **Database Initialization** (SSMS)
   - Create database and schemas (`bronze`, `silver`, `gold`)
2. **Bronze Layer** (T-SQL Stored Procs)
   - Load raw data from multiple sources using full-load procedures
3. **Silver Layer** (T-SQL Transformations)
   - Clean, validate, and transform the data
4. **Gold Layer** (Dimensional Modeling)
   - Model data into facts and dimensions for analytics
5. **Ready for BI & Reporting**
   - Use datasets in visualization tools (e.g., Power BI)

---


