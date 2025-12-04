import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/src/utils/extensions/async_value_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

extension WidgetRefEx on WidgetRef {
  void listenAsyncError<T>(
    ProviderListenable<AsyncValue<T>> provider,
    void Function(Object error, StackTrace? stackTrace) listener, {
    void Function(Object error, StackTrace stackTrace)? onError,
  }) {
    return listen(
      provider,
      (_, state) => state.handleError(listener),
      onError: onError,
    );
  }
}
