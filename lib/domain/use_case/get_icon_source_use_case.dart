import 'package:http/http.dart' as http;

class GetIconSourceUseCase {
  Future<String> execute(String language) async {
    final url =
        "https://cdn.jsdelivr.net/gh/devicons/devicon/icons/$language/$language-plain.svg";
    final response = await http.get(Uri.parse(url));
    // print(response.body);
    final svg = response.body;

    final fill = svg.substring(svg.indexOf('#') + 1, svg.indexOf('#') + 7);
    print(fill);
    return response.body;
  }
}
