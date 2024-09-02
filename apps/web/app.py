from flask import Flask, request, jsonify, send_file, render_template, Response
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder, StandardScaler
from sklearn.svm import SVC
import joblib
import matplotlib.pyplot as plt
import seaborn as sns
import os
from flask_cors import CORS
import json
import numpy as np
import mysql.connector
from mysql.connector import pooling
import hashlib
import base64
from sqlalchemy import create_engine
import subprocess


app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = 'static/upload'
# Konfigurasi database MySQL
dbconfig = {
    "host": "localhost",
    "user": "root",
    "password": "",
    "database": "data_mbkm",
    "port": 3306
}
CORS(app)

db_pool = pooling.MySQLConnectionPool(
    pool_name="mypool",
    pool_size=5,
    **dbconfig
)

def get_db_connection():
    return db_pool.get_connection()
def load_data(data_path):
    """Memuat data dari file Excel"""
    return pd.read_excel(data_path)

def preprocess_data(data, features, target):
    """Melakukan preprocessing pada data: enkoding dan normalisasi"""
    data[features] = data[features].astype(str)
    
    label_encoders = {}
    for col in features + [target]:
        le = LabelEncoder()
        data[col] = le.fit_transform(data[col])
        label_encoders[col] = le

    # Simpan encoder
    joblib.dump(label_encoders, 'label_encoders.pkl')

    X = data[features]
    y = data[target]

    scaler = StandardScaler()
    X_scaled = scaler.fit_transform(X)

    # Simpan scaler
    joblib.dump(scaler, 'scaler.pkl')

    return X_scaled, y

def train_model(X, y):
    """Melatih model SVM dan menyimpan model yang telah dilatih"""
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    svm_model = SVC(kernel='linear', random_state=42)
    svm_model.fit(X_train, y_train)
    joblib.dump(svm_model, 'svm_model_mbkm.pkl')

    # Simpan data latih dan uji
    save_visualization(X_train, y_train, 'static/train_result_chart/train_chart.png')
    save_visualization(X_test, y_test, 'static/testing_result_chart/test_chart.png')

def encode_test_data(test_data, label_encoders):
    """Mengenkode data uji menggunakan encoder yang telah dilatih"""
    encoded_test_data = test_data.copy()
    for col in encoded_test_data.columns:
        if col in label_encoders:
            le = label_encoders[col]
            encoded_test_data[col] = encoded_test_data[col].apply(
                lambda x: le.transform([x])[0] if x in le.classes_ else le.transform([le.classes_[0]])[0]
            )
    return encoded_test_data

def normalize_data(encoded_test_data, scaler):
    """Menormalisasi data uji menggunakan scaler yang telah dilatih"""
    for feature in scaler.feature_names_in_:
        if feature not in encoded_test_data.columns:
            encoded_test_data[feature] = 0
    encoded_test_data = encoded_test_data[scaler.feature_names_in_]
    return scaler.transform(encoded_test_data)

def save_visualization(X, y, file_path):
    """Menyimpan visualisasi data"""
    plt.figure(figsize=(10, 6))
    sns.scatterplot(x=X[:, 0], y=X[:, 1], hue=y, palette='viridis')
    plt.savefig(file_path)
    plt.close()

def plot_count(data, column, title, ax):
    """Membuat plot jumlah kategori"""
    category_mapping = {category: i for i, category in enumerate(data[column].unique(), start=1)}
    data['category_number'] = data[column].map(category_mapping)
    sns.countplot(x='category_number', data=data, ax=ax)
    ax.set_title(title)
    
    # Create a custom legend
    handles = [plt.Line2D([0], [0], marker='o', color=ax.patches[i].get_facecolor(), linestyle='') 
               for i, category in enumerate(category_mapping)]
    labels = [f"{num}: {cat}" for cat, num in category_mapping.items()]
    
    ax.legend(handles=handles, title=column, loc='center left', bbox_to_anchor=(1, 0.5), labels=labels)
    ax.set_xlabel('Category Number')
def encrypt_filename(filename):
    """ Encrypt the filename using SHA256 """
    sha256 = hashlib.sha256()
    sha256.update(filename.encode('utf-8'))
    encrypted_filename = sha256.hexdigest()
    return encrypted_filename + os.path.splitext(filename)[1]
@app.route('/train', methods=['GET'])
def train():
    # Memuat data
    data_path = request.args.get('data_path', 'data.xlsx')  # Ganti dengan path file Anda
    data = load_data(data_path)

    # Fitur dan target yang relevan
    features = [
        'status_kemahasiswaan', 'pernah_ikut_mbmk', 'pernah_mbkm_apapun', 
        'performa_ipk', 'nilai_ipk', 'ikut_organisasi', 'jumlah_organisasi', 
        'scan_ktp', 'upload_sertifikat', 'upload_cv', 'upload_surat_rekomendasi'
    ]
    target = 'lolos_mbkm'

    # Preprocessing data
    X_scaled, y = preprocess_data(data, features, target)

    # Melatih model
    train_model(X_scaled, y)

    return jsonify({"message": "Model training complete. Model saved."})

@app.route('/predict', methods=['GET'])
def predict():
    # Memuat data uji
    test_data_path = request.args.get('test_data_path', 'test.xlsx')  # Ganti dengan path file Anda
    test_data = load_data(test_data_path)

    # Ekstrak data asli untuk penggabungan nanti
    original_test_data = test_data[['nama', 'nim', 'jurusan', 'status_kemahasiswaan']].copy()
    test_data = test_data.drop(columns=['nama', 'nim', 'jurusan'])

    # Konversi semua nilai ke string untuk menangani tipe campuran
    test_data = test_data.astype(str)

    # Muat encoder dan scaler
    label_encoders = joblib.load('label_encoders.pkl')  # Ganti dengan path file Anda
    scaler = joblib.load('scaler.pkl')  # Ganti dengan path file Anda

    # Enkoding data uji
    encoded_test_data = encode_test_data(test_data, label_encoders)

    # Normalisasi data uji
    encoded_test_data_scaled = normalize_data(encoded_test_data, scaler)

    # Muat model yang telah dilatih
    svm_model = joblib.load('svm_model_mbkm.pkl')  # Ganti dengan path file Anda

    # Prediksi
    predictions = svm_model.predict(encoded_test_data_scaled)
    print("SVM Predictions:", predictions)

    # Gabungkan dengan data asli untuk output
    original_test_data['lolos_mbkm'] = predictions
    original_test_data['lolos_mbkm'] = original_test_data['lolos_mbkm'].apply(lambda x: 'Lolos' if x == 1 else 'Tidak Lolos')

    # Simpan data uji dengan prediksi
    result_file_path = 'static/result/hasil.xlsx'  # Ganti dengan path file Anda
    original_test_data.to_excel(result_file_path, index=False)

    # Membuat grid plot
    fig, axes = plt.subplots(2, 2, figsize=(16, 12))
    plot_count(original_test_data, 'lolos_mbkm', 'Total Lolos MBKM', axes[0, 0])
    if 'jenis_kelamin' in original_test_data.columns:
        plot_count(original_test_data, 'jenis_kelamin', 'Lolos MBKM Berdasarkan Jenis Kelamin', axes[0, 1])
    if 'jurusan' in original_test_data.columns:
        plot_count(original_test_data, 'jurusan', 'Lolos MBKM Berdasarkan Jurusan', axes[1, 0])
    if 'status_kemahasiswaan' in original_test_data.columns:
        plot_count(original_test_data, 'status_kemahasiswaan', 'Lolos MBKM Berdasarkan Status Kemahasiswaan', axes[1, 1])
    plt.tight_layout()
    grid_plot_path = 'static/result/grid_plot.png'
    plt.savefig(grid_plot_path)
    plt.close()

    # Mengumpulkan data kategori untuk JSON response
    category_counts = {
        "total_lolos_mbkm": original_test_data['lolos_mbkm'].value_counts().to_dict()
    }
    if 'jenis_kelamin' in original_test_data.columns:
        category_counts["jenis_kelamin"] = original_test_data.groupby('jenis_kelamin')['lolos_mbkm'].value_counts().unstack().fillna(0).to_dict()
    if 'jurusan' in original_test_data.columns:
        category_counts["jurusan"] = original_test_data.groupby('jurusan')['lolos_mbkm'].value_counts().unstack().fillna(0).to_dict()
    if 'status_kemahasiswaan' in original_test_data.columns:
        category_counts["status_kemahasiswaan"] = original_test_data.groupby('status_kemahasiswaan')['lolos_mbkm'].value_counts().unstack().fillna(0).to_dict()

    # Kembalikan hasil dalam format JSON
    result_json = original_test_data.to_dict(orient='records')

    return jsonify({
        "message": "Predictions saved",
        "results": result_json,
        "file_path": result_file_path,
        "grid_plot": grid_plot_path,
        "category_counts": category_counts
    })

@app.route('/load_data', methods=['GET'])
def load_data_route():
    data_path = request.args.get('data_path', 'data.xlsx')  # Ganti dengan path file Anda
    try:
        print("Loading data from:", data_path)  # Logging data path
        data = load_data(data_path)
        data = data.replace({np.nan: None})  # Mengganti NaN dengan None
        data_json = data.to_dict(orient='records')
        response = {
            "status": "success",
            "data": data_json
        }
        print("Data loaded successfully")  # Logging success message
        return Response(
            response=json.dumps(response),
            mimetype='application/json'
        )
    except Exception as e:
        print("Error loading data:", str(e))  # Logging error message
        response = {
            "status": "error",
            "message": str(e)
        }
        return Response(
            response=json.dumps(response),
            mimetype='application/json'
        )

@app.route('/train_result_chart', methods=['GET'])
def train_result_chart():
    file_path = 'static/train_result_chart/train_chart.png'
    return send_file(file_path, mimetype='image/png')

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/add_data', methods=['POST'])
def add_data():
    try:
        # Ambil data dari formulir
        data = request.form

        # Ambil file dari request
        files = {
            'scan_ktp': request.files.get('scan_ktp'),
            'upload_sertifikat': request.files.get('upload_sertifikat'),
            'upload_cv': request.files.get('upload_cv'),
            'upload_surat_rekomendasi': request.files.get('upload_surat_rekomendasi')
        }

        file_paths = {}
        for key, file in files.items():
            if file:
                # Enkripsi nama file
                encrypted_filename = encrypt_filename(file.filename)
                # Simpan file
                file_path = os.path.join(app.config['UPLOAD_FOLDER'], encrypted_filename)
                file.save(file_path)
                file_paths[key] = encrypted_filename
            else:
                file_paths[key] = None

        # Ambil koneksi dari pool
        connection = get_db_connection()
        cursor = connection.cursor()

        # Query untuk memasukkan data ke database
        add_data_query = """
            INSERT INTO mahasiswa_data (nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun, lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, upload_sertifikat, upload_cv, upload_surat_rekomendasi)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """

        # Eksekusi query dengan data
        cursor.execute(add_data_query, (
            data.get('nama'),
            data.get('nim'),
            data.get('jurusan'),
            data.get('status_kemahasiswaan'),
            data.get('pernah_ikut_mbmk'),
            data.get('pernah_mbkm_apapun'),
            data.get('lolos_mbkm'),
            data.get('performa_ipk'),
            data.get('nilai_ipk'),
            data.get('ikut_organisasi'),
            data.get('jumlah_organisasi'),
            file_paths.get('scan_ktp'),
            file_paths.get('upload_sertifikat'),
            file_paths.get('upload_cv'),
            file_paths.get('upload_surat_rekomendasi')
        ))

        connection.commit()
        cursor.close()
        connection.close()

        return jsonify({"message": "Data added successfully!"}), 201

    except Exception as e:
        print(e)
        return jsonify({"message": "Failed to add data"}), 500

@app.route('/svm_predict', methods=['GET'])
def svm_predict():
    try:
        # 1. Ambil data dari database
        query = """
        SELECT id_data,
               nama,
               nim,
               jurusan,
               status_kemahasiswaan,
               pernah_ikut_mbmk,
               pernah_mbkm_apapun,
               performa_ipk,
               nilai_ipk,
               ikut_organisasi,
               jumlah_organisasi,
               CASE
                   WHEN scan_ktp IS NOT NULL AND scan_ktp != '' THEN 'Ada'
                   ELSE 'Tidak Ada'
               END AS scan_ktp,
               CASE
                   WHEN upload_sertifikat IS NOT NULL AND upload_sertifikat != '' THEN 'Ada'
                   ELSE 'Tidak Ada'
               END AS upload_sertifikat,
               CASE
                   WHEN upload_cv IS NOT NULL AND upload_cv != '' THEN 'Ada'
                   ELSE 'Tidak Ada'
               END AS upload_cv,
               CASE
                   WHEN upload_surat_rekomendasi IS NOT NULL AND upload_surat_rekomendasi != '' THEN 'Ada'
                   ELSE 'Tidak Ada'
               END AS upload_surat_rekomendasi
        FROM mahasiswa_data;
        """
        engine = create_engine('mysql+mysqlconnector://root:@localhost/data_mbkm')
        with engine.connect() as connection:
            test_data = pd.read_sql(query, connection)

        # 2. Muat encoder dan scaler
        label_encoders = joblib.load('label_encoders.pkl')
        scaler = joblib.load('scaler.pkl')
        svm_model = joblib.load('svm_model_mbkm.pkl')

        # 3. Preprocessing data
        features = [
            'status_kemahasiswaan', 'pernah_ikut_mbmk', 'pernah_mbkm_apapun',
            'performa_ipk', 'nilai_ipk', 'ikut_organisasi', 'jumlah_organisasi',
            'scan_ktp', 'upload_sertifikat', 'upload_cv', 'upload_surat_rekomendasi'
        ]

        # Encode categorical variables
        encoded_test_data = test_data.copy()
        for col in features:
            if col in encoded_test_data.columns:
                le = label_encoders.get(col)
                if le:
                    encoded_test_data[col] = encoded_test_data[col].apply(
                        lambda x: le.transform([x])[0] if x in le.classes_ else le.transform([le.classes_[0]])[0]
                    )

        # Menyesuaikan kolom data dengan scaler
        for feature in scaler.feature_names_in_:
            if feature not in encoded_test_data.columns:
                encoded_test_data[feature] = 0
        encoded_test_data = encoded_test_data[scaler.feature_names_in_]
        encoded_test_data_scaled = scaler.transform(encoded_test_data)

        # 4. Prediksi
        predictions = svm_model.predict(encoded_test_data_scaled)

        # 5. Gabungkan dengan data asli untuk output
        test_data['lolos_mbkm'] = predictions
        test_data['lolos_mbkm'] = test_data['lolos_mbkm'].apply(lambda x: 'Lolos' if x == 1 else 'Tidak Lolos')

        # 6. Mengumpulkan data kategori untuk JSON response
        category_counts = {
            "total_lolos_mbkm": test_data['lolos_mbkm'].value_counts().to_dict()
        }
        if 'jenis_kelamin' in test_data.columns:
            category_counts["jenis_kelamin"] = test_data.groupby('jenis_kelamin')['lolos_mbkm'].value_counts().unstack().fillna(0).to_dict()
        if 'jurusan' in test_data.columns:
            category_counts["jurusan"] = test_data.groupby('jurusan')['lolos_mbkm'].value_counts().unstack().fillna(0).to_dict()
        if 'status_kemahasiswaan' in test_data.columns:
            category_counts["status_kemahasiswaan"] = test_data.groupby('status_kemahasiswaan')['lolos_mbkm'].value_counts().unstack().fillna(0).to_dict()

        # 7. Kembalikan hasil dalam format JSON
        result_json = test_data.to_dict(orient='records')

        return jsonify({
            "message": "Predictions completed",
            "results": result_json,
            "category_counts": category_counts
        })

    except Exception as e:
        return jsonify({"message": "Error occurred", "error": str(e)}), 500

   
@app.route('/open_excel', methods=['GET'])
def open_excel():
    file_name = "data.xlsx"
    
    # Pastikan file ada sebelum mencoba membukanya
    if os.path.exists(file_name):
        try:
            # Menggunakan perintah `start` untuk membuka file dengan aplikasi default
            subprocess.run(["start", "", file_name], shell=True, check=True)
            return jsonify({"message": "Data Latih Di Buka"}), 200
        except Exception as e:
            return jsonify({"error": str(e)}), 500
    else:
        return jsonify({"error": "File tidak ditemukan."}), 404

@app.route('/load_mahasiswa_data', methods=['GET'])
def load_mahasiswa_data():
    try:
        # Ambil koneksi dari pool
        connection = get_db_connection()
        with connection.cursor(dictionary=True) as cursor:
            query = "SELECT * FROM mahasiswa_data"
            cursor.execute(query)
            data = cursor.fetchall()

        # Tutup koneksi setelah query selesai
        connection.close()

        # Kirim data dalam format JSON
        return jsonify(data)
    except Exception as e:
        print(e)
        return jsonify({"message": "Failed to load data"}), 500

if __name__ == "__main__": 
    app.run(debug=True) 