import 'package:flutter/foundation.dart';
import 'package:hu_task/features/login/data/models/user_model.dart';
import 'package:hu_task/features/login/data/repo/login_repo.dart';

class LoginProvider extends ChangeNotifier {
  static User? user;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<bool> login({required String email, required String password}) async {
    user = null;
    _isLoading = true;
    notifyListeners();
    user = await LoginRepo.login(email, password);
    _isLoading = false;
    notifyListeners();
    return user != null;
  }
}
