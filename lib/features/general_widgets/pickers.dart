import 'dart:io';

import 'package:flutter/services.dart';
import 'package:hu_task/core/services/alerts.dart';
import 'package:image_picker/image_picker.dart';

class Picker {
  static Future<File?> pickGalleryImage() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      return image != null ? File(image.path) : null;
    } on PlatformException catch (_) {
      Alerts.showToaster('Something went wrong!');
      return null;
    }
  }

  static Future<File?> capturePhoto() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
      return image != null ? File(image.path) : null;
    } on PlatformException catch (_) {
      Alerts.showToaster('Something went wrong!');
      return null;
    }
  }
}
