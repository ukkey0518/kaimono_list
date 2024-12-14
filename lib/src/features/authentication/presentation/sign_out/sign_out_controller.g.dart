// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_out_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signOutControllerHash() => r'6d6a597d7164a98c7e516aac761bf34833e4e8db';

/// See also [SignOutController].
@ProviderFor(SignOutController)
final signOutControllerProvider =
    AutoDisposeAsyncNotifierProvider<SignOutController, void>.internal(
  SignOutController.new,
  name: r'signOutControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signOutControllerHash,
  dependencies: <ProviderOrFamily>[authRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    authRepositoryProvider,
    ...?authRepositoryProvider.allTransitiveDependencies
  },
);

typedef _$SignOutController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
