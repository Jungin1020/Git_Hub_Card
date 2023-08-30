import '../model/current_user.dart';

abstract interface class SocialRepository {
  Future<CurrentUser> getUser(String token);
}
