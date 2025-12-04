import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/utils/app_logger.dart';
import 'package:kaimono_list/src/utils/debug_log.dart';
import 'package:kaimono_list/src/utils/extensions/string_extensions.dart';

final class ProviderLogger extends ProviderObserver {
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
  void didAddProvider(ProviderObserverContext context, Object? value) {
    final name = context.provider.name;
    if (namedOnly && name == null) return;
    logInit('${name ?? context.provider.runtimeType}', value);
  }

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    final name = context.provider.name;
    if (namedOnly && context.provider.name == null) return;
    logUpdate(
      '${name ?? context.provider.runtimeType}',
      previousValue,
      newValue,
    );
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    final name = context.provider.name;
    if (namedOnly && context.provider.name == null) return;
    logDispose('${name ?? context.provider.runtimeType}');
  }

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    AppLogger().captureException(error, stackTrace);
  }
}
