class HomeException implements Exception {
  final String message;

  HomeException({required this.message});

  @override
  String toString() {
    return message;
  }
}
