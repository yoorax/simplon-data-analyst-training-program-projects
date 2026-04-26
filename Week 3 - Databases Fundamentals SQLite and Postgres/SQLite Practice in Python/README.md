# Week 3 – SQLite Practice in Python

---

## Work Done

- **Database Design & Construction**
  - Designed and built a complete Library Management System database (`bibliotheque.db`) from scratch using SQLite, consisting of five interconnected tables (`auteurs`, `genre`, `livres`, `emprunteurs`, `emprunts`).

- **Database Initialization & Population**
  - Executed full database initialization within Jupyter Notebooks, writing DDL queries for table creation (with foreign key constraints) and DML queries to populate the database with synthetic book/borrower data.

- **Analytical Querying**
  - Performed analytical SQL queries to track library metrics, such as identifying overdue books, listing the most popular genres, finding "VIP" borrowers with multiple loans, and displaying currently available inventory, returning the results directly into Pandas DataFrames.

- **Backend Automation Script**
  - Engineered a standalone backend Python script (`automated_reminder.py`) that queries the SQLite database for overdue books and uses the `smtplib` library to automatically dispatch email warnings to late borrowers.

---

## Files Reviewed & Edited

| File | Action |
|------|--------|
| `README.md` | Edited |
| `.gitignore` | Viewed & Edited (lines 1-3) |
| `automated_reminder.py` | Viewed (lines 1-66) |
| `database_schema.dbml` | Viewed (lines 1-46) |
| `email_remainder_test.ipynb` | Viewed (lines 1-401) |
| `step_1.ipynb` | Viewed (lines 1-84) |
| `step_2.ipynb` | Viewed (lines 1-316) |
| `step_3.ipynb` | Viewed (lines 1-467) |

---

## Tools & Technologies Used

| Technology | Purpose |
|------------|---------|
| **Python 3** (`sqlite3`, `smtplib`, `Pandas`) | Core scripting, database interaction, and email automation |
| **SQLite** | Lightweight relational database engine |
| **DBML** | Database schema design and visualization |
| **Environment Variables (`.env`)** | Secure credential management |

---

## Insights & Results

> Mastered the integration of Python and SQL, proving that lightweight databases like SQLite can effectively act as the backend for fully functional, automated Python applications.

- **Security Best Practice:** Learned the importance of abstracting sensitive credentials out of source code by utilizing `.env` files for the email automation script.

- **Key Discovery:** Querying a database directly into a Pandas DataFrame provides an extremely powerful and readable format for end-user reporting compared to raw SQL tuple outputs.

---

*Practical database-to-application pipeline successfully implemented.*