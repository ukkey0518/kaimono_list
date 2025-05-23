import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaimono_list/firebase_options.dart';
import 'package:kaimono_list/src/app.dart';
import 'package:kaimono_list/src/utils/app_logger.dart';
import 'package:kaimono_list/src/utils/provider_logger.dart';
import 'package:kaimono_list/src/utils/shared_pref_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Error Handler: 未キャッチエラー
  // https://firebase.google.com/docs/crashlytics/customize-crash-reports?hl=ja&platform=flutter#report-uncaught-exceptions
  FlutterError.onError = (ed) {
    FlutterError.presentError(ed);
    AppLogger().captureException(ed.exception, ed.stack);
  };

  // Error Handler: 非同期エラー
  // https://firebase.google.com/docs/crashlytics/customize-crash-reports?hl=ja&platform=flutter#asynchronous-errors
  PlatformDispatcher.instance.onError = (e, s) {
    AppLogger().captureException(e, s);
    return true;
  };

  // エラーウィジェット
  ErrorWidget.builder = (details) => const Icon(Icons.error);

  final sharedPreferences = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(),
  );

  runApp(
    ProviderScope(
      observers: [ProviderLogger()],
      overrides: [sharedPrefProvider.overrideWithValue(sharedPreferences)],
      child: const App(),
    ),
  );
}
