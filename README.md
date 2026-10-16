# Business Performance Analysis for an E-Commerce Retailer

An end-to-end data analytics project using **SQL Server** and **Power BI** to assess e-commerce sales performance, explore customer and product trends, and communicate business insights through an interactive dashboard.

## Table of Contents

- [Project Overview](#project-overview)
- [Business Problem](#business-problem)
- [Project Objectives](#project-objectives)
- [Dataset](#dataset)
- [Data Quality Assessment](#data-quality-assessment)
- [Business Questions](#business-questions)
- [Analysis and Dashboard](#analysis-and-dashboard)
- [Key Findings](#key-findings)
- [Business Recommendations](#business-recommendations)
- [Assumptions and Limitations](#assumptions-and-limitations)
- [Tools and Technologies](#tools-and-technologies)
- [Project Files](#project-files)

## Project Overview

An e-commerce retailer has customer and order data covering **2024–2026**. This project uses SQL to validate the data and answer business questions, then uses Power BI to present the results in an interactive dashboard.

The goal is to move from raw transactional data to practical findings about revenue trends, product performance, customer purchasing behavior, and geographic sales.

## Business Problem

The business has transactional data but lacks a structured view of how sales are performing across time, products, customers, and countries. Management needs evidence-based insights to understand current performance and identify areas worth investigating for growth.

## Project Objectives

- Validate data quality before conducting business analysis.
- Examine revenue and order trends over time.
- Compare sales performance across product categories and products.
- Understand customer-level purchasing patterns.
- Compare sales performance across countries.
- Build an interactive Power BI dashboard.
- Translate findings into practical, data-informed recommendations.

## Dataset

The analysis uses two related tables.

### Customers

| Column | Description |
|---|---|
| `customer_id` | Unique customer identifier |
| `first_name` | Customer's first name |
| `last_name` | Customer's last name |
| `country` | Customer's country |
| `state` | Customer's state |
| `city` | Customer's city |
| `score` | Customer score used for segmentation; some values are missing |

### Orders

| Column | Description |
|---|---|
| `order_id` | Unique order identifier |
| `order_date` | Date of purchase |
| `customer_id` | Customer who placed the order |
| `product_name` | Purchased product |
| `product_category` | Product category |
| `quantity` | Quantity purchased |
| `sales` | Sales amount recorded for the order |

The relationship is one-to-many: a customer can have multiple orders, and `customer_id` connects the two tables.

## Data Quality Assessment

Data quality checks were performed before interpreting business results.

| Check | Result | Status |
|---|---:|---|
| Duplicate customer IDs | 0 | Pass |
| Duplicate order IDs | 0 | Pass |
| Missing values outside the customer `score` field | 0 | Pass |
| Missing customer scores | Present | Expected; review when using score |
| Orders without a matching customer | 0 | Pass |
| Customers without orders | 0 | Pass |
| Zero or negative sales values | 0 | Pass |
| Zero or negative quantity values | 0 | Pass |
| Order date coverage | 2024–2026 | Valid for the intended analysis period |

**Assessment summary:** The documented checks found unique customer and order identifiers, no orphan records, and no invalid sales or quantity values. Missing values were found in the customer `score` field only. Those values should be handled explicitly in any analysis that uses customer score.

## Business Questions

The SQL analysis is designed to answer questions such as:

1. What are total revenue, total orders, total customers, and average order value?
2. How does revenue change by year?
3. Which product categories generate the most revenue and orders?
4. Which products contribute the most revenue, and how many units are sold?
5. Which countries contribute the most revenue, orders, and customers?
6. Which customers generate the most revenue, and how does their purchasing behavior differ?
7. Are there data quality issues that could affect the reliability of the analysis?

## Analysis and Dashboard

### SQL Analysis

SQL is used for data validation and exploratory business analysis, including:

- Duplicate and missing-value checks.
- Referential integrity checks between customers and orders.
- Validation of sales, quantity, and order-date ranges.
- Overall performance metrics and yearly revenue trends.
- Revenue, order, average order value, and quantity analysis by product/category.
- Country-level sales comparisons.
- Customer-level purchasing summaries.

### Power BI Dashboard

The Power BI report includes KPI cards and visuals for:

- **Performance KPIs:** total revenue, total orders, total customers, and average order value.
- **Revenue trend:** revenue over the 2024–2026 period.
- **Product category performance:** revenue by product category.
- **Top products:** products ranked by revenue.
- **Geographic performance:** revenue by country.
- **Interactive filters:** country, order date, and product category.

Use the Power BI report file included in the repository to explore the dashboard and interact with its filters.

## Key Findings

The analysis of the available dataset produced the following headline findings:

- **Total revenue:** $102,530.05
- **Total orders:** 100
- **Customers:** 12
- **Average order value:** $1,025.30
- **Product concentration:** Laptops account for approximately 51% of revenue.
- **Customer concentration:** The top five customers contribute approximately 70% of revenue.
- **Geographic context:** China shows high customer value despite having only two customers in the dataset.
- **Customer score:** The analysis did not show a clear relationship between customer score and revenue.

These results describe the supplied dataset and should not be treated as statistically representative of a larger retailer without further validation. The small customer and order counts are especially important when interpreting concentration and country-level comparisons.

## Business Recommendations

1. **Investigate product concentration.** Laptops contribute approximately half of revenue. Review product-level demand and availability, and assess whether the business should protect this revenue stream while exploring opportunities in other categories.
2. **Understand high-value customers.** The top five customers contribute approximately 70% of revenue. Examine their product mix and order patterns, and consider appropriate retention or loyalty initiatives without assuming that past spending will continue.
3. **Validate geographic opportunities.** China appears valuable in this dataset, but the customer count is small. Review additional periods and customer-level patterns before making major market investment decisions.
4. **Improve customer segmentation carefully.** Customer score does not show a clear relationship with revenue in this analysis. Do not use score alone to target customers; evaluate additional behavioral indicators if they become available.
5. **Expand the analysis with more business data.** Profit, costs, discounts, returns, shipping, and acquisition data would help distinguish revenue growth from profitable growth and provide stronger explanations for performance changes.

## Assumptions and Limitations

### Assumptions

- Sales values represent revenue per order.
- Customer score is optional and may be unavailable for some customers.
- Orders are assumed to represent completed transactions.
- Customer IDs uniquely identify customers.

### Limitations

The dataset does not include profit or cost, discounts or promotions, product returns, shipping information, or customer acquisition dates.

As a result:

- The analysis evaluates revenue, not profitability.
- Marketing campaign effectiveness cannot be measured.
- Purchasing patterns can be described, but long-term customer retention and lifecycle behavior cannot be fully assessed.
- The relatively small dataset limits how confidently results can be generalized.

## Tools and Technologies

- **SQL Server / SQL** — data quality checks, querying, and business analysis
- **Microsoft Excel** — data inspection and preliminary review
- **Power BI** — KPI reporting, data visualization, and interactive filtering

## Project Files

The repository contains the project documentation, SQL data quality assessment, and Power BI report. Open the `.sql` script to review the validation queries, the data quality Markdown file for the recorded checks and assumptions, and the `.pbix` file to explore the dashboard.
