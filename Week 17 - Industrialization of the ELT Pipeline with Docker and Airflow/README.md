# YouTube ELT Pipeline: Dockerized Airflow & PostgreSQL Data Warehouse

An industrialized, end-to-end Data Engineering pipeline designed to extract data from the YouTube Data API, store it in a multi-layer PostgreSQL Data Warehouse, and orchestrate the entire process using Apache Airflow within a Dockerized environment.

---

## Project Overview

In production, running raw local scripts is not viable. This project replaces manual execution with an enterprise-grade architecture focusing on **portability, reproducibility, automation, and scalability**. 

### Architecture Flow:
1. **Extract:** Fetch YouTube video metrics via the YouTube Data API v3.
2. **Load (Staging):** Ingest raw data into a PostgreSQL staging layer.
3. **Transform (ELT):** Clean and enrich data using SQL directly within PostgreSQL (transforming ISO 8601 durations, creating business variables like `video_type`).
4. **Load (Core):** Implement Upsert logic to push refined data to the analytical production layer.
5. **Orchestrate:** Define dependencies and automate the schedule using an Apache Airflow DAG.

---

## Tech Stack & Tools

* **Orchestration:** Apache Airflow (`CeleryExecutor`)
* **Containerization:** Docker & Docker Compose
* **Database / Data Warehouse:** PostgreSQL (Staging + Core layers)
* **Message Broker:** Redis (for Airflow Celery workers)
* **Language & Libraries:** Python (`psycopg2`, `PostgresHook`)
* **Database Client:** DBeaver
* **Data Source:** YouTube Data API v3

---

## Project Structure

```text
├── dags/               # Airflow DAG definitions (task workflows)
├── logs/               # Containerized Airflow execution logs
├── data/               # Persistent data/volume storage
├── include/            # Custom helper functions, SQL scripts, and logic
├── tests/              # Unit and integration tests
├── .env                # Secure environment variables (ignored by git)
├── Dockerfile          # Custom Airflow image with Python requirements
├── docker-compose.yml  # Multi-container multi-network orchestration configuration
└── requirements.txt    # Python dependencies