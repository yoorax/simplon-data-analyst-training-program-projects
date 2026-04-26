# Week 14 – Supervised Learning (Flight Price Prediction)

---

## Goal

Build and optimize an end-to-end machine learning pipeline to predict flight ticket prices based on features like flight duration, booking timing, and airline class.

---

## Key Technologies

| Technology | Purpose |
|------------|---------|
| **Python** | Core programming language |
| **Pandas** | Data manipulation and preprocessing |
| **Scikit-Learn** | Random Forest model and evaluation metrics |
| **XGBoost** | Gradient boosting regressor |
| **Seaborn** | Data visualization |
| **Pickle** | Model serialization and export |

---

## Core Functionality & Features

- **Exploratory Data Analysis (EDA)**
  - Conducted statistical tests (ANOVA and Pearson correlation) to validate the relationship between features like airline, flight duration, and ticket price.

- **Data Preprocessing & Encoding**
  - Mapped ordinal variables (e.g., number of stops, departure/arrival times) to numerical values and applied One-Hot Encoding for nominal variables (airline, city, flight class) to prepare the dataset for modeling.

- **Model Training & Evaluation**
  - Trained and evaluated both Random Forest and XGBoost regressors, utilizing evaluation metrics such as MAE, RMSE, and R-squared Score, alongside visualizations like Actual vs. Predicted prices and Feature Importance.

---

## Technical Highlights & Patterns

- **Robust Feature Engineering**
  - Handled a complex dataset by dropping noisy features (like flight numbers) and converting diverse categorical data into structured numerical formats optimized for tree-based models.

- **Algorithm Comparison**
  - Built competing predictive models, with XGBoost demonstrating superior overall performance in accuracy, speed, and efficiency:

| Metric | Random Forest | XGBoost | Winner |
|--------|:------------:|:-------:|:------:|
| MAE (Mean Absolute Error) | 1080.44 Rs. | 1240.06 Rs. | **Random Forest** |
| RMSE (Root Mean Squared Error) | 2780.86 Rs. | 2505.01 Rs. | **XGBoost** |
| R-squared Score | 98.50% | 98.78% | **XGBoost** |
| Computation Time | 6 min 35 s | 20 s | **XGBoost** |
| Model File Size | 1.7 GB | 14 MB | **XGBoost** |

- **Production-Ready Serialization**
  - Exported the trained models (`random_forest_model.pkl` and `xgboost_model.pkl`) using Pickle, saving them into a dedicated `models/` directory to decouple the modeling pipeline from future application layers.

- **Key Takeaway**
  - XGBoost not only achieved better predictive accuracy on RMSE and R-squared, but also proved vastly more practical for deployment — training nearly 20x faster and producing a model file over 100x smaller than Random Forest.

---

*End-to-end supervised learning pipeline delivered, from EDA to serialized production models.*