# Data Quality Assessment (DQA)

## Objective

Before performing business analysis, validate the integrity and completeness of the dataset to support reliable and accurate insights.

## Data Quality Checks

The following checks were defined for the assessment.

| Check ID | Check | Purpose | Expected Result |
|---|---|---|---|
| DQA-1 | Duplicate Customer IDs | Check uniqueness of customer identifiers | No duplicates |
| DQA-2 | Duplicate Order IDs | Check uniqueness of order identifiers | No duplicates |
| DQA-3 | Missing Values | Identify `NULL` values | Missing values identified and assessed |
| DQA-4 | Orders Without Customers | Check referential integrity | No orphan records |
| DQA-5 | Customers Without Orders | Identify customers with no recorded purchases | Review as a possible business insight |
| DQA-6 | Invalid Sales Values | Identify zero or negative sales | No zero or negative sales |
| DQA-7 | Invalid Quantity Values | Identify zero or negative quantities | No zero or negative quantities |
| DQA-8 | Date Range Validation | Confirm the available analysis period | Date range documented |

## Results

| Check | Result | Status |
|---|---:|---|
| Duplicate Customer IDs | 0 | Pass |
| Duplicate Order IDs | 0 | Pass |
| Missing Customer Scores | Present (`X` recorded in the original assessment) | Expected; review during score analysis |
| Missing Other Fields | 0 | Pass |
| Orders Without Customers | 0 | Pass |
| Customers Without Orders | 0 | Pass |
| Invalid Sales | 0 | Pass |
| Invalid Quantity | 0 | Pass |
| Date Range | 2024–2026 | Valid |

> **Note:** The original assessment records missing customer scores as `X`, rather than a numeric count. This document preserves that result instead of assuming a count.

## Assessment Summary

The assessment was conducted to evaluate the completeness, consistency, and integrity of the Customers and Orders tables.

The recorded results indicate that:

- Customer and order identifiers are unique, with no duplicate IDs reported.
- No orphan records were found between the Customers and Orders tables, supporting referential integrity.
- Every customer has at least one order recorded during the analysis period.
- No invalid sales or quantity values were identified.
- Missing values were reported only in the `score` column of the Customers table. These values should be handled explicitly in analyses that use customer score.
- The dataset covers 2024–2026, supporting analysis across this recorded period.

Based on these checks, the dataset is considered suitable for exploratory analysis and business reporting, subject to the assumptions and limitations below.

## Assumptions and Limitations

### Assumptions

- Sales values represent revenue per order.
- Customer score is optional and may be unavailable for some customers.
- Orders are assumed to represent completed transactions.
- Customer IDs uniquely identify individuals.

### Limitations

The dataset does not include:

- Profit or cost data.
- Discounts or promotions.
- Product returns.
- Shipping information.
- Customer acquisition date.

Because of these limitations:

- Revenue can be analyzed, but profitability cannot be calculated.
- Opportunities can be recommended, but marketing campaign effectiveness cannot be measured.
- Purchasing patterns can be identified, but customer retention over a longer lifecycle cannot be fully assessed.

Understanding these limitations helps keep the analysis and recommendations aligned with what the available data can support.
