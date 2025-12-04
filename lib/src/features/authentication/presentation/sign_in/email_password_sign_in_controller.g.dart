// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_password_sign_in_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EmailPasswordSignInController)
const emailPasswordSignInControllerProvider =
    EmailPasswordSignInControllerProvider._();

final class EmailPasswordSignInControllerProvider
    extends $AsyncNotifierProvider<EmailPasswordSignInController, void> {
  const EmailPasswordSignInControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'emailPasswordSignInControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$emailPasswordSignInControllerHash();

  @$internal
  @override
  EmailPasswordSignInController create() => EmailPasswordSignInController();
}

String _$emailPasswordSignInControllerHash() =>
    r'a9873034cbf3cc753e8fd167af310dae7b851d50';

abstract class _$EmailPasswordSignInController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
