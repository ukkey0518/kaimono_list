// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_location_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(InitialLocationController)
const initialLocationControllerProvider = InitialLocationControllerProvider._();

final class InitialLocationControllerProvider
    extends $NotifierProvider<InitialLocationController, String> {
  const InitialLocationControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'initialLocationControllerProvider',
        isAutoDispose: true,
        dependencies: const <ProviderOrFamily>[sharedPrefProvider],
        $allTransitiveDependencies: const <ProviderOrFamily>[
          InitialLocationControllerProvider.$allTransitiveDependencies0,
        ],
      );

  static const $allTransitiveDependencies0 = sharedPrefProvider;

  @override
  String debugGetCreateSourceHash() => _$initialLocationControllerHash();

  @$internal
  @override
  InitialLocationController create() => InitialLocationController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$initialLocationControllerHash() =>
    r'b3e0593d4f12342a2987a11ad83a800fcc6b6086';

abstract class _$InitialLocationController extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
