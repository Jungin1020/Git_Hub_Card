import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dto/github_repo_dto_result.dart';

class GithubRepoApi {
  final String _url;

  GithubRepoApi(this._url);

  Future<List<GithubRepoDtoResult>> getGithubRepoResultDto() async {
    final response = await http.get(Uri.parse(_url));

    final List<Map<String, dynamic>> jsonList =
        List<Map<String, dynamic>>.from(jsonDecode(response.body));

    return jsonList.map((e) => GithubRepoDtoResult.fromJson(e)).toList();
  }
}
