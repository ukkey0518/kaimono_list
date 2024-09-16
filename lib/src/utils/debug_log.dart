import 'package:flutter/foundation.dart';

void debugLog(dynamic value) {
  if (kDebugMode) {
    debugPrint('$value');
  }
}
