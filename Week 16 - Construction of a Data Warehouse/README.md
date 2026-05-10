# Data Warehouse Construction Project
## Medallion Architecture Implementation with T-SQL & Power BI Integration

### Tools Used
*   **Database Engine:** Microsoft SQL Server Management Studio (SSMS) / T-SQL
*   **Interface:** Jupyter Notebook (.ipynb) for SQL scripting and execution
*   **Data Source:** Raw CSV Files
*   **Business Intelligence Tool:** Microsoft Power BI
*   **Architecture:** Medallion Architecture (Bronze, Silver, Gold Layers)

### Summary
This project demonstrates the complete construction of a Data Warehouse, starting from raw CSV files, processing them through a tiered Medallion Architecture within SQL Server, and finally connecting the highly refined data models to Power BI for interactive visualization and dashboarding. 

---

### Project Workflow & Architecture Overview

![Architecture Overview](https://github.com/user-attachments/assets/c78c761d-b1a9-442b-b8cb-a8a936eb08ee)


The pipeline is designed to transform raw data into a structured Star Schema in distinct phases:

#### 1. Data Source
*   **Raw CSV Files:** The workflow begins with raw data provided in CSV format (account, store, store_master, transaction, account_mapping).

#### 2. SSMS - Bronze Layer (Raw Data Ingestion)
*   **Table Creation:** Creation of initial raw tables with schemas designed to ingest data without loss (`NVARCHAR(MAX)`).
*   **Data Insertion:** Using `BULK INSERT` statements to load the raw CSV files directly into the Bronze tables.

#### 3. SSMS - Silver Layer (Cleaning & Organizing)
*   **Table Creation:** Defining highly structured tables with appropriate data types (INT, DECIMAL, DATE) and enforcing relational integrity through Primary and Foreign Keys.
*   **Transformation Procedures:** Writing stored procedures dedicated to cleaning and organizing the data (trimming spaces, handling NULL values, normalizing specific text like 'MARKETING EXP').
*   **Insertion Procedures:** Stored procedures designed to select the cleaned data from the Bronze layer and safely insert it into the Silver tables.

#### 4. SSMS - Gold Layer (Dimensional Modeling / Star Schema)
*   **Table Creation Procedures:** Stored procedures to build the final business-ready tables: specialized Dimension tables (`dim_store`, `dim_account`) and Fact tables (`fact_transaction`).
*   **Data Insertion & Joins:** Implementing stored procedures that perform complex joins across multiple Silver tables to populate the refined Gold dimensions and facts, ensuring the data is structured perfectly for analytics.

#### 5. Power BI Integration (Visualization & Reporting)
*   **SSMS Connection:** Configuring the direct connection between Power BI and the SQL Server database to import the Gold Layer tables.
*   **Data Modeling:** Establishing the relationships between the Fact and Dimension tables within Power BI's model view to recreate the Star Schema.
*   **Data Visualization & Dashboards:** Building interactive visualizations and organizing them into cohesive dashboards to derive actionable business insights from the cleaned and structured data warehouse.
