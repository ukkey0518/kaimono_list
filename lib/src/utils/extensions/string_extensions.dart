extension CommonStringEx on String {
  /// 指定の長さを超える文字列を省略する
  String ellipsis(int limit) {
    if (limit >= length) {
      return this;
    }
    return '${substring(0, limit)}...';
  }
}

extension StringHardcodedEx on String {
  String get hardcoded => this;
}
