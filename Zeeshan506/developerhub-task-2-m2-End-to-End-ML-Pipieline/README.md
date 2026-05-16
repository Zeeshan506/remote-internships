# End-to-End Machine Learning Pipeline for Telco Customer Churn Prediction

## Introduction
This report details the implementation of an end-to-end machine learning (ML) pipeline designed to predict customer churn in a telecommunications dataset. The primary goal was to create a robust, reproducible, and production-ready system by leveraging Scikit-learn's Pipeline and ColumnTransformer APIs for data preprocessing, model training, hyperparameter tuning, and model export. This approach ensures that all steps, from raw data to a deployed model, are encapsulated within a single, coherent structure.

## Dataset Acquisition
The project utilizes the Telco Customer Churn dataset, a publicly available dataset commonly used for churn prediction tasks. For this implementation, the dataset was fetched directly from Kagglehub. The process involved authenticating with Kaggle credentials and then loading the specified CSV file (`WA_Fn-UseC_-Telco-Customer-Churn.csv`) into a pandas DataFrame. This ensures a consistent and traceable data source for the pipeline.

## Data Preprocessing and Splitting
Before model training, the raw data undergoes crucial preprocessing and splitting steps to prevent data leakage and prepare features for the ML algorithms.

- **Feature and Target Separation**: The dataset was divided into features (X) and the target variable (y). The `customerID` column was dropped from the features as it's an identifier and not relevant for prediction. The `Churn` column, originally 'Yes'/'No', was converted to a binary numerical format (1 for 'Yes', 0 for 'No').

- **Train-Test Split**: The data was split into training and testing sets (80% train, 20% test) using `train_test_split`. A `random_state` was set for reproducibility, and `stratify=y` was used to ensure that the proportion of churned customers is similar in both training and testing sets, which is crucial for imbalanced datasets.

- **Feature Type Identification**: Numerical features (`int64`, `float64`) and categorical features (`object`) were identified.

- **Handling 'TotalCharges'**: A common issue with this dataset is that `TotalCharges` is often imported as an object type due to occasional non-numeric entries (e.g., spaces for new customers). This column was explicitly converted to numeric, with `errors='coerce'` to turn unconvertible values into NaN, which would then be handled by imputation in the pipeline.

## Pipeline Construction
The core of this project is the construction of a scikit-learn pipeline that integrates all preprocessing steps with the chosen ML models. This ensures that the entire workflow is treated as a single unit, enhancing reproducibility and simplifying deployment.

### Preprocessing Pipelines
Two separate pipelines were created within a `ColumnTransformer` for different feature types:

- **Numerical Transformer**:
  - Imputation: `SimpleImputer(strategy='mean')` was used to fill missing values (e.g., from `TotalCharges` coercion) with the mean of the column.
  - Scaling: `StandardScaler()` was applied to standardize numerical features, ensuring they contribute equally to the model and preventing features with larger scales from dominating.

- **Categorical Transformer**:
  - One-Hot Encoding: `OneHotEncoder(handle_unknown='ignore')` was used to convert categorical features into a numerical format suitable for ML models. `handle_unknown='ignore'` gracefully handles categories not seen during training, preventing errors in production.

These transformers were then combined using a `ColumnTransformer`, which applies the numerical pipeline to numerical features and the categorical pipeline to categorical features. `remainder='passthrough'` ensures that any columns not explicitly specified are retained (though in this case, all relevant columns are handled).

### Model Integration
The preprocessor was then combined with two different classification models to form complete ML pipelines:

- **Logistic Regression Pipeline (pipeline_lr)**:
  - `LogisticRegression(solver='liblinear')` was chosen as a robust baseline classifier, with liblinear solver being effective for smaller datasets and L1/L2 regularization.

- **Random Forest Pipeline (pipeline_rf)**:
  - `RandomForestClassifier()` was included as an ensemble learning method, known for its strong performance and ability to handle complex relationships.

## Hyperparameter Tuning with GridSearchCV
To optimize the performance of the chosen models, `GridSearchCV` was employed to systematically search for the best hyperparameters.

- **Parameter Grids**:
  - For Logistic Regression, the `C` parameter (inverse of regularization strength) was tuned across values `[0.01, 0.1, 1, 10, 100]`.
  - For Random Forest, `n_estimators` (number of trees) `[50, 100, 200]` and `max_depth` (maximum depth of each tree) `[None, 10, 20, 30]` were tuned.

- **Grid Search Execution**: `GridSearchCV` was performed for both `pipeline_lr` and `pipeline_rf` with `cv=5` (5-fold cross-validation), `n_jobs=-1` (to use all available CPU cores), and `scoring='accuracy'` to evaluate model performance. The `fit` method was called on the training data.

The grid search identified the best parameters and their corresponding cross-validation accuracy scores for both models. In this specific run, Logistic Regression achieved a higher best cross-validation accuracy, making it the chosen model for export.

## Exporting the Pipeline
After hyperparameter tuning, the best-performing pipeline (Logistic Regression in this instance) was selected and exported using the `joblib` library. This step is critical for model deployment, as it saves the entire trained pipeline—including all preprocessing steps and the optimized model—to a file (`telco_churn_pipeline.joblib`). This allows the pipeline to be loaded later and used for predictions on new, unseen data without needing to re-train or manually apply preprocessing.

## Testing the Exported Pipeline
To validate the export and loading process, the saved pipeline was loaded back into the environment. A new, hypothetical customer's data was created as a pandas DataFrame. This `new_data` DataFrame mimics the structure of the original input features. The `loaded_pipeline` was then used to make a prediction (`predict`) and obtain churn probabilities (`predict_proba`) for this new customer. This test confirmed that the exported pipeline functions correctly, providing a clear prediction (0 for no churn, 1 for churn) and the associated probability scores.

## Conclusion
This task successfully demonstrated the construction of an end-to-end machine learning pipeline for Telco customer churn prediction using the scikit-learn Pipeline API. From data acquisition and preprocessing to model training, hyperparameter tuning, and robust model export, the entire workflow is automated and encapsulated. The use of `ColumnTransformer` effectively handles heterogeneous data types, and `GridSearchCV` ensures optimal model performance. The final exported pipeline is ready for deployment, capable of making predictions on new customer data with all necessary preprocessing steps integrated.
