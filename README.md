# sampoerna-doc
document editor dapp build on internet computer.

### Fitur Utama:
1. **Editor Dokumen Kolaboratif**:
   Pengguna bisa membuat dan mengedit dokumen secara bersamaan, dengan perubahan yang terlihat secara real-time.

2. **Hak Akses & Kontrol Versi**:
   Setiap dokumen punya pengaturan hak akses (view, edit, comment), dan ada versi riwayat untuk mengembalikan dokumen ke versi sebelumnya.

3. **Penyimpanan Terdesentralisasi**:
   Dokumen disimpan di blockchain Internet Computer, yang menjamin keamanan dan ketersediaan data tanpa bergantung pada server terpusat.

4. **Notifikasi & Komentar**:
   Pengguna dapat saling meninggalkan komentar pada dokumen dan mendapatkan notifikasi ketika ada perubahan atau komentar baru.

5. **Enkripsi Dokumen**:
   Dokumen yang dibuat dan disimpan dienkripsi agar hanya orang-orang yang memiliki akses yang dapat membukanya.

6. **Monetisasi**:
   Kamu bisa menambahkan fitur monetisasi, seperti langganan premium untuk fitur tambahan (misalnya lebih banyak penyimpanan, format dokumen khusus, atau kolaborasi dengan lebih banyak pengguna dalam satu dokumen).

### Teknologi yang Dibutuhkan:
1. **Frontend**:
   - Gunakan **React.js** atau **Vue.js** untuk antarmuka pengguna (UI). React.js lebih populer, tetapi Vue.js lebih ringan.
   - Gunakan WebSocket untuk memastikan kolaborasi real-time.

2. **Backend di Internet Computer**:
   - Bangun backend dengan **Motoko** atau **Rust** di atas IC untuk menyimpan dokumen dan menjalankan logika kolaborasi.
   - Gunakan **Canister** untuk menyimpan dokumen pengguna dan pengaturan aksesnya.

3. **Penyimpanan dan Smart Contracts**:
   - Simpan semua dokumen di **Canister**, yang memungkinkan akses terdesentralisasi dan aman.
   - Buat smart contracts untuk mengatur hak akses, riwayat versi, dan monetisasi.

4. **User Authentication**:
   - Gunakan **Internet Identity** untuk mengelola otentikasi pengguna secara terdesentralisasi. Ini akan memungkinkan pengguna untuk login menggunakan biometrik atau perangkat tanpa perlu kata sandi.

5. **Security & Encryption**:
   - Implementasikan **enkripsi ujung-ke-ujung (E2EE)** sehingga hanya kolaborator yang terotorisasi dapat mengakses dokumen.
   - Gunakan protokol aman untuk pengiriman data antar pengguna dan canister.
