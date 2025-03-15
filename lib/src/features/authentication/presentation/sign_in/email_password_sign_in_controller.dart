import 'package:kaimono_list/src/features/authentication/data/auth_repository.dart';
import 'package:kaimono_list/src/features/authentication/presentation/sign_in/email_password_sign_in_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'email_password_sign_in_controller.g.dart';

@riverpod
class EmailPasswordSignInController extends _$EmailPasswordSignInController {
  @override
  FutureOr<void> build() => null;

  /// Submits the form with the provided email and password.
  /// Returns `true` if the submission was successful, `false` otherwise.
  Future<bool> submit(
    EmailPasswordSignInType type,
    String email,
    String password,
  ) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await _authenticate(type, email, password);
    });

    return !state.hasError;
  }

  /// Authenticates the user with the provided email and password.
  /// The authentication type is determined by the provided [type].
  Future<void> _authenticate(
    EmailPasswordSignInType type,
    String email,
    String password,
  ) async {
    final authRepository = ref.read(authRepositoryProvider);

    switch (type) {
      case EmailPasswordSignInType.signIn:
        await authRepository.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      case EmailPasswordSignInType.register:
        await authRepository.registerWithEmailAndPassword(
          email: email,
          password: password,
        );
    }
  }
}
