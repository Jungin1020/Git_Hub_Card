import 'package:git_hub_card/domain/model/current_user_repo.dart';
import '../dto/github_repo_dto_result.dart';

extension ToUser on GithubRepoDtoResult {
  CurrentUserRepo toCurrentUserRepo() {
    return CurrentUserRepo(
      isForked: fork ?? false,
      language: language ?? '',
    );
  }
}
