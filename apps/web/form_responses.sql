
CREATE TABLE form_responses (
    id_data INT PRIMARY KEY,
    nama VARCHAR(255),
    nim VARCHAR(50),
    jurusan VARCHAR(255),
    status_kemahasiswaan VARCHAR(255),
    pernah_ikut_mbmk VARCHAR(255),
    pernah_mbkm_apapun VARCHAR(255),
    lolos_mbkm VARCHAR(50),
    performa_ipk VARCHAR(255),
    nilai_ipk VARCHAR(10),
    ikut_organisasi VARCHAR(50),
    jumlah_organisasi INT,
    scan_ktp VARCHAR(50),
    upload_sertifikat VARCHAR(50),
    upload_cv VARCHAR(50),
    upload_surat_rekomendasi VARCHAR(50)
);

    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        1, 'Muhammad Athallah Afif', '190170043', 
        'Teknik Informatika', 'Alumni', 
        'Belum Pernah Sama Sekali', 'Belum Pernah Sama Sekali', 
        'Tidak Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.71', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        2, 'Kasihan Muhammad Fajar', '190170066', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Bagus (3.0 Hingga 3.5)', 
        '3,53', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        3, 'Eriska Hamida Sihotang ', '210170169', 
        'Teknik Informatika', 'Mahasiswa Aktif (Sudah di semester 3 Keatas)', 
        'Sudah Pernah', 'Belum Pernah Sama Sekali', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.63', 'Pernah', 
        2, 'Ada', 
        'Tidak Ada', 'Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        4, 'Khairil Anwar', '190170107', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.72', 'Pernah', 
        2, 'Ada', 
        'Ada', 'Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        5, 'Auza Aulia', '190170145', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Belum Pernah Sama Sekali', 
        'Tidak Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.6', 'Pernah', 
        1, 'Tidak Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        6, 'Violita Aditya Zahrah ', '200170130', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.78', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        7, 'Rizki Putra Aulia', '190170109', 
        'Teknik Informatika', 'Semester Akhir', 
        'pernah_ikut_mbmk', 'Pernah', 
        'Lolos', 'Bagus (3.0 Hingga 3.5)', 
        '3.5', 'Pernah', 
        1, 'Tidak Ada', 
        'Ada', 'Ada', 
        'Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        8, 'Rizki Fadhilah Ramadhani', '200170128', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.51', 'Pernah', 
        4, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        9, 'Win Azmi', '190170131', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.75', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        10, 'Moulana Luthfiah', '190170048', 
        'Teknik Informatika', 'Alumni', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.78', 'Pernah', 
        1, 'Ada', 
        'Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        11, 'Cindi Rahayu ', '190170047', 
        'Teknik Informatika', 'Alumni', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.66', 'Tidak Pernah', 
        1, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        12, 'Muhammad Sigra Maulana', '190170139', 
        'Teknik Informatika', 'Semester Akhir', 
        'pernah_ikut_mbmk', 'Belum Pernah Sama Sekali', 
        'Tidak Lolos', 'Bagus (3.0 Hingga 3.5)', 
        '3,24', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        13, 'Fadhlul Rahmat', '190170103', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Bagus (3.0 Hingga 3.5)', 
        '3.6', 'Pernah', 
        1, 'Tidak Ada', 
        'Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        14, 'Rahmat Rizky', '200170114', 
        'Teknik Informatika', 'Semester Akhir', 
        'pernah_ikut_mbmk', 'Pernah', 
        'Lolos', 'Cukup (2.5 Hingga 3.0)', 
        '2,46', 'Tidak Pernah', 
        0, 'Tidak Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        15, 'Julia Fitri Pohan', '190170058', 
        'Teknik Informatika', 'Alumni', 
        'pernah_ikut_mbmk', 'Pernah', 
        'Tidak Lolos', 'Bagus (3.0 Hingga 3.5)', 
        '3.71', 'Pernah', 
        1, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        16, 'Rania Sofia Salsabila', '20017025', 
        'Teknik Informatika', 'Semester Akhir', 
        'pernah_ikut_mbmk', 'Belum Pernah Sama Sekali', 
        'Tidak Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.5', 'Tidak Pernah', 
        0, 'Tidak Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        17, 'M Akbar Husein Srg ', '190170065', 
        'Teknik Informatika', 'Alumni', 
        'Sudah Pernah', 'Belum Pernah Sama Sekali', 
        'Tidak Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.73', 'Pernah', 
        2, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        18, 'Raihan Azkiah ', '190170143', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.6', 'Tidak Pernah', 
        0, 'Tidak Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        19, 'Riski Yanti', '190170002', 
        'Teknik Informatika', 'Alumni', 
        'Belum Pernah Sama Sekali', 'Belum Pernah Sama Sekali', 
        'Tidak Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.75', 'Pernah', 
        1, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        20, 'Khairunnisa ', '180170164', 
        'Teknik Informatika', 'Alumni', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.75', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        21, 'Salsa Hany', '190170142', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.78', 'Pernah', 
        2, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        22, 'Wan Amalia Chaliza Nur ', '190170137', 
        'Teknik Informatika', 'Semester Akhir', 
        'Belum Pernah Sama Sekali', 'Belum Pernah Sama Sekali', 
        'Tidak Lolos', 'Bagus (3.0 Hingga 3.5)', 
        '3.6', 'Tidak Pernah', 
        0, 'Tidak Ada', 
        'Tidak Ada', 'Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        23, 'Rizki Saputra ', '190170095', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Belum Pernah Sama Sekali', 
        'Tidak Lolos', 'Cukup (2.5 Hingga 3.0)', 
        '3.68', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        24, 'Syahfitri Nurahma Aini', '190170064', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Belum Pernah Sama Sekali', 
        'Tidak Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.68', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        25, 'Salma Devi ', '190170151', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Bagus (3.0 Hingga 3.5)', 
        '3.95', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        26, 'Moulana Luthfiah ', '190170048', 
        'Teknik Informatika', 'Alumni', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.78', 'Pernah', 
        1, 'Ada', 
        'Ada', 'Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        27, 'Aulia Azzahra Ma''Aruf Lubis', '190170071', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Pernah', 
        'Tidak Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.67', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        28, 'Faraliana', '200180016', 
        'Sistem Informasi', 'Semester Akhir', 
        'Sudah Pernah', 'Belum Pernah Sama Sekali', 
        'Tidak Lolos', 'Tidak Ada Keterangan', 
        'nan', 'Tidak Pernah', 
        0, 'Tidak Ada', 
        'Tidak Ada', 'Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        29, 'Mahesa Anabrang Reglisalo ', '190170099', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '4', 'Pernah', 
        1, 'Tidak Ada', 
        'Tidak Ada', 'Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        30, 'Lutfiah Adifa', '190170052', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Belum Pernah Sama Sekali', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3,91', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        31, 'Lutfiah Adifa', '190170052', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Belum Pernah Sama Sekali', 
        'Tidak Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3,78', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        32, 'Suryani Berutu', '190170044', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Belum Pernah Sama Sekali', 
        'Tidak Lolos', 'Bagus (3.0 Hingga 3.5)', 
        '3.5', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        33, 'Putri Nurhidayanti', '190170051', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Bagus (3.0 Hingga 3.5)', 
        '3.38', 'Tidak Pernah', 
        0, 'Ada', 
        'Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        34, 'Putri Nurhidayanti', '190170051', 
        'Teknik Informatika', 'Semester Akhir', 
        'pernah_ikut_mbmk', 'Pernah', 
        'Lolos', 'Bagus (3.0 Hingga 3.5)', 
        '3.38', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Ada', 
        'Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        35, 'Zainul Anwar Adi Putra', '200170190', 
        'Teknik Informatika', 'Semester Akhir', 
        'Tidak Tertarik Sama Sekali Untuk Ikut', 'Belum Pernah Sama Sekali', 
        'Tidak Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.7', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        36, 'Dimas Sari Afriza Lubis', '190170053', 
        'Teknik Informatika', 'Mahasiswa Aktif (Sudah di semester 3 Keatas)', 
        'Belum Pernah Sama Sekali', 'Belum Pernah Sama Sekali', 
        'Tidak Lolos', 'Bagus (3.0 Hingga 3.5)', 
        '3.5', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        37, 'Sukma Rizki', '200170101', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Bagus (3.0 Hingga 3.5)', 
        '3.6', 'Pernah', 
        1, 'Tidak Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        38, 'Bella Purnama Sari', '190170035', 
        'Teknik Informatika', 'Semester Akhir', 
        'Belum Pernah Sama Sekali', 'Belum Pernah Sama Sekali', 
        'Tidak Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3,67', 'Pernah', 
        1, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        39, 'Naqiatul Miska', '190170034', 
        'Teknik Informatika', 'Alumni', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.92', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        40, 'Cut Syahira Salsabila ', '200170166', 
        'Teknik Informatika', 'Semester Akhir', 
        'pernah_ikut_mbmk', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3,68', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Ada', 
        'Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        41, 'Dimas Sari Afriza Lubis', '190170053', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Belum Pernah Sama Sekali', 
        'Tidak Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.69', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        42, 'Dimas Sari Afriza Lubis', '190170053', 
        'Teknik Informatika', 'Mahasiswa Aktif (Sudah di semester 3 Keatas)', 
        'Sudah Pernah', 'Pernah', 
        'Tidak Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.65', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        43, 'Aldy Anugrah Pohan', '200170163', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3,74', 'Tidak Pernah', 
        0, 'Tidak Ada', 
        'Ada', 'Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        44, 'Munawarah', '190170025', 
        'Teknik Informatika', 'Semester Akhir', 
        'Belum Pernah Sama Sekali', 'Belum Pernah Sama Sekali', 
        'Tidak Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3,63', 'Tidak Pernah', 
        0, 'Tidak Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        45, 'Aldy Anugrah Pohan', '200170163', 
        'Teknik Informatika', 'Semester Akhir', 
        'pernah_ikut_mbmk', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3,74', 'Tidak Pernah', 
        0, 'Tidak Ada', 
        'Tidak Ada', 'Ada', 
        'Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        46, 'Khairul Muzakkir Alwy Lubis', '190170062', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3,58', 'Pernah', 
        3, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        47, 'Ita Damayanti', '190170028', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.8', 'Tidak Pernah', 
        0, 'Tidak Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        48, 'Alvin Alvesaldy', '190170078', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3,25', 'Pernah', 
        3, 'Ada', 
        'Tidak Ada', 'Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        49, 'Wira Yudha Raharja', '190170063', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.7', 'Pernah', 
        1, 'Ada', 
        'Ada', 'Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        50, 'Saumina', '190170111', 
        'Teknik Informatika', 'Alumni', 
        'Belum Pernah Sama Sekali', 'Belum Pernah Sama Sekali', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.88', 'Pernah', 
        1, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        51, 'Wahyu Arif Maulana', '190170169', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Bagus (3.0 Hingga 3.5)', 
        '3,60', 'Tidak Pernah', 
        0, 'Tidak Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        52, 'Rifka Khairuna', '210170164', 
        'Teknik Informatika', 'Mahasiswa Aktif (Sudah di semester 3 Keatas)', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.77', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        53, 'Siti Chairani Siregar', '190170102', 
        'Teknik Informatika', 'Semester Akhir', 
        'pernah_ikut_mbmk', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '4', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        54, 'Nadya Syahfitri Damanik', '210170155', 
        'Teknik Informatika', 'Mahasiswa Aktif (Sudah di semester 3 Keatas)', 
        'pernah_ikut_mbmk', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3.76', 'Pernah', 
        1, 'Ada', 
        'Tidak Ada', 'Tidak Ada', 
        'Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        55, 'Novita Darni Siregar', '200170026', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Bagus (3.0 Hingga 3.5)', 
        '3.67', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Ada', 
        'Tidak Ada'
    );
    
    INSERT INTO form_responses (
        id_data, nama, nim, jurusan, status_kemahasiswaan, pernah_ikut_mbmk, pernah_mbkm_apapun,
        lolos_mbkm, performa_ipk, nilai_ipk, ikut_organisasi, jumlah_organisasi, scan_ktp, 
        upload_sertifikat, upload_cv, upload_surat_rekomendasi
    ) VALUES (
        56, 'Nurhamni', '190170050', 
        'Teknik Informatika', 'Semester Akhir', 
        'Sudah Pernah', 'Pernah', 
        'Lolos', 'Sangat Bagus (3.5 Hingga 4.0)', 
        '3,67', 'Tidak Pernah', 
        0, 'Ada', 
        'Tidak Ada', 'Ada', 
        'Tidak Ada'
    );
    