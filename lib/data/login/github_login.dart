import 'package:firebase_auth/firebase_auth.dart';
import 'package:git_hub_card/domain/social_login/social_login.dart';

class GithubLogin implements SocialLogin {
  @override
  Future<String> login() async {
    try {
      final result = await _signInWithGitHub();
      final githubToken = result.credential?.accessToken ?? '';

      return githubToken;
    } catch (e) {
      return '';
    }
  }

  @override
  Future<bool> logout() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signOut();

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UserCredential> _signInWithGitHub() async {
    // Create a new provider
    GithubAuthProvider githubProvider = GithubAuthProvider();

    return await FirebaseAuth.instance.signInWithProvider(githubProvider);
  }
}
