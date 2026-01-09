/// Base failure class for error handling
abstract class Failure {
  final String message;
  const Failure(this.message);
}

/// Network-related failures
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

/// Server-related failures
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

/// Location-related failures
class LocationFailure extends Failure {
  const LocationFailure(super.message);
}

/// Validation failures
class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

/// Unknown failures
class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}
