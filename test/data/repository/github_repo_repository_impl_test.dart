import 'package:flutter_test/flutter_test.dart';
import 'package:git_hub_card/data/repository/github_repo_repository_impl.dart';

void main() {
  test('userRepo 데이터가 잘 변환되는지 확인', () async {
    const url = 'https://api.github.com/users/Jungin1020/repos';
    final repository = GithubRepoRepositoryImpl();
    final userRepos = await repository.getUserRepos(url);
    expect(userRepos[0].language, 'Jupyter Notebook');
  });
}
