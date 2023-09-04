import 'package:git_hub_card/domain/use_case/word_symbol_switch_use_case.dart';

import '../model/current_user_repo.dart';
import '../model/logo.dart';

List<String> sortLanguagesUseCase(
    List<CurrentUserRepo> repo, List<Logo> logos) {
  final deviconLogoNames = logos.map((e) => e.name).toList();
  final Map<String, int> languageCount = {};
  final List<String> result = ['git', 'git', 'git'];

  final List<String> languages =
      repo.map((e) => e.language).where((e) => e.isNotEmpty).toList();

  for (String lang in languages) {
    languageCount[lang] = (languageCount[lang] ?? 0) + 1;
  }

  if (languageCount.isEmpty) {
    return [];
  }
  // github repos 에서 가져온 languages
  List<String> githubLanguages = languageCount.keys.toList()
    ..sort((a, b) => languageCount[b]!.compareTo(languageCount[a]!));

  int count = 0;

  for (String lang in githubLanguages) {
    String newLang = WordSymbolSwitchUseCase().symbolToWord(lang);

    if (deviconLogoNames.contains(newLang)) {
      // print('Devicon이 $newLang을 포함하고 있습니다.');
      result[count] = newLang;
      count++;
    } else {
      // print('Devicon이 $newLang을 포함하고 있지 않습니다.');
    }

    if (count == 2) {
      break;
    }
  }
  return result;
}
