class ModelValidationException implements Exception {
  ModelValidationException(this.message, this.data);

  final String message;
  final dynamic data;

  @override
  String toString() => 'ModelValidationException: $message {data: $data}';
}
