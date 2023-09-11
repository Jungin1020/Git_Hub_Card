import 'dart:async';
import 'package:flutter/material.dart';
import '../../domain/social_login/social_login.dart';
import 'login_state.dart';

class LoginViewModel with ChangeNotifier {
  final SocialLogin _socialLogin;

  LoginViewModel(this._socialLogin);

  LoginState _state = const LoginState();

  LoginState get state => _state;

  Future<String> login() async {
    _state = state.copyWith(
      isLoading: true,
    );
    final String token = await _socialLogin.login();
    _state = state.copyWith(
      isLoading: false,
      loginPlatform: LoginPlatform.github,
    );

    notifyListeners();

    return token;
  }
}
