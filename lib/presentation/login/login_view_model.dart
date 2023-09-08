import 'package:flutter/material.dart';
import '../../domain/social_login/social_login.dart';
import 'login_state.dart';

class LoginViewModel with ChangeNotifier {
  final SocialLogin _socialLogin;

  LoginViewModel(this._socialLogin);

  LoginState _state = const LoginState();

  LoginState get state => _state;

  Future<String> login() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = await _socialLogin.login();
    _state = state.copyWith(
      // token: await _socialLogin.login(),
      // isLogin: true,
      loginPlatform: LoginPlatform.github,
    );
    notifyListeners();

    return token;
  }
  //
  // Future<void> logout() async {
  //   // await _socialLogin.logout();
  //   _state = state.copyWith(
  //     // isLogin: false,
  //     loginPlatform: LoginPlatform.none,
  //   );
  //   notifyListeners();
  // }
}
