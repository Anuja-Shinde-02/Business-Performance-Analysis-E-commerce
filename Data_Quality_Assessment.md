#Data Quality Assessment (DQA)

*Objective
Before performing any business analysis, validate the integrity and completeness of the dataset to ensure reliable and accurate insights.

| Check | Purpose                  | Expected Result                      |
| ----- | ------------------------ | ------------------------------------ |
| DQA-1 | Duplicate Customer IDs   | No duplicates                        |
| DQA-2 | Duplicate Order IDs      | No duplicates                        |
| DQA-3 | Missing Values           | Identify NULLs                       |
| DQA-4 | Orders without Customers | No orphan records                    |
| DQA-5 | Customers without Orders | Possible business insight            |
| DQA-6 | Invalid Sales Values     | No zero/negative sales               |
| DQA-7 | Invalid Quantity Values  | No zero/negative quantity            |
| DQA-8 | Date Range Validation    | Understand available analysis period |

| Check                    | Result    | Status             |
| ------------------------ | --------- | ------------------ |
| Duplicate Customer IDs   | 0         |   Pass             |
| Duplicate Order IDs      | 0         |   Pass             |
| Missing Customer Scores  | X         |   Expected         |
| Missing Other Fields     | 0         |   Pass             |
| Orders Without Customers | 0         |   Pass             |
| Customers Without Orders | 0         |   Pass				|
| Invalid Sales            | 0         |   Pass             |
| Invalid Quantity         | 0         |   Pass             |
| Date Range               | 2024–2026 |   Valid            |

*Data Quality Assessment Summary
Before performing business analysis, a comprehensive data quality assessment was conducted to evaluate the completeness, consistency, and integrity of the dataset.

*The assessment confirmed that:
- Both tables contain unique primary identifiers with no duplicate records.
- No orphan records exist between the Customers and Orders tables, ensuring referential integrity.
- Every customer has placed at least one order during the analysis period.
- No invalid sales or quantity values were identified.
- Missing values were found only in the score column of the Customers table, which is expected and will be handled appropriately during customer score analysis.
- The dataset spans the years 2024–2026, making it suitable for trend and time-series analysis.

Overall, the dataset is considered reliable for exploratory data analysis and business reporting.

#Assumptions & Limitations

*Assumptions
Sales values represent revenue per order.
Customer score is an optional field and may be unavailable for some customers.
Orders are assumed to be completed transactions.
Customer IDs uniquely identify individuals.

*Limitations
The dataset does not include:
Profit or cost data
Discounts or promotions
Product returns
Shipping information
Customer acquisition date

*Because of these limitations:
We can analyze revenue, but not profitability.
We can recommend opportunities, but we cannot measure marketing campaign effectiveness.
We can identify purchasing patterns, but not customer retention over a longer lifecycle.

Including this section shows that you understand what the data can and cannot answer—an important analytical skill.
