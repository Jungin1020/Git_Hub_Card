import 'package:git_hub_card/domain/model/logo.dart';

abstract interface class LogoRepository {
  Future<List<Logo>> getLogos();
}
