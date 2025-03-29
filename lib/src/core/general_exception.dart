class GeneralException implements Exception {
  GeneralException({required this.message});

  final String message;

  @override
  String toString() {
    return 'GeneralException: $message';
  }
}
