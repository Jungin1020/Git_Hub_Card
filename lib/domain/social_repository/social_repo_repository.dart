import 'package:git_hub_card/domain/model/current_user_repo.dart';

abstract interface class SocialRepoRepository {
  Future<List<CurrentUserRepo>> getUserRepos(String url);
}
