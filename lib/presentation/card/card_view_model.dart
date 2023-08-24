import 'package:flutter/material.dart';
import '../../domain/social_login/social_login.dart';
import '../../domain/social_repository/social_repository.dart';
import 'card_state.dart';

class CardViewModel with ChangeNotifier {
  final SocialRepository _repository;

  final SocialLogin _socialLogin;

  CardViewModel(this._repository, this._socialLogin) {
    fetchUser();
  }

  CardState _state = const CardState();

  CardState get state => _state;

  Future<void> fetchUser() async {
    _state = state.copyWith(isLoading: true, token: await _socialLogin.login());
    final user = await _repository.getUser(state.token);
    _state = state.copyWith(currentUser: user, isLoading: false);
    notifyListeners();
  }

  void showBottomMenuBar() {
    _state = state.copyWith(isBottomMenu: true);
    notifyListeners();
  }

  void unShowBottomMenuBar() {
    _state = state.copyWith(isBottomMenu: false);
    notifyListeners();
  }
}
