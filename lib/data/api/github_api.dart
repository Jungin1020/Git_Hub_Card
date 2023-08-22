import 'dart:convert';

import '../dto/github_dto_result.dart';
import 'package:http/http.dart' as http;

class GithubApi {
  final String _token;

  GithubApi(this._token);

  Future<GithubDtoResult> getGithubResultDto() async {
    const api = 'https://api.github.com/user';
    // final response = await http.get(Uri.parse(api));
    final response = await http
        .get(Uri.parse(api), headers: {'Authorization': 'Bearer $_token'});

    return GithubDtoResult.fromJson(jsonDecode(response.body));
  }
}
