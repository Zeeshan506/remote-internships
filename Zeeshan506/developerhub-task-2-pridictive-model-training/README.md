# **Task 2: Predict Future Stock Prices**  
---
**DeveloperHub Corporation | AI/ML Engineering Internship**

---

## Objective

This project focuses on predicting the **next-day closing price of Apple Inc. (AAPL)** stock using its historical stock data. It involves data collection, preprocessing, visualization, feature engineering, and time series modeling using **Random Forest Regression**.

---

## Libraries Used

- `yfinance` – for real-time financial data
- `pandas`, `numpy` – for data manipulation
- `seaborn`, `matplotlib` – for data visualization
- `sklearn` – for model training and evaluation

---

## Dataset Source

- Pulled using: `yfinance.download('AAPL', period='1y')`
- Time span: Past 1 year
- Columns: `Open`, `High`, `Low`, `Close`, `Adj Close`, `Volume`

---

## Exploratory Data Analysis (EDA)

### Overview
Initial dataset was examined with `.head()`, `.info()`, and `.describe()` to understand structure, types, and missing values.

### Data Integrity
- Missing values: **0**
- Duplicate entries: **0**
- Dataset shape: ~252 rows × 6 columns

---

## Data Visualization

### Line Plots
Tracked trends over time for:
- `Close`, `High`, `Low`, `Open`, and `Volume`

### Box Plots
- Detected **outliers**, especially in `Volume`
- Helped assess the spread and variability of price features

### Correlation Heatmap
- Strong correlation between `Open`, `Close`, `High`, and `Low`
- `Volume` was less correlated, but retained due to market relevance

---

## Feature Engineering

### Target Creation
- Created a `Target` column by **shifting `Close` by -1**
- Represents next-day closing price

### Lag Feature
- Created a `lag` column (previous day’s close) using shift(1)
- Captures temporal patterns

### Data Cleaning
- Dropped rows with `NaN` due to shifting
- Final dataset prepared with features + target

---

## Model Training

### Dataset Split
- **80% Train** / **20% Test**
- `shuffle=False` to preserve time-series order

### Model Used
- `RandomForestRegressor` from Scikit-learn

### Evaluation Metrics
- **MSE (Mean Squared Error)**
- **R² Score (Coefficient of Determination)**

---

## Prediction Results

Visualized `Actual vs Predicted` closing prices over the test period.

```python
plt.plot(y_test.index, y_test, label="Actual")
plt.plot(y_test.index, y_pred, label="Predicted")

```
---

## Final Summary
This project demonstrates the fundamentals of financial time series prediction:

- Data was explored with various plots to uncover insights and patterns.
- Features were engineered carefully (e.g., lag and target) to reflect the temporal nature of stock data.
- A basic but powerful model (Random Forest) performed well despite minimal tuning.
- Outliers were not removed because in financial datasets, they often represent real and meaningful events.

With more features like technical indicators or longer history, performance could be improved further.

---

## Future Enhancements
- Add technical indicators like RSI, MACD, EMA
- Try LSTM or ARIMA models for deeper time-series forecasting
- Incorporate news sentiment or volume anomalies

## Author
Zeeshan Shah

Connect with Me

- [LinkedIn](https://www.linkedin.com/in/syed-zeeshan-azhar-254a24328/)
- [GitHub](https://github.com/Zeeshan506)
- Email: zeeshanazhar506@gmail.com

