
# Banking Loans Analysis (SQL Project)

### Project Objective

The goal of this project is to analyze financial data of a bank based on the sample **financial** database. The project focuses on:

- understanding loan issuance trends,  
- analyzing clients by gender, age, and regions,  
- detecting potential risks (unpaid loans, young clients with high debt),  
- building procedures supporting operational processes (e.g., monitoring expiring cards).  

This project demonstrates SQL skills in a practical business case: aggregations, KPIs, customer rankings, data validation, and stored procedures.

---

### Tech Stack

- MySQL 8.0+ (tested in DataGrip)  
- SQL (CTEs, aggregations, window functions, stored procedures, validations)  

---

### Repository Structure
```bash
sql-project-banking/
├── 01_trend_loans.sql          # loan trends over time
├── 02_status_breakdown.sql     # loan status breakdown
├── 03_accounts_ranking.sql     # account ranking by number/amount of loans
├── 04_loans_by_gender.sql      # loans by gender + validation
├── 05_age_gender_kpis.sql      # KPIs: average client age by gender
├── 06_district_kpis.sql        # regional KPIs (clients, amounts, number of loans)
├── 07_district_shares.sql      # market share by region
├── 08_strict_selection.sql     # selection of high-risk clients
├── 09_diagnostics.sql          # diagnostics: age distribution and max number of loans
└── 10_cards_procedure.sql      # procedure for monitoring expiring cards

```

### Business Analyses

**1. Loan trends**  
File:  `01_trend_loans.sql`  
Aggregation by year–quarter–month.  
KPIs: total value, average value, and number of loans.  
&rarr; Identifies periods of increased loan activity (e.g., year-end growth).

---


**2. Loan status breakdown**  
File: `02_status_breakdown.sql`  
Split by status (A, C = repaid; B, D = unpaid).  
&rarr;  Estimates portfolio risk level.


---


**3. Account ranking by loans**  

File: `03_accounts_ranking.sql`  
Ranking by total and number of loans (`ROW_NUMBER`).  
&rarr; Identifies most active clients or key revenue sources.

---

**4. Loans by gender (+ validation)**  

File: `04_loans_by_gender.sql`  
Loan amounts split by account holder’s gender.  
Added validation: total must match the global total.  
&rarr; Useful for targeted marketing (e.g., different campaigns by gender).

---

**5. KPI: age and gender**  

File: `05_age_gender_kpis.sql`  
Number and total value of loans by gender and age.  
Calculated weighted average age by loan count.  
&rarr;  Supports credit policy – which age groups borrow more frequently.

---


**6. Regional KPIs**  

File: `06_district_kpis.sql`  
Number of clients, loan amounts, and counts per region (`district_id`).  
&rarr; Evaluates sales potential of regions and supports branch expansion planning.

---


**7. Market share by region**  

File: `07_district_shares.sql`  
Calculated the share of loan amounts per region in the total portfolio.  
&rarr;  Useful in strategic reports (which regions generate the most volume).

---


**8. High-risk client selection**  

File: `08_strict_selection.sql`  
Clients born after 1990 with >5 loans and debt >1000.  
&rarr; Flags young clients with high debt load – potential risk.

---


**9. Diagnostics**  

File: `09_diagnostics.sql`  
Top 10 clients by number of loans.  
Distribution of clients’ birth years.  
&rarr; Data quality analysis and anomaly detection.


**10. Procedure: expiring cards**  

File: `10_cards_procedure.sql`  
Generates a report of clients whose cards expire within 7 days.  
→ Operational support – the bank can send reminders to clients.

---


### Business Value

-   **Risk management**  – identification of unpaid loans and over-indebted clients.
    
-   **Business development**  – client and regional rankings, time trend analysis.
    
-   **Customer service**  – monitoring expiring cards, targeted marketing campaigns.
    

The project demonstrates full use of SQL in business analysis: aggregations, KPIs, rankings, validations, and stored procedures.

---


### Extras

The  `screenshots/`  folder contains example query results in the form of screenshots.

---


### Author

Project created as a portfolio / CV project –  **Krzysztof Kubacki**