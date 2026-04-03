
# 🚦 Road Accident Analysis using SQL

## 📌 Project Overview

This project analyzes road accident data using SQL to uncover patterns, identify high-risk conditions, and generate actionable safety insights.

## 🎯 Objectives

* Identify accident-prone cities and states
* Analyze impact of weather, traffic, and time
* Categorize accidents based on risk and severity
* Generate business insights for road safety

## 🛠 Tools & Technologies

* SQL (MySQL / PostgreSQL)
* Dataset: Indian Road Accident Data
* Excel (for data handling)

## 📊 Key SQL Analysis

### 🔹 Basic Analysis

* Max & Min temperature during accidents
* Accidents by city and state
* Filtering based on weather and traffic

### 🔹 Intermediate Analysis

* Cities with more than 100 accidents
* States with avg risk score > 0.5
* Road types with high severe accidents

### 🔹 Advanced Analysis

* Ranking cities based on accident count
* Most dangerous day of the week
* Weather conditions causing most casualties

### 🔹 Business Logic (CASE WHEN)

* Risk categorization:

  * High (>0.7)
  * Medium (0.4–0.7)
  * Low (<0.4)

* Accident labeling:

  * Severe (casualties > 3)
  * Minor (otherwise)

## 🔍 Key Insights

* Certain cities have significantly higher accident frequency
* Rainy and low-visibility conditions increase casualties
* Peak traffic hours contribute to higher accident rates
* High risk scores are strongly linked with severe accidents

## 📁 Project Structure

* dataset/ → raw dataset
* sql/ → all SQL queries
* screenshots/ → output results

## ▶️ How to Run

1. Import dataset into SQL database
2. Run queries from `road_accident_analysis.sql`
3. Analyze results for insights

## 🚀 Future Improvements

* Power BI dashboard for visualization
* Predictive accident risk modeling
* Real-time traffic data integration

## 👨‍💻 Author

Santanu

---

⭐ If you found this useful, consider giving it a star!
