abstract class Failure {
  final String message ;
  const Failure({required this.message});
}

class ServerFailure extends Failure {
  const ServerFailure([String? message]) : super(message: message ?? 'Server Error');
}

class NetworkFailure extends Failure {
  const NetworkFailure([String? message]) : super(message: message ?? 'No Internet Connection');
}
class BadRequestFailure extends Failure {
  const BadRequestFailure([String? message]) : super(message: message ?? 'Bad Request');
}
class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([String? message]) : super(message: message ?? 'Unauthorized');
}
class NotFoundFailure extends Failure {
  const NotFoundFailure([String? message]) : super(message: message ?? 'Resource Not Found');
}
class ConflictFailure extends Failure {
  const ConflictFailure([String? message]) : super(message: message ?? 'Conflict');
}
class ValidationFailure extends Failure {
  const ValidationFailure([String? message]) : super(message: message ?? 'Invalid Input');
}
class CacheFailure extends Failure {
  const CacheFailure([String? message]) : super(message: message ?? 'Cache Error');
}
class DatabaseFailure extends Failure {
  const DatabaseFailure([String? message]) : super(message: message ?? 'Database Error');
}
class UnknownFailure extends Failure {
  const UnknownFailure([String? message]) : super(message: message ?? 'Something Went Wrong');
}
