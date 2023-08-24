import 'package:flutter/material.dart';
import 'login_state.dart';

class LoginViewModel with ChangeNotifier {
  // final SocialLogin _socialLogin = GithubLogin();
  LoginState _state = const LoginState();

  LoginState get state => _state;

  Future<void> login() async {
    _state = state.copyWith(
      // token: await _socialLogin.login(),
      isLogin: true,
      loginPlatform: LoginPlatform.github,
    );
    notifyListeners();
  }

  Future<void> logout() async {
    // await _socialLogin.logout();
    _state = state.copyWith(
      isLogin: false,
      loginPlatform: LoginPlatform.none,
    );
    notifyListeners();
  }
}
