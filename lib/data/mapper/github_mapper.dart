import 'package:git_hub_card/data/dto/github_dto_result.dart';

import '../../domain/model/current_user.dart';

extension ToUser on GithubDtoResult {
  CurrentUser toCurrentUser() {
    return CurrentUser(
      name: name ?? '',
      displayName: login ?? '',
      avatarUrl: avatarUrl ?? '',
      githubUrl: url ?? '',
      githubReposUrl: reposUrl ?? '',
      email: email ?? '',
      company: company ?? '',
      blog: blog ?? '',
      location: location ?? '',
      twitter: twitterUsername ?? '',
      followers: followers ?? 0,
      following: following ?? 0,
    );
  }
}
