import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'login_state.freezed.dart';

part 'login_state.g.dart';

enum LoginPlatform {
  github,
  none,
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String token,
    @Default(false) bool isLoading,
    // @Default(false) bool isLogin,
    @Default(LoginPlatform.none) LoginPlatform loginPlatform,
  }) = _LoginState;

  factory LoginState.fromJson(Map<String, Object?> json) =>
      _$LoginStateFromJson(json);
}
