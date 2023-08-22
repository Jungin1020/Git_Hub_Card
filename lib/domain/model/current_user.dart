import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'current_user.freezed.dart';

part 'current_user.g.dart';

@freezed
class CurrentUser with _$CurrentUser {
  const factory CurrentUser({
    required String name,
    required String displayName,
    required String avatarUrl,
    required String githubUrl,
    required String githubReposUrl,
    required String email,
    required String company,
    required String blog,
    required String location,
    required String twitter,
    required num followers,
    required num following,
  }) = _CurrentUser;

  factory CurrentUser.fromJson(Map<String, Object?> json) =>
      _$CurrentUserFromJson(json);
}
