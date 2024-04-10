import 'package:hu_task/core/di/di.dart';
import 'package:hu_task/core/services/alerts.dart';
import 'package:hu_task/core/networking/api_service.dart';
import 'package:hu_task/core/networking/endpoints.dart';
import 'package:hu_task/features/login/data/models/user_model.dart';

class LoginRepo {
  static Future<User?> login(String email, String password) async {
    final response = await di<ApiService>().post(
        endPoint: Endpoints.login,
        requestBody: {'email': email, 'password': password});
    if (response.statusCode == 200 && response.data['user'] != null) {
      final user = User.fromJson(response.data['user']);
      ApiService.token = response.data['token'];
      return user;
    } else {
      Alerts.showToaster(
          response.data['error_message'] ?? 'Invalid Credntials');
      return null;
    }
  }
}
