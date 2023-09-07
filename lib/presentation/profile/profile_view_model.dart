import 'package:flutter/material.dart';
import 'package:git_hub_card/presentation/profile/profile_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewModel with ChangeNotifier {
  ProfileState _state = const ProfileState();

  ProfileState get state => _state;

  ProfileViewModel() {
    loadSavedLanguages();
  }

  Future<void> loadSavedLanguages() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    _state = state.copyWith(
        languages: prefs.getStringList('languages') ?? ['git', 'git', 'git']);

    notifyListeners();
  }

  Future<void> updateLanguages(String language, int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> languages =
        prefs.getStringList('languages') ?? ['git', 'git', 'git'];
    languages[index] = language;

    _state = state.copyWith(languages: languages);
    prefs.setStringList('languages', languages);

    notifyListeners();
  }
}
