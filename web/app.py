from flask import Flask, render_template, request, redirect, url_for, send_file, jsonify
import pandas as pd
import numpy as np
from sklearn.preprocessing import LabelEncoder, StandardScaler
from sklearn.model_selection import train_test_split, GridSearchCV, StratifiedKFold
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix
from sklearn.pipeline import Pipeline
import pickle
import plotly.express as px
import plotly.graph_objs as go
from plotly.subplots import make_subplots
from sklearn.manifold import TSNE
import plotly.figure_factory as ff
from io import BytesIO
import mysql.connector
import os

app = Flask(__name__)

# Global variables
data_df = None
best_model = None
gender_encoder = None
status_encoder = None
X_train, X_test, y_train, y_test = None, None, None, None
y_pred = None

# Database connection
def get_db_connection():
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='',
        database='data_gizi'
    )
    return connection

def load_data():
    connection = get_db_connection()
    query = """
    SELECT 
        Nama, Jenis_Kelamin, Berat_Badan_Saat_Lahir_kg, Tinggi_Badan_Saat_Lahir_cm,
        Berat_Badan_Saat_Ini_kg, Tinggi_Badan_Saat_Ini_cm, Usia_bulan,
        Z_Score_Berat_Badan, Z_Score_Tinggi_Badan, Klasifikasi_Z_score_TB,
        Klasifikasi_Z_score_BB, Status_Gizi
    FROM children_nutrition
    """
    data_df = pd.read_sql(query, connection)
    connection.close()
    return data_df

@app.route('/')
def index():
    # Render index page with available visualizations
    
    return render_template('index.html')

@app.route('/train', methods=['GET'])
def train():
    global data_df, best_model, gender_encoder, status_encoder, X_train, X_test, y_train, y_test

    # Load and encode data from database
    data_df = load_data()
    data_df, gender_encoder, status_encoder = encode_columns(data_df)

    # Split the data into training and testing sets
    X_train, X_test, y_train, y_test = split_data(data_df)

    # Train the model using the training data
    best_model, grid_search = train_model(X_train, y_train)

    # Save the model and encoders to disk
    model_path = "svm_model.pkl"
    with open(model_path, 'wb') as model_file:
        pickle.dump({
            'model': best_model,
            'gender_encoder': gender_encoder,
            'status_encoder': status_encoder
        }, model_file)

    # Predict on the test set to evaluate the model
    y_pred = best_model.predict(X_test)

    # Generate evaluation report with the correct labels
    labels = np.unique(y_test)  # Ensure only the labels present in y_test are used
    accuracy = accuracy_score(y_test, y_pred)
    class_report = classification_report(y_test, y_pred, target_names=status_encoder.inverse_transform(labels), labels=labels)
    conf_matrix = confusion_matrix(y_test, y_pred, labels=labels)

    # Generate t-SNE for visualization
    tsne = TSNE(n_components=2, random_state=42)
    X_tsne = tsne.fit_transform(X_test)
    
    tsne_fig = px.scatter(
        x=X_tsne[:, 0], y=X_tsne[:, 1],
        color=status_encoder.inverse_transform(y_pred),
        labels={'color': 'Predicted Status Gizi'},
        title='t-SNE Visualization of Predicted Status Gizi'
    )
    tsne_html = tsne_fig.to_html(full_html=False)

    # Render the results in HTML with t-SNE plot
    return render_template('index.html', tsne_plot=tsne_html)

@app.route('/predict', methods=['GET'])
def predict():
    global best_model, gender_encoder, status_encoder
    
    # Load the saved model
    model_info = load_model('svm_model.pkl')
    if model_info is None:
        return jsonify({"error": "Model not found."}), 404
    
    best_model = model_info['model']
    gender_encoder = model_info['gender_encoder']
    status_encoder = model_info['status_encoder']

    # Load data from the 'data_uji' table in MySQL database
    connection = get_db_connection()
    query = """
    SELECT 
        Nama, Jenis_Kelamin, Berat_Badan_Saat_Lahir_kg, Tinggi_Badan_Saat_Lahir_cm,
        Berat_Badan_Saat_Ini_kg, Tinggi_Badan_Saat_Ini_cm, Usia_bulan,
        Z_Score_Berat_Badan, Z_Score_Tinggi_Badan
    FROM data_uji
    """
    test_df = pd.read_sql(query, connection)
    connection.close()
    
    # Encode the 'Jenis_Kelamin' column using the encoder loaded from the model
    test_df['Jenis_Kelamin'] = gender_encoder.transform(test_df['Jenis_Kelamin'])
    
    # Select features for prediction
    X_test = test_df[['Jenis_Kelamin', 'Berat_Badan_Saat_Lahir_kg', 'Tinggi_Badan_Saat_Lahir_cm',
                      'Berat_Badan_Saat_Ini_kg', 'Tinggi_Badan_Saat_Ini_cm', 'Usia_bulan',
                      'Z_Score_Berat_Badan', 'Z_Score_Tinggi_Badan']]
    
    # Predict nutritional status using the loaded SVM model
    y_pred = best_model.predict(X_test)
    
    # Inverse transform the predicted labels to get readable output
    test_df['Predicted_Status_Gizi'] = status_encoder.inverse_transform(y_pred)
    
    # Convert the results to JSON format
    result_json = test_df[['Nama','Jenis_Kelamin','Usia_bulan', 'Predicted_Status_Gizi']].to_json(orient='records')
    
    return result_json, 200

@app.route('/data-uji', methods=['GET'])
def view_data_uji():
    connection = get_db_connection()
    query = """
    SELECT 
        Nama, Jenis_Kelamin, Berat_Badan_Saat_Lahir_kg, Tinggi_Badan_Saat_Lahir_cm,
        Berat_Badan_Saat_Ini_kg, Tinggi_Badan_Saat_Ini_cm, Usia_bulan,
        Z_Score_Berat_Badan, Z_Score_Tinggi_Badan, Klasifikasi_Z_score_TB,
        Klasifikasi_Z_score_BB
    FROM data_uji
    """
    data_uji_df = pd.read_sql(query, connection)
    connection.close()

    # Convert the DataFrame to JSON
    data_uji_json = data_uji_df.to_dict(orient='records')
    
    return jsonify(data_uji_json)

@app.route('/data-latih', methods=['GET'])
def view_data_latih():
    connection = get_db_connection()
    query = """
    SELECT 
        Nama, Jenis_Kelamin, Berat_Badan_Saat_Lahir_kg, Tinggi_Badan_Saat_Lahir_cm,
        Berat_Badan_Saat_Ini_kg, Tinggi_Badan_Saat_Ini_cm, Usia_bulan,
        Z_Score_Berat_Badan, Z_Score_Tinggi_Badan, Klasifikasi_Z_score_TB,
        Klasifikasi_Z_score_BB, Status_Gizi
    FROM children_nutrition
    """
    data_latih_df = pd.read_sql(query, connection)
    connection.close()

    # Convert the DataFrame to JSON
    data_latih_json = data_latih_df.to_dict(orient='records')
    
    return jsonify(data_latih_json)


# Helper functions
def check_and_reshape_y(y):
    # Jika y tidak berbentuk 1d, lakukan reshape
    if len(y.shape) != 1:
        y = y.ravel()  # Mengubah array 2D menjadi 1D jika perlu
    return y

def load_model(model_path="svm_model.pkl"):
    try:
        with open(model_path, 'rb') as model_file:
            model_data = pickle.load(model_file)
        return model_data
    except FileNotFoundError:
        return None

def encode_columns(df):
    gender_encoder = LabelEncoder()
    status_encoder = LabelEncoder()
    df['Jenis_Kelamin'] = gender_encoder.fit_transform(df['Jenis_Kelamin'])
    df['Status_Gizi'] = status_encoder.fit_transform(df['Status_Gizi'])
    return df, gender_encoder, status_encoder

def split_data(df):
    X = df[['Jenis_Kelamin', 'Berat_Badan_Saat_Lahir_kg', 'Tinggi_Badan_Saat_Lahir_cm',
            'Berat_Badan_Saat_Ini_kg', 'Tinggi_Badan_Saat_Ini_cm', 'Usia_bulan',
            'Z_Score_Berat_Badan', 'Z_Score_Tinggi_Badan']]
    y = df['Status_Gizi']
    
    # Pastikan y berbentuk 1d sebelum split
    y = check_and_reshape_y(y)
    
    return train_test_split(X, y, test_size=0.2, random_state=42, stratify=y)


def train_model(X_train, y_train):
    # Pastikan y_train berbentuk 1d
    y_train = check_and_reshape_y(y_train)
    
    pipeline = Pipeline([
        ('scaler', StandardScaler()),
        ('svm', SVC(random_state=42))
    ])
    param_grid = {
        'svm__C': [0.1, 1, 10, 100],
        'svm__gamma': ['scale', 'auto', 0.1, 1],
        'svm__kernel': ['linear', 'rbf', 'poly']
    }
    cv_strategy = StratifiedKFold(n_splits=3)
    grid_search = GridSearchCV(pipeline, param_grid, cv=cv_strategy, n_jobs=-1, verbose=1)
    grid_search.fit(X_train, y_train)
    return grid_search.best_estimator_, grid_search

if __name__ == '__main__':
    app.run(debug=True)

