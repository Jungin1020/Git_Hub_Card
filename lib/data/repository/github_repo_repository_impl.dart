import 'package:git_hub_card/data/api/github_repo_api.dart';
import 'package:git_hub_card/data/mapper/github_repo_mapper.dart';
import 'package:git_hub_card/domain/model/current_user_repo.dart';
import 'package:git_hub_card/domain/social_repository/social_repo_repository.dart';

class GithubRepoRepositoryImpl implements SocialRepoRepository {
  @override
  Future<List<CurrentUserRepo>> getUserRepos(String url) async {
    final api = GithubRepoApi(url);
    final dtoList = await api.getGithubRepoResultDto();

    final userRepos = dtoList.map((e) => e.toCurrentUserRepo()).toList();

    return userRepos;
  }
}
