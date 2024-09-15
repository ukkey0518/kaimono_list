class PermissionDeniedException implements Exception {
  PermissionDeniedException(this.message, this.data);

  final String message;
  final dynamic data;

  @override
  String toString() => 'PermissionDeniedException: $message {data: $data}';
}
