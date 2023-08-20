import 'package:flutter/material.dart';
import 'package:git_hub_card/data/github_login.dart';
import 'package:git_hub_card/domain/social_login.dart';

import 'login_state.dart';

class LoginViewModel with ChangeNotifier {
  final SocialLogin _socialLogin = GithubLogin();
  LoginState _state = const LoginState();
  LoginState get state => _state;

  void login() async {
    _state = state.copyWith(
        isLogin: await _socialLogin.login(),
        loginPlatform: LoginPlatform.github);
    notifyListeners();
  }

  void logout() async {
    _state = state.copyWith(
        isLogin: !(await _socialLogin.logout()),
        loginPlatform: LoginPlatform.none);
    notifyListeners();
  }
}
