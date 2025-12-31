import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:image_picker/image_picker.dart';

final imageProvider = ChangeNotifierProvider<ImageProvider>((ref) {
  return ImageProvider();
});

class ImageProvider extends ChangeNotifier {
  File? selectedImage;
  final _imagePicker = ImagePicker();

  Future<void> pickImage() async {
    XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage = File(image.path);
      notifyListeners();
    } else {
      print('Plese select an image');
    }
  }
}
