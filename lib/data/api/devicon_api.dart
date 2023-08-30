import 'dart:convert';

import 'package:git_hub_card/data/dto/devicon_dto_result.dart';
import 'package:http/http.dart' as http;

class DeviconApi {
  final _url =
      'https://raw.githubusercontent.com/devicons/devicon/master/devicon.json';

  Future<List<DeviconDtoResult>> getDeviconDtoResults() async {
    final response = await http.get(Uri.parse(_url));

    final jsonList = List<Map<String, dynamic>>.from(jsonDecode(response.body));

    return jsonList.map((e) => DeviconDtoResult.fromJson(e)).toList();
  }
}
