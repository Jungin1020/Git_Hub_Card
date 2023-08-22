abstract interface class SocialLogin {
  Future<String> login();

  Future<bool> logout();
}
