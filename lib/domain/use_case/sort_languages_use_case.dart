import '../model/current_user_repo.dart';

List<String> sortLanguagesUseCase(List<CurrentUserRepo> repo) {
  final Map<String, int> languageCount = {};

  final List<String> languages =
      repo.map((e) => e.language).where((e) => e.isNotEmpty).toList();

  for (String lang in languages) {
    languageCount[lang] = (languageCount[lang] ?? 0) + 1;
  }

  if (languageCount.isEmpty) {
    return [];
  }

  return languageCount.keys.toList()
    ..sort((a, b) => languageCount[b]!.compareTo(languageCount[a]!));
}
