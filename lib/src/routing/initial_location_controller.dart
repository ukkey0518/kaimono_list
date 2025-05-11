import 'package:kaimono_list/src/utils/shared_pref_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'initial_location_controller.g.dart';

const _initialLocationKey = 'initialLocation';
const _initialLocationDefaultValue = '/';

@Riverpod(dependencies: [sharedPref])
class InitialLocationController extends _$InitialLocationController {
  @override
  String build() {
    final sharedPref = ref.watch(sharedPrefProvider);
    return sharedPref.getString(_initialLocationKey) ??
        _initialLocationDefaultValue;
  }

  Future<void> setInitialLocation(String location) {
    return ref
        .read(sharedPrefProvider)
        .setString(_initialLocationKey, location);
  }
}
