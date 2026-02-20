# Omnichannel dbt Project

This dbt project transforms raw Shopify (online) and Walmart (in-store) sales data in Snowflake into analytics-ready models powering the Omnichannel Sales dashboard.

## Project Purpose

The project standardizes, cleans, and aggregates omnichannel sales data to create unified fact tables and reporting-ready models for the Looker Studio dashboard.

## Data Sources

- Shopify (online sales)
- Walmart (in-store sales)

## Model Structure

- `models/` – Transformation logic (staging, intermediate, and mart models)
- `seeds/` – Static reference data
- `tests/` – Data quality checks
- `snapshots/` – Historical tracking
- `macros/` – Reusable SQL logic
- `analyses/` – Exploration queries

## Warehouse

All models are materialized in Snowflake.

## How to Run
- dbt run
- dbt test
