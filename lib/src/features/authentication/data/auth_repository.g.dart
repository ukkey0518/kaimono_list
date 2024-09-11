// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authRepositoryHash() => r'6f448e06dec5cfeb2a2324480f7c6d03b5daa360';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = Provider<AuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef AuthRepositoryRef = ProviderRef<AuthRepository>;
String _$currentUserHash() => r'4a821299f94f2563e7541629a28e0fb736795183';

/// See also [currentUser].
@ProviderFor(currentUser)
final currentUserProvider = Provider<AppUser?>.internal(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: <ProviderOrFamily>[authRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    authRepositoryProvider,
    ...?authRepositoryProvider.allTransitiveDependencies
  },
);

typedef CurrentUserRef = ProviderRef<AppUser?>;
String _$authStateChangesStreamHash() =>
    r'146d12b237aa1c9538c15d136918cf61f9e298a5';

/// See also [authStateChangesStream].
@ProviderFor(authStateChangesStream)
final authStateChangesStreamProvider = StreamProvider<AppUser?>.internal(
  authStateChangesStream,
  name: r'authStateChangesStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authStateChangesStreamHash,
  dependencies: <ProviderOrFamily>[authRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    authRepositoryProvider,
    ...?authRepositoryProvider.allTransitiveDependencies
  },
);

typedef AuthStateChangesStreamRef = StreamProviderRef<AppUser?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
