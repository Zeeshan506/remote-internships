# ArchTechnology Internship Projects

Welcome to the official repository for my internship projects at **ArchTechnology**.  
This repository contains all the work, code, and analysis done during the internship period, focused primarily on **machine learning model building, data preprocessing, and evaluation**.

---

## 🔍 Project Overview

The goal of the internship was to:
- Load and clean datasets
- Handle nulls, duplicates, and outliers
- Perform exploratory data analysis (EDA)
- Encode categorical variables
- Scale features for optimal model performance
- Train classification models
- Evaluate models using accuracy score and confusion matrix

---

## 📂 Structure

ArchTechnology-Internship-Projects/
│

├── data/ # Raw and cleaned datasets

├── ARCH TECHNOLOGIES AI Internship Task 1.ipynb/ # Jupyter notebooks for Task 1

├── ARCH TECHNOLOGIES AI Internship Task 2.ipynb/ # Jupyter notebooks for Task 2

├── LICENSE/ # License

└── README.md # Project documentation

---

## ✅ What’s Done So Far

### ✔️ 1. Data Loading and Inspection
- Loaded dataset into a Pandas DataFrame.
- Checked for null values and duplicates.
- Cleaned the data accordingly.

### ✔️ 2. Outlier Detection & Removal
- Visualized data using box plots.
- Removed outliers using IQR and optionally via `feature-engine`.

### ✔️ 3. Data Encoding & Feature Engineering
- Applied encoding using `sklearn.preprocessing.LabelEncoder` or `OneHotEncoder`.
- Performed necessary transformations to prepare the dataset for ML models.

### ✔️ 4. Feature Scaling
- Used `StandardScaler` or `MinMaxScaler` to normalize features.
- Ensured all features are on the same scale for better model performance.
- Used `mean squared error`, `r2 score` for making an acurate pridiction

### ✔️ 5. Model Training
- Used `RandomForestClassifier` from `sklearn.ensemble`.
- Used `RandomForestRegressor` from `sklearn.ensemble`.
- Split data into training and test sets using `train_test_split`.

### ✔️ 6. Model Evaluation
- Evaluated the model using:
  - `accuracy_score`
  - `confusion_matrix`
  - `mean squared error`
- Achieved **100% accuracy** on the test set (note: dataset had only 150 records).
- Found out the `MedInc` column to be most contributing to accurace in the Housing Price model

---

## 🔧 Tech Stack

- Python 3.x
- Pandas, NumPy
- Scikit-learn
- Feature-engine (for outlier detection)
- Jupyter Notebooks

---

## 📈 Results

The current model achieved:
Accuracy: 1.0
Confusion Matrix:
[[ 10 0 0 ]
[  0 9 0  ]
[  0 0 11 ]]

Random Forest R²: 0.8043216552088295

Random Forest MSE: 0.25641865986166834

---

## 🚀 Next Steps

- Tune hyperparameters and compare other models
- Try cross-validation for more robust performance estimates
- Save models using `joblib` or `pickle`
- Explore deployment options or integration into a larger pipeline

---

## 📬 Contact

If you want to connect or ask questions:
**Zeeshan Shah**  
GitHub: [Zeeshan506](https://github.com/Zeeshan506)  
Email: *zeeshanazhar506@gmail.com* 

---

> ⭐ If you find this useful or inspiring, consider starring the repo!
