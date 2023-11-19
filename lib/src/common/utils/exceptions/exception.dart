class FakeApiException implements Exception {
  final String message;
  final int statusCode;

  FakeApiException(this.message, this.statusCode);
}
