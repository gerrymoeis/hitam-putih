# Hitam Putih

<p align="center">
  <img src="assets/logo.png" alt="Hitam Putih Logo" width="120"/>
</p>

![GitHub License](https://img.shields.io/github/license/gerrymoeis/hitam-putih)
![Flutter Version](https://img.shields.io/badge/flutter-3.7.2-blue)
![Platform](https://img.shields.io/badge/platform-android%20%7C%20ios%20%7C%20web-lightgrey)
[![Latest Release](https://img.shields.io/github/v/release/gerrymoeis/hitam-putih?include_prereleases&label=latest%20release)](https://github.com/gerrymoeis/hitam-putih/releases/latest)

Aplikasi konversi gambar ke hitam putih (grayscale) yang sederhana dan mudah digunakan.

## Fitur Aplikasi

- Konversi gambar berwarna menjadi hitam putih (grayscale)
- Antarmuka yang sederhana dan intuitif
- Tampilan sebelum dan sesudah konversi
- Tema monokrom yang elegan

## Struktur Aplikasi

Aplikasi ini terdiri dari 3 halaman utama:

1. **Halaman Pembuka**: Menampilkan logo aplikasi dan tombol untuk memilih gambar
2. **Halaman Menu Utama**: Menampilkan hasil konversi dengan perbandingan sebelum dan sesudah
3. **Halaman Informasi**: Berisi informasi tentang aplikasi dan cara kerjanya

## Cara Build APK

Untuk membuild APK dari aplikasi ini, ikuti langkah-langkah berikut:

```bash
# Pastikan semua dependencies terinstall
flutter pub get

# Build APK (debug version)
flutter build apk --debug

# ATAU build APK (release version)
flutter build apk --release
```

File APK akan tersedia di lokasi berikut:
- Debug APK: `build/app/outputs/flutter-apk/app-debug.apk`
- Release APK: `build/app/outputs/flutter-apk/app-release.apk`

## Cara Menjalankan Aplikasi

### Download Aplikasi

Anda dapat mengunduh versi terbaru aplikasi Hitam Putih dari:

<p align="center">
  <a href="https://github.com/gerrymoeis/hitam-putih/releases/latest">
    <img src="https://img.shields.io/badge/Download-Latest%20Release-blue?style=for-the-badge&logo=github" alt="Download Latest Release" />
  </a>
</p>

### Dari Source Code

```bash
# Pastikan semua dependencies terinstall
flutter pub get

# Jalankan aplikasi di device yang terhubung
flutter run
```

### Dari APK

Cukup install APK yang sudah di-build ke perangkat Android dan jalankan aplikasi seperti biasa.

## Teknologi yang Digunakan

- Flutter & Dart
- Image Processing dengan package `image`
- Image Picker untuk memilih gambar dari galeri

## Pengembangan Lebih Lanjut

Beberapa ide untuk pengembangan aplikasi di masa depan:

- Menambahkan fitur penyesuaian kontras
- Opsi untuk menyimpan hasil konversi ke galeri
- Menambahkan filter hitam putih lainnya (sepia, high contrast, dll)
- Dukungan untuk memilih gambar dari kamera

## GitHub Repository

### Struktur Repository

```
hitam-putih/
├── lib/
│   ├── models/        # Model data dan logika bisnis
│   ├── pages/         # Halaman UI aplikasi
│   └── utils/         # Utilitas dan helper
├── assets/           # Aset aplikasi (gambar, font, dll)
├── android/          # Konfigurasi platform Android
├── ios/              # Konfigurasi platform iOS
└── web/              # Konfigurasi platform Web
```

### Kontribusi

Kontribusi selalu diterima dengan baik! Silakan lihat [CONTRIBUTING.md](CONTRIBUTING.md) untuk panduan kontribusi.

### Lisensi

Proyek ini dilisensikan di bawah [MIT License](LICENSE).
