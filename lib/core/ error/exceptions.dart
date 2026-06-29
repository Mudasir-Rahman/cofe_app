// lib/core/error/exceptions.dart

abstract class AppException implements Exception {
  final String message;

  const AppException({required this.message});

  @override
  String toString() => message;
}

/// No internet connection
class NetworkException extends AppException {
  const NetworkException([String? message])
      : super(message: message ?? 'No Internet Connection');
}

/// Generic server/API error
class ServerException extends AppException {
  const ServerException([String? message])
      : super(message: message ?? 'Server Error');
}

/// Invalid request (HTTP 400)
class BadRequestException extends AppException {
  const BadRequestException([String? message])
      : super(message: message ?? 'Bad Request');
}

/// Authentication/Authorization failed (HTTP 401)
class UnauthorizedException extends AppException {
  const UnauthorizedException([String? message])
      : super(message: message ?? 'Unauthorized');
}

/// Requested resource not found (HTTP 404)
class NotFoundException extends AppException {
  const NotFoundException([String? message])
      : super(message: message ?? 'Resource Not Found');
}

/// Resource already exists (HTTP 409)
class ConflictException extends AppException {
  const ConflictException([String? message])
      : super(message: message ?? 'Conflict');
}

/// Invalid user input
class ValidationException extends AppException {
  const ValidationException([String? message])
      : super(message: message ?? 'Invalid Input');
}

/// Local cache error
class CacheException extends AppException {
  const CacheException([String? message])
      : super(message: message ?? 'Cache Error');
}

/// Local database error
class DatabaseException extends AppException {
  const DatabaseException([String? message])
      : super(message: message ?? 'Database Error');
}

/// Any unexpected error
class UnknownException extends AppException {
  const UnknownException([String? message])
      : super(message: message ?? 'Something Went Wrong');
}