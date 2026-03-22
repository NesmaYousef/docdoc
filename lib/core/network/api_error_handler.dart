import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Connection to server failed");
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request to the server was cancelled");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "Connection timeout with the server");
        case DioExceptionType.unknown:
          return ApiErrorModel(
              message:
              "Connection to the server failed due to internet connection");
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              message: "Receive timeout in connection with the server");
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              message: "Send timeout in connection with the server");
        default:
          return ApiErrorModel(message: "Something went wrong");
      }
    } else {
      return ApiErrorModel(message: "Unknown error occurred");
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  return ApiErrorModel(
    message: _extractMessage(data),
    code: data is Map<String, dynamic> ? data['code'] : null,
    errors: _extractErrors(data),
  );
}

String _extractMessage(dynamic data) {
  if (data is Map<String, dynamic>) {
    return data['message'] ?? "Unknown error occurred";
  }
  return "Unknown error occurred";
}

Map<String, List<String>>? _extractErrors(dynamic data) {
  if (data == null || data is! Map<String, dynamic>) return null;

  final errorData = data['data'];
  if (errorData == null) return null;

  if (errorData is Map<String, dynamic>) {
    return errorData.map((key, value) {
      if (value is List) {
        return MapEntry(key, value.map((e) => e.toString()).toList());
      } else {
        return MapEntry(key, [value.toString()]);
      }
    });
  }

  if (errorData is List) {
    return {'error': errorData.map((e) => e.toString()).toList()};
  }

  return {'error': [errorData.toString()]};
}