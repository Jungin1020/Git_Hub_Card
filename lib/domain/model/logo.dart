import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'logo.freezed.dart';

part 'logo.g.dart';

@freezed
class Logo with _$Logo {
  const factory Logo({
    required String name,
    required List<String> versions,
    required String color,
    required List<String> tags,
  }) = _Logo;

  factory Logo.fromJson(Map<String, Object?> json) => _$LogoFromJson(json);
}
