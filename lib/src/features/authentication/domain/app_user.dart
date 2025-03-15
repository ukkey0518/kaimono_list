import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';

/// Represents a user of the application.
@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required String email,
    required String? name,
  }) = _AppUser;

  const AppUser._();
}
