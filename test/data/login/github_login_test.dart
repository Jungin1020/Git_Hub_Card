import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_hub_card/data/login/github_login.dart';
import 'package:git_hub_card/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  test('깃헙 로그인이 잘 되는지 확인', () async {
    final githubLogin = GithubLogin();
    await githubLogin.login();
    final userDisplayName = FirebaseAuth.instance.currentUser!.displayName;

    expect('Jungin1020', userDisplayName);
  });
}
