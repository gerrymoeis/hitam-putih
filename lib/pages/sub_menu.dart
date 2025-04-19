import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class SubMenuPage extends StatelessWidget {
  const SubMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi & Bantuan'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // About the App
              const Card(
                margin: EdgeInsets.only(bottom: AppConstants.defaultPadding),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tentang Aplikasi',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: AppConstants.smallPadding),
                      Text(
                        'Hitam Putih adalah aplikasi sederhana untuk mengkonversi gambar berwarna menjadi gambar hitam putih (grayscale). Aplikasi ini menggunakan algoritma pengolahan citra untuk mengubah setiap piksel gambar menjadi nilai grayscale yang sesuai.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              
              // How It Works
              const Card(
                margin: EdgeInsets.only(bottom: AppConstants.defaultPadding),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cara Kerja',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: AppConstants.smallPadding),
                      Text(
                        'Aplikasi ini menggunakan formula standar untuk konversi ke grayscale:\n\nGrayscale = 0.299 × Red + 0.587 × Green + 0.114 × Blue\n\nFormula ini memberikan bobot yang berbeda untuk setiap komponen warna (RGB) berdasarkan sensitivitas mata manusia terhadap warna tersebut.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Tips
              const Card(
                margin: EdgeInsets.only(bottom: AppConstants.defaultPadding),
                child: Padding(
                  padding: EdgeInsets.all(AppConstants.defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tips Penggunaan',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: AppConstants.smallPadding),
                      Text(
                        '• Gunakan gambar dengan kontras yang baik untuk hasil terbaik\n• Gambar dengan pencahayaan yang merata akan menghasilkan konversi yang lebih baik\n• Anda dapat menggunakan aplikasi pengeditan foto lain untuk menyesuaikan kontras hasil konversi jika diperlukan',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Credits
              Card(
                margin: const EdgeInsets.only(bottom: AppConstants.defaultPadding),
                child: Padding(
                  padding: const EdgeInsets.all(AppConstants.defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Versi Aplikasi',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: AppConstants.smallPadding),
                      const Text(
                        'Hitam Putih v1.0.0',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: AppConstants.defaultPadding),
                      const Text(
                        '© 2025 Hitam Putih',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: AppConstants.smallPadding),
                      Center(
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1),
                            color: Colors.white,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/logo.png',
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
