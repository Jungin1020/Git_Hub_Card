import 'package:git_hub_card/data/api/github_api.dart';
import 'package:git_hub_card/data/mapper/github_mapper.dart';
import 'package:git_hub_card/domain/model/current_user.dart';
import 'package:git_hub_card/domain/repository/social_repository.dart';

class GithubRepositoryImpl implements SocialRepository {
  @override
  Future<CurrentUser> getUser(String token) async {
    final api = GithubApi(token);
    final dto = await api.getGithubResultDto();
    return dto.toCurrentUser();
  }
}
