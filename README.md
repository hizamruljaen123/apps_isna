# Sentiment Analysis using SVM with Parameter Optimization

## Overview
This project performs **sentiment analysis** on text data (e.g., social media comments, reviews) using **Support Vector Machine (SVM)**.  
Parameter tuning or **“booster” optimization** is applied to improve the SVM performance.

## Features
- Input: Text data (comments, reviews).  
- Preprocessing: Tokenization, stopword removal, TF-IDF vectorization.  
- Output: Sentiment classification (Positive / Negative / Neutral).  
- Optimization: Grid search or booster approach to tune `C` and `gamma` hyperparameters.  

## Steps
1. **Data Collection**: Gather textual data from YouTube, Twitter, or e-commerce reviews.  
2. **Preprocessing**: Clean text, remove noise, tokenize, apply TF-IDF.  
3. **SVM Modeling**: Train SVM classifier.  
4. **Parameter Optimization**: Tune hyperparameters using grid search or custom booster approach.  
5. **Prediction & Evaluation**: Classify sentiment and evaluate performance.  

## Python Example

```python
import pandas as pd
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.svm import SVC
from sklearn.metrics import classification_report, confusion_matrix

# Load dataset
data = pd.read_csv("comments.csv")
X = data['comment_text']
y = data['sentiment']  # 0 = Negative, 1 = Positive

# Split dataset
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Vectorize text
vectorizer = TfidfVectorizer(max_features=5000)
X_train_vec = vectorizer.fit_transform(X_train)
X_test_vec = vectorizer.transform(X_test)

# SVM with parameter optimization (booster)
parameters = {
    'C': [0.1, 1, 10],
    'gamma': ['scale', 0.01, 0.1],
    'kernel': ['rbf']
}
svm = SVC()
grid_search = GridSearchCV(svm, parameters, cv=5, scoring='accuracy')
grid_search.fit(X_train_vec, y_train)

# Best model
best_svm = grid_search.best_estimator_
y_pred = best_svm.predict(X_test_vec)

# Evaluate
print("Best Parameters:", grid_search.best_params_)
print("Confusion Matrix:\n", confusion_matrix(y_test, y_pred))
print("\nClassification Report:\n", classification_report(y_test, y_pred))
