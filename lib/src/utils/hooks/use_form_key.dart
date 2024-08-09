import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

GlobalKey<FormState> useFormKey([List<Object?> keys = const []]) {
  return useMemoized(GlobalKey<FormState>.new, keys);
}
