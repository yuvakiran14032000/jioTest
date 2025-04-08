abstract class Success {
  final String successMessage;

  Success({required this.successMessage});
}

class ServerSuccess extends Success {
  ServerSuccess({required super.successMessage});
}

class CacheSuccess extends Success {
  CacheSuccess({required super.successMessage});
}
