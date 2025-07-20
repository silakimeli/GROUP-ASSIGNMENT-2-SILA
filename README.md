# GROUP-ASSIGNMENT-2-SILA RONOH 25ZAD111181
# Financial Risk Analytics Dashboard

This project showcases a credit risk analytics pipeline integrating Power BI dashboards, R-based statistical modeling, and business intelligence insights for loan performance monitoring.This Power BI dashboard is designed to analyze a financial dataset simulating financial risk data. The main goal is to assess borrower creditworthiness, track loan performance, and identify default risks. It supports **risk-based lending**, **non-performing loan (NPL) minimization**, and **borrower segmentation**.
## Dataset Summary

- **Source:** [Kaggle Dataset – Financial Risk Analysis](https://www.kaggle.com/datasets/jokimrodrigues/financial-risk-analysis-dataset)
- **Records:** 20,000+ loan applications  
- **Features:** 23 variables including:
  - `Credit_Score`, `Applicant_Income`, `Loan_Amount`, `Loan_Term_Months`, `Collateral_Value`, `Debt_to_Income_Ratio`, `Default_Status`, etc.

## Project Objectives

- Identify high-risk borrowers using credit and behavioral metrics  
- Segment borrowers by demographic and financial attributes  
- Support data-driven decision-making in credit approvals  
- Reduce NPLs through early risk detection

---

## Business Context

In Kenya’s evolving financial ecosystem—where mobile lending, SACCOs, DFIs, and fintech are thriving—accurate borrower profiling is essential. This dashboard simulates a credit analysis tool for a microfinance or digital lender, offering real-time credit risk visibility to credit managers and analysts.

---

## Dashboard Features

- **Interactive KPIs:** Portfolio Risk Score, NPL Ratio, Avg Credit Score  
- **Segmentation:** By credit score bands, property area, income, DTI, etc.  
- **Risk Flags:** Top 20 high-risk accounts, probability of default  
- **Visualizations:**
  - Credit score distributions
  - Default status by region/property
  - Borrower income vs. loan performance
  - Debt-to-Income vs. repayment trend graphs
  - Loan default prediction (Logistic Regression)
  - Probability of default (PD) scoring
  - Credit score segmentation
  - NPL insights by region, age, and employment
  - Drill-through dashboard and KPI reporting
<img width="611" height="337" alt="SCREENSHOT DASHBOARD" src="https://github.com/user-attachments/assets/1c5c451b-ab65-459b-9ae4-c37c9e3a9f65" />

## Structure
- `/data/`: Sample dataset
- `/scripts/`: R scripts for model building
- `/dashboard/`: Power BI `.pbix` file
- `/reports/`: PDF user manual and summary
- `/visuals/`: Screenshots and data flow diagrams

## Requirements
- Power BI Desktop
- R (v4.2+) with `caret`, `ggplot2`, `e1071`
- Power BI R script integration enabled
## 🛠️ Tools Used

- Power BI (DAX, visuals, slicers)
- Microsoft Excel (data cleaning)
- Kaggle (data source)
- GitHub (for collaboration and version control)

---

## Key Insights

- Borrowers with `Credit_Score < 600` had 4x higher default likelihood  
- Urban borrowers had more credit exposure but better repayment rates  
- Higher DTI ratios directly correlate with NPLs  
- Early warning segments help optimize risk-based pricing

---

## User Manual Summary

1. **Landing Page:** Overview KPIs & segmentation slicers  
2. **Risk Profile Tab:** Heatmaps and PD visualizations  
3. **Performance Tab:** NPL ratios, borrower demographics, repayment behavior  
4. **Export:** Reports available in .xlsx and .pdf formats  

---

## Repository & Deployment

- 📂 GitHub Repo: *(https://github.com/silakimeli/GROUP-ASSIGNMENT-2-SILA)*  



---

## Key Takeaways

- Demonstrated value of BI tools in credit risk management  
- Enabled transparent, explainable insights for financial decision-making  
- Emphasized local applicability for Kenyan digital lenders and MFIs  




