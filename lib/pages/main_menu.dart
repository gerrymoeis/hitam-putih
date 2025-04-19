import 'package:flutter/material.dart';
import '../models/app_state.dart';
import '../utils/app_theme.dart';
import 'opening_page.dart';
import 'sub_menu.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppState appState = AppState();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SubMenuPage()),
              );
            },
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: appState,
        builder: (context, _) {
          if (appState.originalImageBytes == null || appState.blackAndWhiteImageBytes == null) {
            return const Center(
              child: Text('No image processed yet'),
            );
          }
          
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Result Header
                  const Card(
                    margin: EdgeInsets.only(bottom: AppConstants.defaultPadding),
                    child: Padding(
                      padding: EdgeInsets.all(AppConstants.defaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hasil Konversi',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: AppConstants.smallPadding),
                          Text(
                            'Berikut adalah perbandingan gambar asli dengan hasil konversi hitam putih.',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Before - After Comparison
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              'Sebelum',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: AppConstants.smallPadding),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
                              child: Image.memory(
                                appState.originalImageBytes!,
                                height: 200,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: AppConstants.defaultPadding),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              'Sesudah',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: AppConstants.smallPadding),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
                              child: Image.memory(
                                appState.blackAndWhiteImageBytes!,
                                height: 200,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: AppConstants.largePadding),
                  
                  // Full Image View
                  const Text(
                    'Hasil Hitam Putih (Ukuran Penuh):',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: AppConstants.smallPadding),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
                    child: Image.memory(
                      appState.blackAndWhiteImageBytes!,
                      fit: BoxFit.contain,
                    ),
                  ),
                  
                  const SizedBox(height: AppConstants.largePadding),
                  
                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => const OpeningPage()),
                            );
                          },
                          icon: const Icon(Icons.refresh),
                          label: const Text('Konversi Gambar Baru'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}