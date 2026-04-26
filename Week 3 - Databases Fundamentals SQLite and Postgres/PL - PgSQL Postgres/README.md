# Week 3 – PL/pgSQL Postgres Challenges

---

## Work Done

- **Database Architecture**
  - Engineered a complete relational database structure (Customers, Products, Orders, Order_Items) using PostgreSQL Data Definition Language (DDL).

- **Advanced Query Development**
  - Progressed from basic queries to advanced analytical SQL, utilizing complex JOINs (Inner, Left, Outer) to identify specific business scenarios, such as customers who have never placed an order.

- **Aggregations & Grouping**
  - Mastered SQL Aggregations and Grouping functions (SUM, COUNT, AVG, GROUP BY) to calculate key metrics like Total Revenue per Customer and Average Monthly Sales.

- **Dynamic Subqueries**
  - Implemented nested subqueries to dynamically filter data (e.g., finding customers with order totals higher than the global average).

- **Database Abstraction**
  - Created persistent database VIEWs (e.g., `monthly_sales_view`) to abstract complex queries for easier reporting and repeated access.

---

## Tools & Technologies Used

| Technology | Purpose |
|------------|---------|
| **PostgreSQL (PL/pgSQL)** | Relational database engine and procedural language |
| **SQL (DDL, DML, DQL, DCL)** | Full spectrum of database operations |
| **Relational Database Management Concepts** | Schema design, referential integrity, and query optimization |

---

## Insights & Results

> Mastered the concept of Referential Integrity by initially struggling with restricted deletions (Parent-Child tracking), before resolving it by altering tables to use `ON DELETE CASCADE`.

- **Reporting Efficiency:** Discovered that utilizing VIEWs significantly simplifies front-end reporting by pre-compiling complex joins and aggregations into a single callable virtual table.

- **Dynamic Filtering:** Gained a deep understanding of how SQL subqueries act as dynamic variables, allowing for much more flexible and powerful filtering compared to hard-coded values.

---

*Database design and advanced query skills solidified through hands-on PostgreSQL challenges.*