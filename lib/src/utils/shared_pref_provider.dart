import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_pref_provider.g.dart';

@Riverpod(
  dependencies: [],
  keepAlive: true,
)
SharedPreferencesWithCache sharedPref(SharedPrefRef ref) {
  throw UnimplementedError();
}
