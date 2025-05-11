import 'dart:async';
import 'package:flutter/foundation.dart';

class RouterRefreshStreamNotifier extends ChangeNotifier {
  RouterRefreshStreamNotifier(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
