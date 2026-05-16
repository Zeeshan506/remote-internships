#  **Task 3: Heart Disease Prediction**

---
**DeveloperHub Corporation | AI/ML Engineering Internship**
---

This project is part of the **DeveloperHub Internship**, focusing on building a predictive machine learning model for **Heart Disease Detection** using the UCI Heart Disease dataset. The goal is to develop, train, and evaluate a classification model that can accurately identify whether a patient is at risk of heart disease.

--- 

## Overview
This notebook walks through the complete machine learning pipeline:
- Fetching the dataset using the `ucimlrepo` Python package.
- Cleaning and preprocessing the dataset (handling missing values, encoding, scaling).
- Visualizing the dataset using histograms, box plots, and correlation heatmaps.
- Building and evaluating a **Logistic Regression** model.
- Interpreting results with accuracy score, confusion matrix, feature importance, and ROC curve.

## Dataset
- **Source**: UCI Machine Learning Repository  
- **URL**: [https://archive.ics.uci.edu/dataset/45/heart+disease](https://archive.ics.uci.edu/dataset/45/heart+disease)  
- **Attributes**: 13+ features including age, cholesterol, blood pressure, etc.  
- **Target Variable**: `num` (converted to binary for classification)

--- 

## Key Steps

---

### 1. Data Preprocessing
- Removed null and duplicate records  
- Converted the target to binary (0 = No Disease, 1 = Disease)  
- Scaled numeric features using `StandardScaler`

### 2. Data Visualization
- Histograms for feature distribution  
- Boxplots to identify outliers and compare against the target  
- Correlation heatmap to understand relationships among variables

### 3. Model Training
- Used **Logistic Regression** as the baseline model  
- Performed train-test split with stratification

### 4. Evaluation Metrics
- **Accuracy Score** for performance  
- **Confusion Matrix** for classification breakdown  
- **ROC Curve** for visualizing model discrimination capability  
- **Feature Importance** from model coefficients

## Libraries Used
- `pandas`, `numpy` for data manipulation  
- `seaborn`, `matplotlib` for visualization  
- `sklearn` for preprocessing, model training, and evaluation  
- `ucimlrepo` to easily fetch the dataset

--- 

## Conclusion
This task demonstrates how to apply logistic regression to a real-world healthcare problem. It highlights data preparation, exploratory analysis, model training, and performance evaluation for binary classification.

---

> Developed as part of the DeveloperHub Internship — Machine Learning Track (Task 3)  
> Author: Zeeshan Shah  
> [LinkedIn](https://www.linkedin.com/in/syed-zeeshan-azhar-254a24328/) | [GitHub](https://github.com/Zeeshan506)
> Email: zeeshanazhar506@gmail.com
