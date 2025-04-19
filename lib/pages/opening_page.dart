import 'package:flutter/material.dart';
import '../models/app_state.dart';
import '../models/image_processor.dart';
import '../utils/app_theme.dart';
import 'main_menu.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({super.key});

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> with SingleTickerProviderStateMixin {
  final AppState _appState = AppState();
  final ImageProcessor _imageProcessor = ImageProcessor();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _appState.reset();
    
    // Setup animation
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
      ),
    );
    
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _pickAndProcessImage() async {
    try {
      final imageBytes = await _imageProcessor.pickImage();
      
      if (imageBytes != null) {
        _appState.setOriginalImage(imageBytes);
        _appState.setProcessing(true);
        
        // Process the image
        final bwImageBytes = await _imageProcessor.convertToBlackAndWhite(imageBytes);
        _appState.setBlackAndWhiteImage(bwImageBytes);
        
        if (mounted) {
          // Navigate to main menu
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MainMenuPage()),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error processing image: ${e.toString()}')),
        );
        _appState.setProcessing(false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: Theme.of(context).colorScheme.background,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo and App Name
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Column(
                        children: [
                          // Logo
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                              color: Colors.white,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/logo.png',
                                width: 110,
                                height: 110,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: AppConstants.largePadding),
                          // App Name
                          Text(
                            AppConstants.appName,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: AppConstants.smallPadding),
                          // App Description
                          Text(
                            AppConstants.appDescription,
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 60),
                    
                    // Image Selection Button
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Column(
                        children: [
                          // Instructions
                          const Card(
                            margin: EdgeInsets.only(bottom: AppConstants.largePadding),
                            child: Padding(
                              padding: EdgeInsets.all(AppConstants.defaultPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cara Penggunaan:',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: AppConstants.smallPadding),
                                  Text(
                                    '1. Pilih gambar dari galeri\n2. Aplikasi akan mengkonversi ke hitam putih\n3. Lihat hasil konversi',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          
                          // Button
                          SizedBox(
                            width: double.infinity,
                            child: ListenableBuilder(
                              listenable: _appState,
                              builder: (context, child) {
                                return ElevatedButton.icon(
                                  onPressed: _appState.isProcessing ? null : _pickAndProcessImage,
                                  icon: _appState.isProcessing
                                      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                                      : const Icon(Icons.photo_library),
                                  label: Text(_appState.isProcessing ? 'Memproses...' : 'Pilih Gambar'),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
