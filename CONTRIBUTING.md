# Panduan Kontribusi

Terima kasih telah mempertimbangkan untuk berkontribusi pada proyek Hitam Putih! Berikut adalah panduan untuk membantu Anda berkontribusi.

## Proses Kontribusi

1. Fork repositori ini
2. Clone fork Anda ke mesin lokal Anda
3. Buat branch baru untuk fitur atau perbaikan Anda:
   ```bash
   git checkout -b feature/nama-fitur
   ```
   atau
   ```bash
   git checkout -b fix/nama-perbaikan
   ```
4. Lakukan perubahan yang diperlukan dan commit:
   ```bash
   git commit -m "Deskripsi perubahan yang dilakukan"
   ```
5. Push ke branch Anda:
   ```bash
   git push origin feature/nama-fitur
   ```
6. Buat Pull Request dari fork Anda ke repositori utama

## Standar Kode

- Gunakan [Effective Dart](https://dart.dev/guides/language/effective-dart) sebagai panduan gaya kode
- Pastikan kode Anda diformat dengan `flutter format .`
- Jalankan analisis kode dengan `flutter analyze` dan pastikan tidak ada masalah
- Tambahkan komentar untuk kode yang kompleks
- Tulis nama variabel dan fungsi yang deskriptif

## Pelaporan Bug

Jika Anda menemukan bug, silakan buat issue baru dengan informasi berikut:

- Judul yang jelas dan deskriptif
- Langkah-langkah untuk mereproduksi bug
- Perilaku yang diharapkan
- Perilaku yang sebenarnya terjadi
- Screenshot (jika memungkinkan)
- Informasi perangkat dan versi Flutter

## Permintaan Fitur

Jika Anda memiliki ide untuk fitur baru, silakan buat issue baru dengan label "enhancement" dan berikan:

- Deskripsi fitur yang diinginkan
- Alasan mengapa fitur ini akan bermanfaat
- Contoh implementasi (jika memungkinkan)

## Pull Requests

- Pastikan PR Anda memiliki judul yang jelas dan deskriptif
- Jelaskan perubahan yang Anda lakukan dan alasannya
- Pastikan PR Anda hanya berisi satu perubahan logis (gunakan PR terpisah untuk perubahan yang tidak terkait)
- Pastikan semua tes berjalan dengan baik
- Pastikan kode Anda diformat dengan baik

## Lisensi

Dengan berkontribusi pada proyek ini, Anda setuju bahwa kontribusi Anda akan dilisensikan di bawah [MIT License](LICENSE).
