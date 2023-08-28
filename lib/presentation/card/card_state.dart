import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:git_hub_card/domain/model/current_user.dart';
import 'package:git_hub_card/domain/model/current_user_repo.dart';

part 'card_state.freezed.dart';

part 'card_state.g.dart';

@freezed
class CardState with _$CardState {
  const factory CardState({
    @Default(false) bool isLoading,
    @Default(false) bool isBottomMenu,
    @Default('') String token,
    CurrentUser? currentUser,
    List<CurrentUserRepo>? currentUserRepo,
  }) = _CardState;

  factory CardState.fromJson(Map<String, Object?> json) =>
      _$CardStateFromJson(json);
}
