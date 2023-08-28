import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'current_user_repo.freezed.dart';

part 'current_user_repo.g.dart';

@freezed
class CurrentUserRepo with _$CurrentUserRepo {
  const factory CurrentUserRepo({
    required bool isForked,
    required String language,
  }) = _CurrentUserRepo;

  factory CurrentUserRepo.fromJson(Map<String, Object?> json) =>
      _$CurrentUserRepoFromJson(json);
}
