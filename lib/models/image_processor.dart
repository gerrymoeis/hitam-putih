import 'dart:typed_data';
import 'package:flutter/foundation.dart' show compute;
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

class ImageProcessor {
  static final ImageProcessor _instance = ImageProcessor._internal();
  
  factory ImageProcessor() {
    return _instance;
  }
  
  ImageProcessor._internal();
  
  final ImagePicker _picker = ImagePicker();
  
  Future<Uint8List?> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    
    if (pickedFile != null) {
      return await pickedFile.readAsBytes();
    }
    return null;
  }
  
  Future<Uint8List?> convertToBlackAndWhite(Uint8List imageBytes) async {
    try {
      // Process the image in a separate isolate to avoid UI freezes
      return await compute(_processImage, imageBytes);
    } catch (e) {
      rethrow;
    }
  }
  
  // Static method to process the image in a separate isolate
  static Uint8List _processImage(Uint8List imageBytes) {
    // Decode the image
    final originalImage = img.decodeImage(imageBytes);
    
    if (originalImage == null) {
      throw Exception('Failed to decode image');
    }
    
    // Convert to grayscale
    final blackAndWhiteImage = img.grayscale(originalImage);
    
    // Encode back to PNG
    return Uint8List.fromList(img.encodePng(blackAndWhiteImage));
  }
}
