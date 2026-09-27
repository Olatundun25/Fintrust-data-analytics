# FinTrust Digital Bank
# Week 2 Data Analytics Project

**AnalystLab Africa Experience Lab Internship Programme**
**Data Analytics Track**
**Prepared by: Adeyemo Taiwo**

## About the Project

FinTrust is a fictional digital bank created for this internship project. The goal of the project was to work with customer and transaction data and use different data analytics tools to answer business questions.

The project covered the full analysis process, starting with understanding the business problem and checking the quality of the data, then using SQL and Python for analysis and finally presenting the findings in a Power BI dashboard.

## Repository Structure

```text
├── week1/
│   └── FinTrust_Week1_DataAnalytics_Meenah.docx
│      # Business understanding, analytical questions, KPIs and dashboard wireframe
│
├── week2/
│   ├── FinTrust_Week2_DataQuality_Cleaning.xlsx
│   │  # Data quality checks and data cleaning
│   │
│   ├── FinTrust_Week2_SQL_Analysis_Assignment.sql
│   │  # SQL queries used to answer 8 business questions
│   │
│   ├── FinTrust_Week2_Data_Analysis.ipynb
│   │  # Python data exploration and visualizations
│   │
│   ├── FinTrust_Week2_Analytics_Dashboard.pbix
│   │  # Power BI dashboard
│   │
│   ├── dashboard_screenshot.png
│   │  # Screenshot of the completed dashboard
│   │
│   └── FinTrust_Week2_ProjectDocumentation_Meenah.docx
│      # Project documentation, findings, decisions, testing and limitations
│
└── README.md
```

## Key Findings

Some of the main findings from the analysis were:

* The **Mobile App** handled **42.5% of total transaction volume**. It also recorded an **8.64% failure/reversal rate**, showing that transaction reliability on this channel needs attention.

* **International transactions** had a much higher risk-review rate than domestic transactions, at **36.9% compared with 18.9%**. This pattern was also seen across the different transaction types.

* Only **6.1% of transactions**, all above **₦200,000**, accounted for **42.4% of the total transaction value**. This shows that a relatively small number of high-value transactions contribute a large share of the money moving through the platform.

* The overall transaction success rate was **90.47%**. The remaining transactions included failed, reversed and pending transactions, showing an area where the bank could improve the customer experience.

* Customer segments showed more similarities than major differences in transaction activity and account health. This suggests that some improvements could be applied across the platform rather than being limited to one customer segment.

## Tools Used

* **Microsoft Excel** — data quality checks and cleaning
* **DuckDB / SQL** — querying the data and answering business questions
* **Python** — data exploration and visualization using pandas, NumPy, Matplotlib and Seaborn
* **Power BI** — dashboard development and business reporting
* **Jupyter Notebook** — Python analysis

## Project Workflow

The project followed these main steps:

**1. Business Understanding**
Identified the business problem, key questions and the information needed from the data.

**2. Data Quality and Cleaning**
Checked the dataset for missing values, duplicates, incorrect data types and other quality issues before analysis.

**3. SQL Analysis**
Used SQL to investigate transaction activity, customer segments, transaction outcomes and risk-related patterns.

**4. Python Analysis**
Used Python to explore the data further and create visualizations that helped identify important patterns.

**5. Power BI Dashboard**
Built an interactive dashboard to present the main KPIs, trends and findings in a way that could be easily understood.

**6. Business Interpretation**
Translated the analytical results into practical business observations and possible areas for FinTrust to investigate.

## Data Disclaimer

FinTrust is a fictional digital banking project, and all customer, transaction and risk-related data used in this project are synthetic.

The `Risk_Review_Flag` field is also synthetic and should not be interpreted as a real fraud, compliance or financial-risk decision.

This project was created for **educational and portfolio purposes** as part of the AnalystLab Africa Experience Lab Internship Programme.
