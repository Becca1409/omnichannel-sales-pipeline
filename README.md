📊 Retail: Omnichannel Sales Pipeline Orchestration

End-to-end data pipeline merging Shopify (online) and Walmart (in-store) sales into a unified analytics-ready analytics model.

🔗 Live Dashboard: https://lookerstudio.google.com/s/pkrTFDFjPBA

🔎 Project Overview

This project builds an integrated Omnichannel Sales Analytics Dashboard that consolidates historical in-store sales data (Walmart, 2010–2012) and online e-commerce sales data (Shopify, 2016–2018) into a unified analytical view.

The goal is to demonstrate end-to-end data integration, transformation, and visualization, enabling data-driven decision-making across multiple sales channels.

The solution combines Snowflake (data warehouse) with Looker Studio (BI dashboard) to deliver an interactive executive overview of sales performance.

🏗 Architecture & Pipeline

Data Layer

Sales fact table stored in Snowflake

Channel attribute integrated (Online / Offline)

Aggregations performed at daily, monthly, and yearly levels

Visualization Layer

Live Snowflake connection in Looker Studio

Interactive filters:

Channel selector (Online / Offline / Both)

Date range control

KPI cards with dynamic recalculation

Automation

Warehouse-connected data source

No manual CSV uploads

Dashboard updates automatically with data refresh

Local work was done in Visual Studio Code, then queries/views were executed in Snowflake and visualized in Looker Studio

📈 Dashboard Components

Omnichannel Overview (main deliverable) – combined executive view with filters

Online Performance (supporting view) – deeper online-only exploration

Offline Store Performance (supporting view) – deeper store-level exploration

1️⃣ KPI Overview

Total Revenue

Average Weekly Revenue

Active Weeks

2️⃣ Revenue Trends

Monthly Revenue Trend

Yearly Revenue Trend

Channel comparison via breakdown dimension

3️⃣ Customer Analysis

Top 10 Customers by Revenue

4️⃣ Store-Level Analysis

Revenue Contribution per Store

Store performance distribution

🔍 Key Insights
🟢 Offline Revenue Dominance

Offline retail historically generated significantly higher revenue (~$6.7bn) compared to online (~$14.8m), revealing structural dependence on physical stores.

🟢 Structural Channel Gap

Offline data spans 2010–2012, while online begins in 2016.
This gap suggests a strategic transition period and highlights late digital adoption.

🟢 Scale Imbalance

The large difference between offline (billions) and online (millions) revenue affects visual comparison, demonstrating the importance of scale interpretation in analytics.

🟢 Revenue Concentration

Online revenue shows concentration among top customers, indicating potential dependency risk and targeted retention opportunities.

🟢 Store Performance Variability

Revenue distribution across stores reveals performance differences that can support benchmarking and operational optimization.

💼 Business Value

This integrated omnichannel view supports:

Pricing strategy optimization through trend visibility

Promotion planning via channel-level comparison

Supply chain alignment based on demand patterns

Strategic digital expansion analysis

The dashboard centralizes fragmented sales data into a single source of truth.

⚠ Limitations

Non-overlapping channel timelines limit direct YoY comparison.

Significant scale differences visually compress online revenue when combined.

Geographic and product-level analysis not yet included.

These constraints were transparently addressed in dashboard design.

🚀 Future Enhancements

To further expand analytical depth:

Geographic revenue segmentation (map-based analysis)

Customer cohort & retention analysis

Product-level drilldown (SKU performance)

Indexed channel growth comparison

Margin-based profitability analysis

🛠 Tools Used

Snowflake

Looker Studio

SQL

Visual Studio Code (local development)

Data modeling concepts

BI dashboard design principles

🎯 Outcome

This project demonstrates the ability to:

Build a structured data pipeline

Integrate multi-channel sales data

Design an interactive executive dashboard

Translate data patterns into business insights

Handle structural data inconsistencies professionally# omnichannel-sales-pipeline


