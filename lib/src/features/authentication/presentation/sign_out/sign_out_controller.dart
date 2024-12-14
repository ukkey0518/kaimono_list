import 'package:kaimono_list/src/features/authentication/data/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_out_controller.g.dart';

@Riverpod(
  dependencies: [
    authRepository,
  ],
)
class SignOutController extends _$SignOutController {
  @override
  FutureOr<void> build() async => null;

  Future<void> signOut() async {
    final authRepository = ref.read(authRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(authRepository.signOut);
  }
}
