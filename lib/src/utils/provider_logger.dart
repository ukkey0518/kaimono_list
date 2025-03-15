import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/utils/app_logger.dart';
import 'package:kaimono_list/src/utils/debug_log.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';

class ProviderLogger extends ProviderObserver {
  static bool disabled = false;
  static bool namedOnly = true;
  static int maxStateLength = 500;

  static List<String> onlyMatched = [];

  static String? _limitedValueString(Object? value) {
    return value?.toString().replaceAll('\n', '').ellipsis(maxStateLength);
  }

  static void logInit(String providerName, Object? value) {
    if (disabled) return;
    if (onlyMatched.isNotEmpty && !onlyMatched.contains(providerName)) return;
    debugLog(
      '[Provider Init] $providerName { '
      'value: ${_limitedValueString(value)} '
      '}',
    );
  }

  static void logUpdate(
    String providerName,
    Object? previousValue,
    Object? newValue,
  ) {
    if (disabled) return;
    if (onlyMatched.isNotEmpty && !onlyMatched.contains(providerName)) return;
    debugLog(
      '[Provider Update] $providerName { '
      'prev: ${_limitedValueString(previousValue)}, '
      'new: ${_limitedValueString(newValue)} '
      '}',
    );
  }

  static void logDispose(String providerName) {
    if (disabled) return;
    if (onlyMatched.isNotEmpty && !onlyMatched.contains(providerName)) return;
    debugLog('[Provider Dispose] $providerName');
  }

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    final name = provider.name;
    if (namedOnly && name == null) return;
    logInit('${name ?? provider.runtimeType}', value);
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    final name = provider.name;
    if (namedOnly && provider.name == null) return;
    logUpdate('${name ?? provider.runtimeType}', previousValue, newValue);
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    final name = provider.name;
    if (namedOnly && name == null) return;
    logDispose('${name ?? provider.runtimeType}');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    AppLogger().captureException(error, stackTrace);
  }
}
