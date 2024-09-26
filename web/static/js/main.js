 // Fetch and display Data Latih
 function fetchDataLatih() {
    $.getJSON('/data-latih', function(data) {
        var rows = '';
        var counter = 1;  // Inisialisasi counter
        data.forEach(function(row) {
            rows += '<tr>' +
                '<td>' + 'Sampel ' + counter + '</td>' +  // Ganti Nama dengan "Sampel n"
                '<td>' + row.Jenis_Kelamin + '</td>' +
                '<td>' + (row.Berat_Badan_Saat_Lahir_kg == 0 ? '-' : row.Berat_Badan_Saat_Lahir_kg) + '</td>' +  // Ganti 0 dengan "-"
                '<td>' + (row.Tinggi_Badan_Saat_Lahir_cm == 0 ? '-' : row.Tinggi_Badan_Saat_Lahir_cm) + '</td>' +  // Ganti 0 dengan "-"
                '<td>' + row.Berat_Badan_Saat_Ini_kg + '</td>' +
                '<td>' + row.Tinggi_Badan_Saat_Ini_cm + '</td>' +
                '<td>' + row.Usia_bulan + '</td>' +
                '<td>' + row.Z_Score_Berat_Badan + '</td>' +
                '<td>' + row.Z_Score_Tinggi_Badan + '</td>' +
                '<td>' + row.Status_Gizi + '</td>' +
                '<td><button class="btn btn-danger btn-sm" onclick="hapusDataLatih(\'' + row.id_data + '\')">X</button></td>' +
                '</tr>';
            counter++;  // Increment counter setiap iterasi
        });
        $('#data-latih-table tbody').html(rows);
    });
}


// Fetch and display Data Uji
function fetchDataUji() {
    $.getJSON('/data-uji', function(data) {
        var rows = '';
        data.forEach(function(row) {
            rows += '<tr>' +
                '<td>' + row.Nama + '</td>' +
                '<td>' + row.Jenis_Kelamin + '</td>' +
                '<td>' + row.Berat_Badan_Saat_Lahir_kg + '</td>' +
                '<td>' + row.Tinggi_Badan_Saat_Lahir_cm + '</td>' +
                '<td>' + row.Berat_Badan_Saat_Ini_kg + '</td>' +
                '<td>' + row.Tinggi_Badan_Saat_Ini_cm + '</td>' +
                '<td>' + row.Usia_bulan + '</td>' +
                '<td>' + row.Z_Score_Berat_Badan + '</td>' +
                '<td>' + row.Z_Score_Tinggi_Badan + '</td>' +
                '<td>' + row.Klasifikasi_Z_score_TB + '</td>' +
                '<td>' + row.Klasifikasi_Z_score_BB + '</td>' +
                '<td><button class="btn btn-danger btn-sm" onclick="hapusDataUji(\'' + row.id_data + '\')">X</button></td>' +
                '</tr>';
        });
        $('#data-uji-table tbody').html(rows);
    });
}

function hapusDataLatih(id_data) {
    if (confirm('Apakah Anda yakin ingin menghapus data latih ini?')) {
        $.ajax({
            type: 'POST',
            url: '/hapus-data-latih',
            data: {
                Id_data: id_data
            },
            success: function(response) {
                alert('Data latih berhasil dihapus!');
                fetchDataLatih(); // Refresh tabel setelah penghapusan
            },
            error: function(error) {
                alert('Gagal menghapus data latih: ' + error.responseText);
            }
        });
    }
}

function hapusDataUji(id_data) {
    if (confirm('Apakah Anda yakin ingin menghapus data uji ini?')) {
        $.ajax({
            type: 'POST',
            url: '/hapus-data-uji',
            data: {
                Id_data: id_data
            },
            success: function(response) {
                alert('Data uji berhasil dihapus!');
                fetchDataUji(); // Refresh tabel setelah penghapusan
            },
            error: function(error) {
                alert('Gagal menghapus data uji: ' + error.responseText);
            }
        });
    }
}

// Fetch and display Hasil Prediksi
function fetchHasilPrediksi() {
    $.getJSON('/predict', function(data) {
        var rows = '';
        var statusGiziCounts = {};
        var genderCounts = {};
        var ageGroupCounts = {};

        data.forEach(function(row) {
            // Convert 0 to 'Laki-laki' and 1 to 'Perempuan'
            var gender = row.Jenis_Kelamin === 1 ? 'Laki-laki' : 'Perempuan';

            // Populating the table
            rows += '<tr>' +
                '<td>' + row.Nama + '</td>' +
                '<td>' + gender + '</td>' +
                '<td>' + row.Usia_bulan + '</td>' +
                '<td>' + row.Predicted_Status_Gizi + '</td>' +
                '</tr>';

            // Counting status gizi
            if (statusGiziCounts[row.Predicted_Status_Gizi]) {
                statusGiziCounts[row.Predicted_Status_Gizi]++;
            } else {
                statusGiziCounts[row.Predicted_Status_Gizi] = 1;
            }

            // Counting gender for each status gizi
            if (!genderCounts[row.Predicted_Status_Gizi]) {
                genderCounts[row.Predicted_Status_Gizi] = {
                    'Laki-laki': 0,
                    'Perempuan': 0
                };
            }
            genderCounts[row.Predicted_Status_Gizi][gender]++;

            // Group by age
            var ageGroup = getAgeGroup(row.Usia_bulan);
            if (!ageGroupCounts[row.Predicted_Status_Gizi]) {
                ageGroupCounts[row.Predicted_Status_Gizi] = {
                    '0-12 bulan': 0,
                    '13-24 bulan': 0,
                    '25-36 bulan': 0,
                    '37-48 bulan': 0,
                    '49-60 bulan': 0
                };
            }
            ageGroupCounts[row.Predicted_Status_Gizi][ageGroup]++;
        });

        $('#hasil-prediksi-table tbody').html(rows);

        // Prepare charts
        plotStatusGiziChart(statusGiziCounts);
        plotGenderChart(genderCounts);
        plotAgeGroupChart(ageGroupCounts);
    });
}

// Plot Status Gizi Chart
function plotStatusGiziChart(statusGiziCounts) {
    var labels = Object.keys(statusGiziCounts);
    var values = Object.values(statusGiziCounts);

    var colors = labels.map((label, index) => `hsl(${Math.floor(360 / labels.length * index)}, 70%, 50%)`);

    var data = [{
        x: labels,
        y: values,
        type: 'bar',
        marker: {
            color: colors
        }
    }];

    var layout = {
        title: 'Frekuensi Status Gizi yang Diprediksi',
        xaxis: {
            title: 'Status Gizi'
        },
        yaxis: {
            title: 'Frekuensi'
        }
    };

    Plotly.newPlot('status-gizi-barchart', data, layout);
}

// Plot Gender Chart
function plotGenderChart(genderCounts) {
    var statusGiziLabels = Object.keys(genderCounts);
    var maleCounts = statusGiziLabels.map(status => genderCounts[status]['Laki-laki']);
    var femaleCounts = statusGiziLabels.map(status => genderCounts[status]['Perempuan']);

    var data = [{
            x: statusGiziLabels,
            y: maleCounts,
            name: 'Laki-laki',
            type: 'bar',
            marker: {
                color: 'blue'
            }
        },
        {
            x: statusGiziLabels,
            y: femaleCounts,
            name: 'Perempuan',
            type: 'bar',
            marker: {
                color: 'pink'
            }
        }
    ];

    var layout = {
        title: 'Frekuensi Status Gizi Berdasarkan Jenis Kelamin',
        barmode: 'group',
        xaxis: {
            title: 'Status Gizi'
        },
        yaxis: {
            title: 'Frekuensi'
        }
    };

    Plotly.newPlot('gender-barchart', data, layout);
}

// Plot Age Group Chart
function plotAgeGroupChart(ageGroupCounts) {
    var statusGiziLabels = Object.keys(ageGroupCounts);
    var ageGroups = ['0-12 bulan', '13-24 bulan', '25-36 bulan', '37-48 bulan', '49-60 bulan'];
    var traces = ageGroups.map(group => ({
        x: statusGiziLabels,
        y: statusGiziLabels.map(status => ageGroupCounts[status][group]),
        name: group,
        type: 'bar'
    }));

    var layout = {
        title: 'Frekuensi Status Gizi Berdasarkan Kelompok Usia',
        barmode: 'group',
        xaxis: {
            title: 'Status Gizi'
        },
        yaxis: {
            title: 'Frekuensi'
        }
    };

    Plotly.newPlot('age-group-barchart', traces, layout);
}

// Utility function to group age
function getAgeGroup(usiaBulan) {
    if (usiaBulan <= 12) return '0-12 bulan';
    if (usiaBulan <= 24) return '13-24 bulan';
    if (usiaBulan <= 36) return '25-36 bulan';
    if (usiaBulan <= 48) return '37-48 bulan';
    return '49-60 bulan';
}

function initializeTambahDataLatih() {
    $('#formTambahDataLatih').on('submit', function(e) {
        e.preventDefault();
        var formData = $(this).serialize();

        $.ajax({
            type: 'POST',
            url: '/tambah-data-latih', // Pastikan endpoint ini sudah dibuat di Flask
            data: formData,

            success: function(response) {
                alert('Data berhasil ditambahkan!');
                $('#modalTambahDataLatih').modal('hide');
                fetchDataLatih(); // Refresh tabel data latih setelah penambahan
            },
            error: function(error) {
                alert('Gagal menambahkan data: ' + error.responseText);
            }
        });
    });
}

function initializeTambahDataUji() {
    $('#formTambahDataUji').on('submit', function(e) {
        e.preventDefault();
        var formData = $(this).serialize();

        $.ajax({
            type: 'POST',
            url: '/tambah-data-uji', // Pastikan endpoint ini sudah dibuat di Flask
            data: formData,

            success: function(response) {
                alert('Data uji berhasil ditambahkan!');
                $('#modalTambahDataUji').modal('hide');
                fetchDataUji(); // Refresh tabel data uji setelah penambahan
            },
            error: function(error) {
                alert('Gagal menambahkan data uji: ' + error.responseText);
            }
        });
    });
}

// Contoh mean dan stdDev untuk tinggi badan (TB) dan berat badan (BB) berdasarkan usia


function calculateZScore(value, mean, stdDev) {
    return (value - mean) / stdDev;
}

function classifyZScoreHeight(zScore) {
    if (zScore < -3) {
        return "Sangat Pendek";
    } else if (zScore >= -3 && zScore < -2) {
        return "Pendek";
    } else if (zScore >= -2 && zScore <= 2) {
        return "Normal";
    } else {
        return "Tinggi";
    }
}

function classifyZScoreWeight(zScore) {
    if (zScore < -3) {
        return "Gizi Buruk";
    } else if (zScore >= -3 && zScore < -2) {
        return "Gizi Kurang";
    } else if (zScore >= -2 && zScore <= 1) {
        return "Gizi Baik";
    } else if (zScore > 1 && zScore <= 2) {
        return "Berpotensi Berlebihan";
    } else if (zScore > 2 && zScore <= 3) {
        return "Gizi Lebih";
    } else {
        return "Obesitas";
    }
}

function determineNutritionalStatus(heightClass, weightClass) {
    if (heightClass === "Sangat Pendek") {
        if (weightClass === "Gizi Buruk") {
            return "Gizi Buruk";
        } else if (["Gizi Kurang", "Gizi Baik", "Berpotensi Berlebihan", "Gizi Lebih"].includes(weightClass)) {
            return "Tidak Seimbang";
        } else {
            return "Obesitas";
        }
    } else if (heightClass === "Pendek") {
        if (weightClass === "Gizi Buruk") {
            return "Gizi Buruk";
        } else if (["Gizi Kurang", "Gizi Baik", "Berpotensi Berlebihan", "Gizi Lebih"].includes(weightClass)) {
            return "Tidak Seimbang";
        } else {
            return "Obesitas";
        }
    } else if (heightClass === "Normal") {
        if (weightClass === "Gizi Buruk") {
            return "Gizi Buruk";
        } else if (weightClass === "Gizi Kurang") {
            return "Tidak Seimbang";
        } else if (weightClass === "Gizi Baik") {
            return "Ideal";
        } else if (weightClass === "Berpotensi Berlebihan") {
            return "Berpotensi Berlebihan";
        } else if (weightClass === "Gizi Lebih") {
            return "Gizi Lebih";
        } else {
            return "Obesitas";
        }
    } else if (heightClass === "Tinggi") {
        if (weightClass === "Gizi Buruk") {
            return "Gizi Buruk";
        } else if (["Gizi Kurang", "Gizi Baik"].includes(weightClass)) {
            return "Tidak Seimbang";
        } else if (weightClass === "Berpotensi Berlebihan") {
            return "Berpotensi Berlebihan";
        } else if (weightClass === "Gizi Lebih") {
            return "Gizi Lebih";
        } else {
            return "Obesitas";
        }
    }
}
const meanHeight = {
    0: 49.9,
    1: 54.7,
    2: 58.4,
    3: 61.4,
    4: 63.9,
    5: 65.9,
    6: 67.6,
    7: 68.6,
    8: 69.6,
    9: 70.6,
    10: 71.6,
    11: 72.6,
    12: 73.6,
    13: 74.6,
    14: 75.6,
    15: 76.6,
    16: 77.6,
    17: 78.6,
    18: 79.6,
    19: 80.6,
    20: 81.6,
    21: 82.6,
    22: 83.6,
    23: 84.6,
    24: 85.6,
    25: 86.6,
    26: 87.6,
    27: 88.6,
    28: 89.6,
    29: 90.6,
    30: 91.6,
    31: 92.6,
    32: 93.6,
    33: 94.6,
    34: 95.6,
    35: 96.6,
    36: 97.6,
    37: 98.6,
    38: 99.6,
    39: 100.6,
    40: 101.6,
    41: 102.6,
    42: 103.6,
    43: 104.6,
    44: 105.6,
    45: 106.6,
    46: 107.6,
    47: 108.6,
    48: 109.6,
    49: 110.6,
    50: 111.6,
    51: 112.6,
    52: 113.6,
    53: 114.6,
    54: 115.6,
    55: 116.6,
    56: 117.6,
    57: 118.6,
    58: 119.6,
    59: 120.6
};

const stdDevHeight = {
    0: 3.8,
    1: 4.4,
    2: 4.9,
    3: 5.3,
    4: 5.6,
    5: 5.9,
    6: 6.2,
    7: 6.4,
    8: 6.7,
    9: 6.9,
    10: 7.1,
    11: 7.3,
    12: 7.5,
    13: 7.7,
    14: 7.9,
    15: 8.1,
    16: 8.3,
    17: 8.5,
    18: 8.7,
    19: 8.9,
    20: 9.1,
    21: 9.3,
    22: 9.5,
    23: 9.7,
    24: 9.9,
    25: 10.1,
    26: 10.3,
    27: 10.5,
    28: 10.7,
    29: 10.9,
    30: 11.1,
    31: 11.3,
    32: 11.5,
    33: 11.7,
    34: 11.9,
    35: 12.1,
    36: 12.3,
    37: 12.5,
    38: 12.7,
    39: 12.9,
    40: 13.1,
    41: 13.3,
    42: 13.5,
    43: 13.7,
    44: 13.9,
    45: 14.1,
    46: 14.3,
    47: 14.5,
    48: 14.7,
    49: 14.9,
    50: 15.1,
    51: 15.3,
    52: 15.5,
    53: 15.7,
    54: 15.9,
    55: 16.1,
    56: 16.3,
    57: 16.5,
    58: 16.7,
    59: 16.9
};

const meanWeight = {
    0: 3.3,
    1: 4.5,
    2: 5.6,
    3: 6.4,
    4: 7.0,
    5: 7.5,
    6: 7.9,
    7: 8.3,
    8: 8.6,
    9: 8.9,
    10: 9.2,
    11: 9.4,
    12: 9.6,
    13: 9.9,
    14: 10.1,
    15: 10.3,
    16: 10.5,
    17: 10.7,
    18: 10.9,
    19: 11.1,
    20: 11.3,
    21: 11.5,
    22: 11.7,
    23: 11.9,
    24: 12.2,
    25: 12.4,
    26: 12.5,
    27: 12.7,
    28: 12.9,
    29: 13.1,
    30: 13.3,
    31: 13.5,
    32: 13.7,
    33: 13.9,
    34: 14.1,
    35: 14.3,
    36: 14.5,
    37: 14.7,
    38: 14.9,
    39: 15.1,
    40: 15.3,
    41: 15.5,
    42: 15.7,
    43: 15.9,
    44: 16.1,
    45: 16.3,
    46: 16.5,
    47: 16.7,
    48: 16.9,
    49: 17.1,
    50: 17.3,
    51: 17.5,
    52: 17.7,
    53: 17.9,
    54: 18.1,
    55: 18.3,
    56: 18.5,
    57: 18.7,
    58: 18.9,
    59: 19.1
};

const stdDevWeight = {
    0: 0.5,
    1: 0.7,
    2: 0.8,
    3: 0.9,
    4: 1.0,
    5: 1.1,
    6: 1.2,
    7: 1.3,
    8: 1.4,
    9: 1.5,
    10: 1.6,
    11: 1.7,
    12: 1.8,
    13: 1.9,
    14: 2.0,
    15: 2.1,
    16: 2.2,
    17: 2.3,
    18: 2.4,
    19: 2.5,
    20: 2.6,
    21: 2.7,
    22: 2.8,
    23: 2.9,
    24: 3.0,
    25: 3.1,
    26: 3.2,
    27: 3.3,
    28: 3.4,
    29: 3.5,
    30: 3.6,
    31: 3.7,
    32: 3.8,
    33: 3.9,
    34: 4.0,
    35: 4.1,
    36: 4.2,
    37: 4.3,
    38: 4.4,
    39: 4.5,
    40: 4.6,
    41: 4.7,
    42: 4.8,
    43: 4.9,
    44: 5.0,
    45: 5.1,
    46: 5.2,
    47: 5.3,
    48: 5.4,
    49: 5.5,
    50: 5.6,
    51: 5.7,
    52: 5.8,
    53: 5.9,
    54: 6.0,
    55: 6.1,
    56: 6.2,
    57: 6.3,
    58: 6.4,
    59: 6.5
};

function autoCalculateZScore() {
    // Get the input values
    const usia = parseInt(document.getElementById('usia').value, 10);
    const heightNow = parseFloat(document.getElementById('tinggi_badan_saat_ini').value);
    const weightNow = parseFloat(document.getElementById('berat_badan_saat_ini').value);

    // Get mean and std deviation values based on age
    const meanHeightValue = meanHeight[usia];
    const stdDevHeightValue = stdDevHeight[usia];
    const meanWeightValue = meanWeight[usia];
    const stdDevWeightValue = stdDevWeight[usia];

    // Calculate Z-Scores
    const zScoreHeight = calculateZScore(heightNow, meanHeightValue, stdDevHeightValue);
    const zScoreWeight = calculateZScore(weightNow, meanWeightValue, stdDevWeightValue);

    // Classify Z-Scores
    const heightClass = classifyZScoreHeight(zScoreHeight);
    const weightClass = classifyZScoreWeight(zScoreWeight);

    // Determine nutritional status
    const nutritionalStatus = determineNutritionalStatus(heightClass, weightClass);

    // Update the form fields with calculated values
    document.getElementById('z_score_tb').value = zScoreHeight.toFixed(2);
    document.getElementById('z_score_bb').value = zScoreWeight.toFixed(2);
    document.getElementById('klasifikasi_tb').value = heightClass;
    document.getElementById('klasifikasi_bb').value = weightClass;
    document.getElementById('status_gizi').value = nutritionalStatus;
}

// Tambahkan event listener untuk memicu perhitungan saat data berubah
document.getElementById("usia").addEventListener("input", autoCalculateZScore);
document.getElementById("berat_badan_saat_ini").addEventListener("input", autoCalculateZScore);
document.getElementById("tinggi_badan_saat_ini").addEventListener("input", autoCalculateZScore);

// Attach the autoCalculateZScore function to relevant input fields
document.getElementById('tinggi_badan_saat_ini').addEventListener('input', autoCalculateZScore);
document.getElementById('berat_badan_saat_ini').addEventListener('input', autoCalculateZScore);

function autoCalculateZScoreUji() {
    const age = parseInt(document.getElementById('usia_uji').value, 10);

    const meanHeightValueUji = meanHeight[age]; // Mean height berdasarkan usia
    const stdDevHeightValueUji = stdDevHeight[age]; // Standard deviation height berdasarkan usia
    const meanWeightValueUji = meanWeight[age]; // Mean weight berdasarkan usia
    const stdDevWeightValueUji = stdDevWeight[age]; // Standard deviation weight berdasarkan usia

    // Get the input values
    const heightNowUji = parseFloat(document.getElementById('tinggi_badan_saat_ini_uji').value);
    const weightNowUji = parseFloat(document.getElementById('berat_badan_saat_ini_uji').value);

    // Calculate Z-Scores
    const zScoreHeightUji = calculateZScore(heightNowUji, meanHeightValueUji, stdDevHeightValueUji);
    const zScoreWeightUji = calculateZScore(weightNowUji, meanWeightValueUji, stdDevWeightValueUji);

    // Classify Z-Scores
    const heightClassUji = classifyZScoreHeight(zScoreHeightUji);
    const weightClassUji = classifyZScoreWeight(zScoreWeightUji);

    // Update the form fields with calculated values
    document.getElementById('z_score_tb_uji').value = zScoreHeightUji.toFixed(2);
    document.getElementById('z_score_bb_uji').value = zScoreWeightUji.toFixed(2);
    document.getElementById('klasifikasi_tb_uji').value = heightClassUji;
    document.getElementById('klasifikasi_bb_uji').value = weightClassUji;
}

// Attach event listeners to relevant fields
document.getElementById('usia_uji').addEventListener('input', autoCalculateZScoreUji);
document.getElementById('berat_badan_saat_ini_uji').addEventListener('input', autoCalculateZScoreUji);
document.getElementById('tinggi_badan_saat_ini_uji').addEventListener('input', autoCalculateZScoreUji);


// Load data on page load
$(document).ready(function() {
    initializeTambahDataUji();
    initializeTambahDataLatih();
    fetchDataLatih();
    fetchDataUji();
    fetchHasilPrediksi();
});