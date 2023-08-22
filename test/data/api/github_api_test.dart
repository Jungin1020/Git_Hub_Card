import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_hub_card/data/api/github_api.dart';
import 'package:git_hub_card/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  test('Github api로부터 데이터가 잘 들어오는지 확인', () async {
    final api = GithubApi('');

    final dto = await api.getGithubResultDto();

    expect(dto.name, 'Jung in Cheh');
  });
}
