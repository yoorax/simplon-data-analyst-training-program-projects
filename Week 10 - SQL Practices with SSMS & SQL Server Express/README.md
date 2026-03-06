# 🏥 Exploration and Analysis of Hospital Billing Data with SQL

## 📋 Project Overview

This project analyzes the complete flow of a patient in a hospital environment — from **care received** to **billing**, **insurance payments**, and **account adjustments** — using SQL Server. The goal is to develop SQL skills applied to real healthcare data while understanding the financial workflow within a hospital system.

---

## 🎯 Objectives

- **Understand data relationships** in a real-world healthcare context
- **Master relational database creation** and management (tables, primary keys, foreign keys)
- **Apply SQL** for data exploration, analysis, and aggregation
- **Develop analytical reasoning** on hospital financial flows (charges → payments → adjustments)

---

## 🗃️ Database Schema

The database follows a **star schema** design with **1 Fact Table** at the center and **8 Dimension Tables** around it.

### Fact Table

| Column             | Type           | Description                    |
|--------------------|----------------|--------------------------------|
| `FactTablePK`      | INT (PK)       | Primary key                    |
| `dimPatientPK`     | INT (FK)       | Link to patient dimension      |
| `dimPhysicianPK`   | INT (FK)       | Link to physician dimension    |
| `dimDatePostPK`    | INT (FK)       | Link to post date dimension    |
| `dimDateServicePK` | INT            | Service date key               |
| `dimCPTCodePK`     | INT (FK)       | Link to CPT code dimension     |
| `dimPayerPK`       | INT (FK)       | Link to payer dimension        |
| `dimTransactionPK` | INT (FK)       | Link to transaction dimension  |
| `dimLocationPK`    | INT (FK)       | Link to location dimension     |
| `dimDiagnosisCodePK` | INT (FK)     | Link to diagnosis dimension    |
| `PatientNumber`    | INT            | Patient identifier             |
| `CPTUnits`         | INT            | Number of CPT units            |
| `GrossCharge`      | DECIMAL(10,2)  | Total charge amount            |
| `Payment`          | DECIMAL(10,2)  | Payment received               |
| `Adjustment`       | DECIMAL(10,2)  | Adjustment amount              |
| `AR`               | DECIMAL(10,2)  | Accounts Receivable balance    |

### Dimension Tables

| Table               | Key Columns                                           | Description                          |
|---------------------|-------------------------------------------------------|--------------------------------------|
| `dimPatient`        | PatientNumber, FirstName, LastName, PatientGender, PatientAge, Email, City, State | Patient demographics       |
| `dimPhysician`      | ProviderNpi, ProviderName, ProviderSpecialty, ProviderFTE | Physician/provider information |
| `dimDate`           | Year, Month, Day                                      | Calendar date dimension              |
| `dimCptCode`        | CptCode, CptDesc, CptGrouping                        | CPT procedure codes                  |
| `dimPayer`          | Payer information                                     | Insurance payer details              |
| `dimTransaction`    | TransactionType, Transaction, AdjustmentReason        | Financial transaction types          |
| `dimLocation`       | LocationName                                          | Hospital location names              |
| `dimDiagnosisCode`  | DiagnosisCode, DiagnosisCodeDescription, DiagnosisCodeGroup | ICD diagnosis codes          |

---

## 🔧 Project Stages

### Stage 1 — Database Preparation
Created the hospital database and defined all 9 tables (1 Fact + 8 Dimensions) with appropriate data types and constraints.

> **Script:** [`FactTableCreation.sql`](SQL_Scripts/FactTableCreation.sql)

### Stage 2 — Data Import
Loaded data from CSV files (originally exported from an Excel workbook via VBA macro) into SQL Server using `BULK INSERT` statements.

> **Script:** [`data_Import_dimDate.sql`](SQL_Scripts/data_Import_dimDate.sql)  
> **VBA Macro:** [`VBA_Macro_xslx_workbook_to_worksheets_CSV.VBA`](Data_CSV/VBA_Macro_xslx_workbook_to_worksheets_CSV.VBA)

### Stage 3 — Constraints & Relationships
Defined **primary keys** on all tables and **8 foreign key constraints** on the Fact Table linking to each dimension, with `ON DELETE CASCADE` for referential integrity.

### Stage 4 — Data Exploration
Performed simple `SELECT` queries to understand table structures, identify important columns, and verify data integrity after import.

### Stage 5 — Data Joining
Executed multi-table joins to trace a patient's full journey through the hospital system. Five comprehensive join queries were written covering:

1. **Patient information** — full demographic and clinical view
2. **Patient dates** — post dates and service dates
3. **Physician charges** — provider details with financial metrics
4. **Diagnosis & CPT codes** — clinical coding relationships
5. **Transactions, payments & adjustments** — the financial flow

> **Script:** [`Partie5_jointures.sql`](SQL_Scripts/Partie5_jointures.sql)

### Stage 6 — SQL Analysis Queries
Answered specific business questions using SQL with joins, aggregations, and analytical functions.

> **Script:** [`queries.sql`](SQL_Scripts/queries.sql)

---

## 📊 SQL Analysis Queries & Results

### Query 1 — Count rows where GrossCharge > $100
```sql
SELECT COUNT(FactTablePK) AS RowsCount
FROM FactTable
WHERE GrossCharge > 100;
```
**Purpose:** Identifies the volume of high-value charge transactions in the hospital, filtering for charges exceeding $100.

---

### Query 2 — Count distinct patients
```sql
SELECT COUNT(DISTINCT PatientNumber) AS PatientCount
FROM FactTable;
```
**Purpose:** Determines the total number of unique patients in the database, useful for understanding patient base size.

---

### Query 3 — CPT codes per group
```sql
SELECT COUNT(DISTINCT CptCode) AS CPTCodeCount,
       CptGrouping
FROM dimCptCode
GROUP BY CptGrouping
ORDER BY CPTCodeCount DESC;
```
**Purpose:** Breaks down CPT procedure codes by their grouping category, showing which medical service groups have the most coded procedures.

---

### Query 4 — Physicians with at least one Medicare claim
```sql
SELECT dimPhy.ProviderName,
       COUNT(dimT.TransactionType) AS "Claim"
FROM FactTable FT
JOIN dimTransaction dimT ON dimT.dimTransactionPK = FT.dimTransactionPK
JOIN dimPhysician dimPhy ON dimPhy.dimPhysicianPK = FT.dimPhysicianPK
WHERE TransactionType = 'charge'
GROUP BY ProviderName
HAVING COUNT(dimT.TransactionType) >= 1
ORDER BY "Claim" DESC;
```
**Purpose:** Lists all physicians who have submitted at least one charge-type transaction, ordered by the number of claims. This helps identify the most active billing physicians.

---

### Query 5 — CPT codes with over 100 units
```sql
SELECT dimCC.CptCode,
       FT.CPTUnits
FROM FactTable FT
JOIN dimCptCode dimCC ON dimCC.dimCPTCodePK = FT.dimCPTCodePK
WHERE CPTUnits > 100
ORDER BY CPTUnits ASC;
```
**Purpose:** Identifies high-volume CPT codes where more than 100 units were recorded, which could indicate high-demand procedures or potential data anomalies.

---

### Query 6 — Medical specialty with monthly payments
```sql
SELECT dimPhy.ProviderSpecialty,
       dimD.Year,
       dimD.Month,
       SUM(FT.Payment) AS TotalMonthlyPayments
FROM FactTable FT
JOIN dimPhysician dimPhy ON dimPhy.dimPhysicianPK = FT.dimPhysicianPK
JOIN dimTransaction dimT ON dimT.dimTransactionPK = FT.dimTransactionPK
JOIN dimDate dimD ON dimD.dimDatePostPK = FT.dimDatePostPK
WHERE dimT.TransactionType = 'Payment'
GROUP BY dimPhy.ProviderSpecialty, dimD.Year, dimD.Month
ORDER BY dimPhy.ProviderSpecialty, dimD.Year, dimD.Month;
```
**Purpose:** Provides a detailed monthly breakdown of total payments received per medical specialty, filtered to only payment-type transactions. This reveals revenue trends across specialties over time.

---

### Query 7 — CPT units for diagnoses containing the letter "J"
```sql
SELECT dimDC.DiagnosisCode,
       dimDC.DiagnosisCodeDescription,
       COUNT(FT.CPTUnits) AS "Total CPTUnits"
FROM FactTable FT
JOIN dimDiagnosisCode dimDC ON dimDC.dimDiagnosisCodePK = FT.dimDiagnosisCodePK
WHERE dimDC.DiagnosisCode LIKE '%J%'
GROUP BY dimDC.DiagnosisCode, dimDC.DiagnosisCodeDescription
ORDER BY "Total CPTUnits" DESC;
```
**Purpose:** Targets diagnosis codes containing "J" (commonly associated with respiratory diseases in ICD-10 classification) and counts the associated CPT units, helping analyze the workload tied to respiratory care.

> **Note:** `COUNT(FT.CPTUnits)` counts the number of rows rather than summing the unit values. Using `SUM(FT.CPTUnits)` would give the total units instead.

---

### Query 8 — Patient demographic report with age categorization
```sql
SELECT PatientNumber,
       FirstName + ' ' + LastName AS "Patient Full Name",
       CASE
           WHEN PatientAge <= 18 THEN 'Young Patient'
           WHEN PatientAge > 18 AND PatientAge <= 65 THEN 'Adult Patient'
           WHEN PatientAge > 65 THEN 'Old Patient'
       END AS AgeCategorie,
       PatientAge,
       Email,
       City + ', ' + State AS "Patient Address"
FROM dimPatient
ORDER BY PatientAge DESC;
```
**Purpose:** Generates a comprehensive patient profile report that classifies each patient into one of three age groups:
- **Young Patient:** ≤ 18 years
- **Adult Patient:** 19–65 years
- **Old Patient:** > 65 years

This demographic segmentation supports population health analysis and targeted care planning.

---

### Query 9 — Analysis of charges and payments by physician and transaction type
*(To be completed — this query will analyze the financial flow per physician, breaking down gross charges, payments, and adjustments by transaction type to provide a full picture of each provider's revenue cycle.)*

---

## 📁 Project Structure

```
week 10 - SQL SERVER/
├── Data_CSV/
│   ├── FactTable.csv                                    # Main fact table data
│   ├── dimPatient.csv                                   # Patient demographics
│   ├── dimPhysician.csv                                 # Physician information
│   ├── dimDate.csv                                      # Calendar dates
│   ├── dimCptCode.csv                                   # CPT procedure codes
│   ├── dimPayer.csv                                     # Insurance payer data
│   ├── dimTransaction.csv                               # Transaction types
│   ├── dimLocation.csv                                  # Hospital locations
│   ├── dimDiagnosisCode.csv                             # Diagnosis codes (ICD)
│   └── VBA_Macro_xslx_workbook_to_worksheets_CSV.VBA   # Excel-to-CSV export macro
│
├── SQL_Scripts/
│   ├── FactTableCreation.sql      # Table creation with PK/FK constraints
│   ├── data_Import_dimDate.sql    # BULK INSERT data import statements
│   ├── Partie5_jointures.sql      # Multi-table JOIN queries (patient journey)
│   └── queries.sql                # 9 analytical SQL queries
│
└── README.md                      # This report
```

---

## 🛠️ Tools & Technologies

| Tool            | Usage                                             |
|-----------------|---------------------------------------------------|
| **SQL Server**  | Database engine for creating and querying the database |
| **T-SQL**       | SQL dialect used for all queries and DDL           |
| **Excel**       | Original data source (Dataset.xlsx)                |
| **VBA Macro**   | Automated export of Excel worksheets to CSV format |
| **BULK INSERT** | High-performance data loading from CSV into SQL Server |

---

## 📌 Key Takeaways

1. **Star schema design** is effective for hospital data — the central Fact Table connects all dimensions (patient, physician, date, CPT, payer, transaction, location, diagnosis).
2. **JOIN operations** are essential to reconstruct the full patient journey from fragmented dimension tables.
3. **Aggregation functions** (`COUNT`, `SUM`, `GROUP BY`, `HAVING`) enable powerful business insights from raw transactional data.
4. **CASE expressions** allow dynamic categorization of patients directly within SQL queries.
5. **Financial flow analysis** (Charge → Payment → Adjustment → AR) provides visibility into the hospital's revenue cycle.

---

## 👤 Author

**Rachid** — Data Analyst Student  
*Week 10 — SQL Server Module*
