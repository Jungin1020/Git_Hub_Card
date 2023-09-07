import 'package:flutter/material.dart';
import 'package:git_hub_card/domain/repository/logo_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/repository/social_repo_repository.dart';
import '../../domain/repository/social_repository.dart';
import '../../domain/social_login/social_login.dart';
import '../../domain/use_case/sort_languages_use_case.dart';
import 'card_state.dart';

class CardViewModel with ChangeNotifier {
  final SocialRepository _repository;
  final SocialRepoRepository _repoRepository;
  final LogoRepository _logoRepository;

  final SocialLogin _socialLogin;

  CardViewModel(this._repository, this._socialLogin, this._repoRepository,
      this._logoRepository) {
    // fetchUser();
    // getLogos();
    fetchUserAndLogos();
  }

  CardState _state = const CardState();

  CardState get state => _state;

  // Future<void> fetchUser() async {
  //   _state = state.copyWith(isLoading: true, token: await _socialLogin.login());
  //   final user = await _repository.getUser(state.token);
  //   final repos = await _repoRepository.getUserRepos(user.githubReposUrl);
  //   _state = state.copyWith(
  //       currentUser: user, currentUserRepo: repos, isLoading: false);
  //   notifyListeners();
  // }
  //
  // Future<void> getLogos() async {
  //   _state = state.copyWith(isLoading: true);
  //   final logos = await _logoRepository.getLogos();
  //   _state = state.copyWith(isLoading: false, logos: logos);
  //   notifyListeners();
  // }

  Future<void> fetchUserAndLogos() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _state = state.copyWith(isLoading: true, token: await _socialLogin.login());

    final user = await _repository.getUser(state.token);
    final repos = await _repoRepository.getUserRepos(user.githubReposUrl);
    final logos = await _logoRepository.getLogos();

    prefs.getStringList('languages') ??
        await prefs.setStringList(
            'languages', sortLanguagesUseCase(repos, logos));

    _state = state.copyWith(
      currentUser: user,
      currentUserRepo: repos,
      logos: logos,
      languages: prefs.getStringList('languages')!,
      isLoading: false,
    );
    notifyListeners();
  }

  Future<void> fetchLanguages(List<String> languages) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('languages', languages);
    // print(prefs.getStringList('languages'));

    _state = state.copyWith(
      languages: prefs.getStringList('languages')!,
    );
    notifyListeners();
  }

  Future<void> removePreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('languages');
    // print('removed ${prefs.getStringList('languages')}');
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
