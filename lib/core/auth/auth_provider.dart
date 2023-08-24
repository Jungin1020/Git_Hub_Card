import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  bool _isLogin = false;

  bool get isLogin => _isLogin;

  void login() {
    _isLogin = true;
    notifyListeners();
  }

  void logout() {
    _isLogin = false;
    notifyListeners();
  }
}
