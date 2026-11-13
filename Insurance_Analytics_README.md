# Insurance Analytics Project

An end-to-end insurance analytics project that turns raw customer and policy data into dashboards and KPIs using **SQL, Microsoft Excel, Power BI and Tableau**, with the findings summarised in a final presentation.

The project covers customer demographics, policy mix, policy status, coverage, premiums, premium growth and policy end trends. The same business requirements (KPI 2 to KPI 22) were solved in all four tools.

---

## Table of Contents

1. [Problem Statement](#problem-statement)
2. [Objectives](#objectives)
3. [Repository Contents](#repository-contents)
4. [Dataset](#dataset)
5. [Tools Used](#tools-used)
6. [Project Components](#project-components)
7. [Key Findings](#key-findings)
8. [Recommendations](#recommendations)
9. [Future Scope](#future-scope)
10. [How to Use This Repository](#how-to-use-this-repository)
11. [Team](#team)

---

## Problem Statement

Insurance companies deal with large amounts of customer and policy data, but raw data alone makes it hard to:

- Handle the large volume of insurance data
- Identify key policy and customer trends
- Get visibility into premium and policy performance
- Make faster, data-driven decisions

## Objectives

- Analyze customer and policy counts, and the age and gender mix
- Compare policy types by volume, coverage and premium
- Track policy status (active, lapsed, terminated) and the active to inactive ratio
- Measure year-on-year premium growth
- Monitor policy end trends and total claim amount
- Build interactive dashboards that support data-driven decisions

---

## Repository Contents

| File | Description |
|------|-------------|
| `Insurance_Analytics_Excel_Dashboard.xlsx` | Excel workbook with the full dataset (5 tables), pivot-based KPI calculations (KPI 2 to KPI 21) and an interactive dashboard with slicers |
| `Insurance_Analytics_PowerBI_Dashboard.pbix` | Power BI report with a main interactive dashboard and a separate page for each KPI |
| `Insurance_Analytics_Tableau_Dashboard.twbx` | Tableau packaged workbook with KPI worksheets (KPI 2 to KPI 22) built on the insurance data |
| `Insurance_Analytics_SQL_Queries.sql` | SQL queries calculating KPI 2 to KPI 22 (MySQL syntax) |
| `Insurance_Analytics_Final_Presentation.pptx` | Final 10-slide project presentation covering insights, trends and recommendations |

> Suggested folder layout: put each tool's file in its own folder (`Excel/`, `PowerBI/`, `Tableau/`, `SQL/`, `Presentation/`).

---

## Dataset

The data is a relational insurance dataset of **5,000 customers and 5,000 policies**, stored as 5 tables in the Excel workbook.

| Table | Rows | What it holds |
|-------|-----:|---------------|
| `Customer Information` | 5,000 | Customer ID, name, gender, age, occupation, marital status, address and age group |
| `Policy Details` | 5,000 | Policy type, coverage amount, premium amount, start and end dates, payment frequency, status and customer ID |
| `Claims` | 5,000 | Claim ID, claim date, claim amount, claim status, reason, settlement date and policy ID |
| `Payment History` | 5,000 | Payment ID, payment date, amount paid, payment method, payment status and policy ID |
| `Additional Fields` | 5,000 | Agent ID, renewal status, policy discounts, risk score and policy ID |

**Relationships:** `Customer ID` links Customer Information to Policy Details. `Policy ID` links Policy Details to Claims, Payment History and Additional Fields.

**Derived columns (Excel):** Age Group, Start Year, End Year and an Active / Inactive flag.

---

## Tools Used

| Tool | Purpose |
|------|---------|
| **SQL (MySQL)** | KPI calculation directly from the relational tables |
| **Microsoft Excel** | Data analysis, pivot tables, KPI calculations, slicer-driven dashboard |
| **Power BI** | Interactive dashboard with KPI cards, charts and a year slicer, plus one page per KPI |
| **Tableau** | KPI worksheets built on the Excel data source |
| **PowerPoint** | Final presentation of insights and recommendations |

---

## Project Components

### 1. SQL: KPI Queries (`Insurance_Analytics_SQL_Queries.sql`)

21 KPIs calculated using joins, CTEs, window functions (`LAG`), conditional aggregation, date functions and `ORDER BY ... LIMIT` rankings.

| # | KPI | # | KPI |
|---|-----|---|-----|
| 2 | Total customers | 13 | Gender with the most policies |
| 3 | Total policies | 14 | Male vs Female policy difference |
| 4 | Total claim amount | 15 | Policy type with the most policies |
| 5 | Average coverage amount by policy type | 16 | Policy type with the fewest policies |
| 6 | Average premium amount by policy type | 17 | Health vs Auto policy difference |
| 7 | Active policy percentage | 18 | Total policies by policy type |
| 8 | Policy count by status | 19 | Average premium growth rate |
| 9 | Highest policy status | 20 | Premium growth rate by year |
| 10 | Active : Inactive ratio | 21 | Highest vs lowest growth rate difference |
| 11 | Age group with the most policies | 22 | Policies ending per year |
| 12 | Top 3 age groups by policies | | |

### 2. Excel Dashboard (`Insurance_Analytics_Excel_Dashboard.xlsx`)

- 7 pivot-based KPI sheets (KPI 2-4, 7-10, 11-12, 13-14, 15-18, 19-20 and 21, hidden behind the dashboard)
- Interactive **Dashboard** sheet with 11 charts and slicers for **Status, Gender and Start Year**
- Covers customers, policies, claim amount, coverage and premium by policy type, active percentage, status split, age and gender mix, policy type ranking, premium growth and policy end trend

### 3. Power BI Dashboard (`Insurance_Analytics_PowerBI_Dashboard.pbix`)

- Main dashboard with **12 KPI cards** and a Year slicer
- Charts: donut, pie, treemap, clustered bar, column, line and a combo chart (columns with a line)
- 22 additional pages, one for each KPI view
- Bookmarks for navigation

### 4. Tableau Dashboard (`Insurance_Analytics_Tableau_Dashboard.twbx`)

- 21 KPI worksheets (KPI 2 to KPI 22) built on the five-table Excel data source
- Packaged workbook, so the data is included

### 5. Final Presentation (`Insurance_Analytics_Final_Presentation.pptx`)

10 slides: title, project overview and tools, business problem and vision, key KPIs, major insights, cross-platform comparison, key trends and growth analysis, premium growth trend, conclusion and thank you.

---

## Key Findings

**Customers and policies**
- Total customers: **5,000**
- Total policies: **5,000**
- Total claim amount: **251,378,846**

**Policy status**
- Active policies: **33.64%** (1,682 of 5,000)
- Terminated: 1,678 and Lapsed: 1,640
- Active : Inactive ratio: **0.51 : 1**

**Policy mix**
- Policies by type: Health **1,316**, Property 1,236, Life 1,234, Auto 1,214
- Health has **102 more policies** than Auto
- Average coverage amount: **254,563**
- Average premium amount: **1,052** (Life 1,085, Property 1,058, Health 1,036, Auto 1,030)

**Customers**
- The oldest age band holds the most policies (**61+** in Excel, **65+** in the SQL age bucketing)
- Policies by gender: Other 1,699, Male 1,677, Female 1,624, so the Male vs Female difference is **53**

**Premium growth trend**
- Average premium peaked in **2014 at about 1,216** and fell to about **991 in 2024**
- Highest year-on-year growth: **+4.79% in 2022**
- Growth turned negative in **2023 (-6.63%)** and **2024 (-3.98%)**
- Policy endings rise steadily to a peak and then decline

---

## Recommendations

- Improve customer retention through targeted engagement strategies
- Strengthen renewal campaigns to reduce policy losses
- Focus on high-performing policy segments to maximize premium potential
- Monitor premium growth trends and take corrective action during declining periods
- Use data-driven insights for better customer targeting and business decisions
- Build interactive dashboards for faster performance monitoring

## Future Scope

- Build predictive models to identify policies at risk of lapsing
- Analyze claims by policy type, claim status and reason
- Study payment behavior and renewal status using the Payment History and Additional Fields tables
- Use risk score and policy discounts to refine pricing and segmentation
- Track progress against premium and retention targets over time

---

## How to Use This Repository

| File | How to open |
|------|-------------|
| `.xlsx` | Microsoft Excel (the Dashboard sheet is the last tab) |
| `.pbix` | Power BI Desktop (free from Microsoft) |
| `.twbx` | Tableau Desktop or Tableau Public (packaged workbook, data included) |
| `.sql` | MySQL Workbench or any MySQL client. Load the tables from the Excel workbook first (one table per sheet, named `customerinfo`, `policydetails` and `claims`), then run each KPI query |
| `.pptx` | Microsoft PowerPoint or Google Slides |

---

## Team

Created by: **Bhargav M**

---

*If you found this project useful, feel free to star the repository.*
