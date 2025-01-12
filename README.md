# Walmart Sales Analysis 🛒📊

This project analyzes Walmart's sales data to extract actionable insights, predict customer satisfaction, and visualize sales trends across different cities and categories.

---

## Table of Contents 📑

- [Project Overview](#project-overview)  
- [Data Description](#data-description)  
- [Methodology](#methodology)  
  - [Data Analysis](#data-analysis)  
  - [Customer Satisfaction Prediction](#customer-satisfaction-prediction)  
  - [Data Visualization](#data-visualization)  
- [Results](#results)  
- [Files in Repository](#files-in-repository)  
- [How to Use](#how-to-use)  
- [Conclusion](#conclusion)  
- [References](#references)  

---

## Project Overview 🎯

The objective of this project is to analyze Walmart's sales data to identify key trends, predict customer satisfaction, and provide interactive visual insights to support data-driven decision-making.  

---

## Data Description 🗂️

The dataset includes the following columns:  

- **Invoice ID**: Unique identifier for each transaction. 🆔  
- **Branch**: Code for the branch where the sale occurred. 🏢  
- **City**: City of the branch. 🌆  
- **Category**: Product category (e.g., Health and Beauty, Electronics). 🛍️  
- **Unit Price**: Price per unit of the product. 💵  
- **Quantity**: Number of units sold. 📦  
- **Date**: Date of the transaction. 📅  
- **Time**: Time of the transaction. ⏰  
- **Payment Method**: Payment method used by the customer (e.g., Ewallet, Cash). 💳  
- **Rating**: Customer rating of the experience. ⭐  
- **Profit Margin**: Percentage of profit made on the product. 📈  

---

## Methodology 🔍

### Data Analysis 📊

- **Tools Used**: SQL, Pandas  
- **Process**:  
  - Cleaned and preprocessed the data to handle missing values, duplicates, and format inconsistencies. 🧹  
  - Conducted exploratory data analysis to understand sales distribution across branches, cities, and product categories. 📊  
  - Identified trends in sales based on payment methods, ratings, and profit margins. 📈  

### Customer Satisfaction Prediction 🤖
### Customer Satisfaction Prediction 🤖

- **Model Used**: LGBM Classifier 🎯
- **Process**:  
  - I tried solving it using Regression, but the results were not satisfactory (R² Score = 0.4–0.5). So, I decided to convert the Ratings (Numerical) (3.0–10.0 in our data) into Categorical Bins (3.0–7.0 = Low-Mid; 7.0–10.0 = High). This approach proved more effective, achieving a satisfactory accuracy of around 80%. 📊

  - Binning helps separate Low-Mid rating products from High-Rating products, enabling business owners to focus more on High-Rating products to maximize value. 📈

  - Created a Unified Pipeline 🔄 to implement all preprocessing, model training, and prediction steps in a single pipeline, ensuring efficient and consistent handling of data transformations and predictions. 🔧

### Data Visualization 📈

- **Tool Used**: Power BI  
- **Process**:  
  - Built interactive dashboards to visualize sales trends, branch performance, and product category distribution. 🖥️  
  - Integrated dynamic filters for city, payment method, and time to enhance user exploration. 🧠  

---

## Results 🏆

- **Data Analysis**:  
  - Highlighted San Antonio and Irving as top-performing cities for sales. 📍  
  - Identified Health and Beauty as the most profitable category. 🛍️  
  - Observed that Ewallet is the most frequently used payment method. 💳  
- **Customer Satisfaction Prediction**:  
  - Built a predictive model with 80% accuracy to estimate customer satisfaction based on transaction attributes. 🔮  
- **Data Visualization**:  
  - Provided clear and interactive visual insights, enabling stakeholders to make strategic decisions. 📊  

---

## Files in Repository 📂

- `Walmart_Sales_Analysis.sql`: SQL queries used for data analysis.  
- `walmart-sales-analysis.ipynb`: Jupyter Notebook containing Python code for data analysis and predictive modeling.  
- `Walmart Sales Dashboard.pbix`: Power BI dashboard file.  
- `walmart_sales.csv`: Dataset used for analysis.  
- `Walmart Sales Insights.pdf`: Report summarizing the analysis, findings, and recommendations.  

---

## How to Use 🛠️

1. **Data Analysis**:  
   - Run the SQL queries in `Walmart_Sales_Analysis.sql` using a SQL-compatible database.  
   - Execute the Jupyter Notebook `walmart-sales-analysis.ipynb` to perform data analysis and build the predictive model.  
2. **Data Visualization**:  
   - Open `Walmart Sales Dashboard.pbix` in Power BI to explore the interactive dashboards.  
3. **Dataset**:  
   - The dataset `walmart_sales.csv` is provided for reference and further analysis.  

---

## Conclusion ✅

This project provides a detailed analysis of Walmart's sales data, delivering actionable insights through data cleaning, exploratory analysis, predictive modeling, and visualization. The results enable data-driven decision-making to enhance sales performance and customer satisfaction.  

---

## References 🔗

- [Walmart Sales Dataset on Kaggle](https://www.kaggle.com/datasets/aslanahmedov/)  
