import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import 'package:hu_task/core/di/di.dart';
import 'package:hu_task/core/services/alerts.dart';
import 'package:hu_task/core/networking/api_service.dart';
import 'package:hu_task/core/networking/endpoints.dart';

class GalleryRepo {
  static Future<List<dynamic>?> getImages() async {
    List<dynamic>? images;
    final response = await di<ApiService>().get(endPoint: Endpoints.myGallery);
    if (response.statusCode == 200 && response.data['status'] == 'success') {
      images = response.data['data']["images"];
      Alerts.showToaster(response.data['message']);
      return images;
    } else {
      Alerts.showToaster(
          response.data['error_message'] ?? 'Something went wrong!');
      return null;
    }
  }

  static Future<bool> uploadImage(String path) async {
    final img = await MultipartFile.fromFile(path,
        contentType: MediaType('image', path.split('.').last));
    final body = FormData.fromMap({'img': img});
    final response = await di<ApiService>()
        .post(endPoint: Endpoints.upload, requestBody: body);
    if (response.statusCode == 200 && response.data['status'] == 'success') {
      Alerts.showToaster(response.data['message']);
      return true;
    } else {
      Alerts.showToaster(
          response.data['error_message'] ?? 'Something went wrong!');
      return false;
    }
  }
}
