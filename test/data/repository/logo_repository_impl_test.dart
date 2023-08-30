import 'package:flutter_test/flutter_test.dart';
import 'package:git_hub_card/data/api/devicon_api.dart';
import 'package:git_hub_card/data/repository/logo_repository_impl.dart';

void main() {
  test(
    'logo 데이터가 잘 들어오는지 확인',
    () async {
      final repository = LogoRepositoryImpl(DeviconApi());
      final logos = await repository.getLogos();

      expect(logos[0].name, 'adonisjs');
    },
  );
}
