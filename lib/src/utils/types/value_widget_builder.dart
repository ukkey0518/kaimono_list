import 'package:flutter/material.dart';

typedef AppValueWidgetBuilder<T> = Widget Function(
  BuildContext context,
  T value,
);

typedef App2ValueWidgetBuilder<T1, T2> = Widget Function(
  BuildContext context,
  T1 value1,
  T2 value2,
);
