# 📝 Instacart Market Basket Analysis Documentation - Group 6
---

## 1. Project Overview

- **Dataset Used:**  
	*Instacart Market Basket Analysis* 

- **Goal of the Exercise:**  
  * The goal of the exercise is to develop a business question, Apply Normalization → Dimensional Modeling → Data Quality Dashboard using the Instacart Market Basket dataset.*  

- **Team Setup:**  
  - Standard Data Cleaning: All members
		- Addy: Departments
		- Aly:   Aisles
		- Angel: Orders
		- Nella: Products
		- Wish: Combination of prior and train
		
  - Data Quality (DQ) Checks:
		- Row Count comparison between raw and clean tables – Wish
		- Referential Integrity check – Wish
		
  - Data Modeling:
		- Create Fact and Dimension Tables based on the business question – Angel

  - Documentation: Aly and Nella 

- **Environment Setup:**  
  *Docker containers on a shared VM + local laptops.*
  - Ingestion: dlt
  - Modeling: dbt
  - Visualization: Metabase
  - Collaboration: Git + GitHub 

---

## 2. Architecture & Workflow

- **Pipeline Flow:**  
  ```
  raw → clean → mart → Metabase
  ```

- **Tools Used:**  
  - Ingestion: `dlt`  
  - Modeling: `dbt`  
  - Visualization: `Metabase`  

- **Medallion Architecture Application:**  

  - **Bronze (Raw):** *Initial ingestion of source data (Skipped)*  
  - **Silver (Clean):** 
		  - Purpose: To provide a reliable, queryable "single source of truth" for major business entities.
		  
		  - Key Activities:
				- Cleaning: We cast the appropriate columns needed and fix data quality issues.
				- Conforming: We standardize data types, apply consistent naming conventions, and ensure conformity across different sources.
				- Enriching: We join tables from different sources to create a more complete view.
				- State of the Data: Validated, cleaned, and organized by business concepts

  
  - **Gold (Mart):** *We build our star schemas (fact and dimension tables) in this layer.*  



---

## 3. Modeling Process (For update)

- **Source Structure (Normalized):**  
  *(Describe how the original tables were structured — 3NF, relationships, etc.)*  

- **Star Schema Design:**  
  - Fact Tables: *(e.g., FactSales, FactAssessment, FactRatings)*  
  - Dimension Tables: *(e.g., Customer, Date, Genre, Student, Demographics, Title, Person)*  

- **Challenges / Tradeoffs:**  
  *(E.g., handling missing data, many-to-many joins, exploding arrays, performance considerations.)*  

---

## 4. Collaboration & Setup

- **Task Splitting:**  
  *The team collaborated using Slack to align on the workflow of the activities.* 

  | Member         | Responsibility                            							                                                         |
  | -------------- | ----------------------------------------------------------------------------------------------------------------------------|
  | Addy		   | Standard Data Cleaning (Departments)                                                                                        |
  | Aly            | Standard Data Cleaning (Aisle), Documentation                                                                               |
  | Angel          | Standard Data Cleaning (Orders), Create Fact and Dimension Tables based on the business question                            |
  | Nella          | Standard Data Cleaning (Products), Documentation                                                                            |
  | Wish           | Standard Data Cleaning (Combination of prior and train), Data Quality (DQ) Checks: Row Count, Referential Integrity check   |         |  

- **Shared vs Local Work:**  (for update)
  *(Issues faced with sync conflicts, version control, DB connections, etc.)*  

- **Best Practices Learned:**  
	- Version Control with Git:
			- Used Git to track changes and document team assumptions, improving transparency and collaboration.
	- Pipeline Ownership:
			- Gained hands-on experience by designing and implementing a custom end-to-end data pipeline, enhancing understanding of data flow from raw ingestion to visualization.  

---

## 5. Business Questions & Insights

- **Business Questions Explored:**  
  1. *Top 10 most reordered products*  
 
- **Dashboards / Queries:**  (for update)
  *(Add screenshots, SQL snippets, or summaries of dashboards created in Metabase.)*  

- **Key Insights:**  (for update)
  - *(Highlight 1–2 interesting findings. Example: “Rock was the top genre in North America, while Latin genres dominated in South America.”)*  

---

## 6. Key Learnings

- **Technical Learnings:**  
  - Data Cleaning
  - SQL joins
  - Schema designing
  - Building data pipeline
  - Visualization in a remote setup  

- **Team Learnings:**  
  - Collaboration in shared environments
  - Importance of documentation  

- **Real-World Connection:**  (for update)
  *(How this exercise relates to actual data engineering workflows in industry.)*  

---

## 7. Future Improvements

- **Next Steps with More Time:**  
  - - Will try to explore more business questions  

- **Generalization:**  (for update)
  *(How this workflow could be applied to other datasets or business domains.)*  


