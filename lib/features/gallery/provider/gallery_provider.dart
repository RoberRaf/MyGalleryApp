import 'package:flutter/material.dart';
import 'package:hu_task/features/gallery/data/repo/gallery_repo.dart';

class GalleryProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<String> images = [];

  Future<void> getImages() async {
    final result = await GalleryRepo.getImages();
    if (result != null) {
      images = result.map((e) => e.toString()).toList();
    }
    notifyListeners();
  }

  Future<bool> uploadImage(String image) async {
    _isLoading = true;
    notifyListeners();

    final result = await GalleryRepo.uploadImage(image);
    _isLoading = false;
    notifyListeners();
    return result;
  }
}
