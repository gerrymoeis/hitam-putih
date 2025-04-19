import 'dart:typed_data';
import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  static final AppState _instance = AppState._internal();
  
  factory AppState() {
    return _instance;
  }
  
  AppState._internal();
  
  Uint8List? originalImageBytes;
  Uint8List? blackAndWhiteImageBytes;
  bool isProcessing = false;
  
  void setOriginalImage(Uint8List? bytes) {
    originalImageBytes = bytes;
    notifyListeners();
  }
  
  void setBlackAndWhiteImage(Uint8List? bytes) {
    blackAndWhiteImageBytes = bytes;
    isProcessing = false;
    notifyListeners();
  }
  
  void setProcessing(bool processing) {
    isProcessing = processing;
    notifyListeners();
  }
  
  void reset() {
    originalImageBytes = null;
    blackAndWhiteImageBytes = null;
    isProcessing = false;
    notifyListeners();
  }
}
