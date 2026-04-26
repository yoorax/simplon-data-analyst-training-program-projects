# Week 4 – Projet Fin de SaS (London Bike Sharing Migration)

---

## Work Done

- **Data Cleaning Pipeline**
  - Developed a comprehensive data cleaning pipeline in Python (`Pandas_preparation_script.ipynb`) to ingest the raw `london_merged.csv` dataset, inspect data types, handle missing values, and translate technical column names into readable French headers.

- **Data Transformation & Standardization**
  - Transformed numerical categorical codes (like weather conditions and seasons) into descriptive strings, and standardized metrics (like humidity from percentages to decimals) before exporting the clean data to an Excel staging file.

- **Database Migration Script**
  - Engineered a database migration script (`script_megration_postgreSQL.ipynb`) that securely loads credentials via `.env` files and utilizes SQLAlchemy to establish a programmatic connection to a local PostgreSQL database (`velo_entreprise_db`).

- **Automated Data Loading & Verification**
  - Automatically generated the database schema and uploaded all 17,414 rows into a new PostgreSQL table (`london_bikes_final`) using `df.to_sql`, subsequently querying the live database to verify insertion and perform initial aggregations (e.g., total rides by season, weather, and day).

- **Dashboard Development**
  - Connected the newly migrated PostgreSQL database to Power BI to develop a final interactive dashboard (`dashboard_velo_enterprise.pbix`).

---

## Tools & Technologies Used

| Technology | Purpose |
|------------|---------|
| **Python 3** (`Pandas`, `SQLAlchemy`, `python-dotenv`) | Data cleaning, transformation, and database connection |
| **PostgreSQL** (`psycopg2`) | Target relational database |
| **Power BI** | Interactive dashboard and data visualization |
| **Environment Variables (`.env`)** | Secure credential management |

---

## Insights & Results

> Mastered the ETL (Extract, Transform, Load) lifecycle by using Pandas for the "Extract & Transform" phases and SQLAlchemy for the "Load" phase, completely bypassing manual database entry.

- **Type Enforcement:** Discovered how to strictly enforce SQL column data types directly from Python (using `sqlalchemy.types` like DateTime, Integer, String) to prevent type-casting errors during the migration of large datasets.

- **Seamless Reporting:** Successfully executed live SQL analytical queries through a Python backend, returning the aggregated results (e.g., finding that Summer ("Ete") drove 6.4 million rides) back into Pandas DataFrames for seamless reporting.

---

*Complete ETL pipeline delivered: from raw CSV to interactive Power BI dashboard.*