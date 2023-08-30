import 'package:git_hub_card/data/dto/devicon_dto_result.dart';

import '../../domain/model/logo.dart';

extension ToLogo on DeviconDtoResult {
  Logo toLogo() {
    return Logo(
      name: name ?? '',
      versions: versions!.svg ?? [],
      color: color ?? '',
      tags: tags ?? [],
    );
  }
}
