import 'package:git_hub_card/data/api/devicon_api.dart';
import 'package:git_hub_card/data/mapper/logo_mapper.dart';
import 'package:git_hub_card/domain/model/logo.dart';
import 'package:git_hub_card/domain/repository/logo_repository.dart';

class LogoRepositoryImpl implements LogoRepository {
  final _api = DeviconApi();

  @override
  Future<List<Logo>> getLogos() async {
    final dtoList = await _api.getDeviconDtoResults();
    final logos = dtoList.map((e) => e.toLogo()).toList();

    return logos;
  }
}
