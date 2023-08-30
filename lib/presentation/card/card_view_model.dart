import 'package:flutter/material.dart';
import 'package:git_hub_card/domain/social_repository/social_repo_repository.dart';
import '../../domain/social_login/social_login.dart';
import '../../domain/social_repository/social_repository.dart';
import '../../domain/use_case/get_icon_source_use_case.dart';
import 'card_state.dart';

class CardViewModel with ChangeNotifier {
  final SocialRepository _repository;
  final SocialRepoRepository _repoRepository;
  final GetIconSourceUseCase _getIconSourceUseCase;

  final SocialLogin _socialLogin;

  CardViewModel(this._repository, this._socialLogin, this._repoRepository,
      this._getIconSourceUseCase) {
    fetchUser();
  }

  CardState _state = const CardState();

  CardState get state => _state;

  Future<void> fetchUser() async {
    _state = state.copyWith(isLoading: true, token: await _socialLogin.login());
    final user = await _repository.getUser(state.token);
    final repos = await _repoRepository.getUserRepos(user.githubReposUrl);
    _state = state.copyWith(
        currentUser: user, currentUserRepo: repos, isLoading: false);
    notifyListeners();
  }

  Future<String> getIconSource(String language) async {
    return _getIconSourceUseCase.execute(language);
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
